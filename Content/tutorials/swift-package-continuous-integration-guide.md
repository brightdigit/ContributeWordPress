---
title: Swift Package Continuous Integration Guide
date: 2020-03-02 05:00
description: Swift Packages offer an easy manageable way to share code and functionality.
  We are going to show you how to setup Swift package continuous integration.
tags: continuous-integration, swift-package
featuredImage: /media/images/learningswift/2020/02/TravisCI-Full-Color-2.png
---
Swift packages offer an easy manageable way to share code and
functionality. If you wish to create your own package, it’s important to
make sure your code works where it's supposed to and the quality is
good. Most importantly, continuous integration is a great way to ensure
that. If you are interested in learning why continuous integration is
important, [check out this article on avoiding *merge
hell*](https://brightdigit.com/blog/2020/03/02/ios-continuous-integration-avoid-merge-hell/).
Therefore, in this article I am going to show you how to setup Swift
package continuous integration.

Specifically, I am going to break down the following:

-   **[Basics of Creating a Package](#getting-started)**
-   [**Designating Platforms and Operating
    Systems**](#specifying-platforms-devices)
-   [**Setting Up Travis-CI and GitHub
    Actions**](#continuous-integration)
-   **[Adding Linux Support](#linux-ci)**
-   [**Testing and Code Coverage**](#testing)
-   **[Linting, Formatting, and Code Quality](#code-quality)**
-   **[Automating Code Documentation](#documentation)**
-   **[Distributing and Sharing](#distrbuting)**
-   **[Samples and Examples](#examples-integration)**

What's important to realize is that Swift packages are reusable pieces
of code which encapsulate a set of functionality. In the end, there are
two ways to create a Swift package: via *Xcode* or command line.

## Getting Started

Under the Xcode menu, go to `File > New > Swift Package` and follow the
corresponding dialog. Alternatively, you can use the swift command line
tool to create your package. First, create an empty directory and run
the create package subcommand:

    > mkdir New-Package
    > swift package init

In the end, you should have:

-   A *Source* directory for your main source code
-   A *Tests* directory for your testing code
-   A *Package.swift* containing the configuration in Swift of your code

## Specifying Platforms and Devices

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/03/platforms-and-devices.png" class="wp-image-871" width="1864" height="878" />
</figure>

Before distributing your Swift package, it’s important to note which
operating systems or platforms your code can run on. In the past I’ve
reasonably assumed a Swift package would work on watchOS or Linux for
instance. Only after adding the dependency and attempting to compile,
did I realize the incompatibility issue. If you use an API that is
limited to certain platforms, you have two options.

### Specify via Package

Firstly, you can specify an operating system and version in the
`Package.swift` under the `platforms` property:

    ...
        platforms: [
            .macOS(.v10_15),
            .iOS(.v13),
            .watchOS(.v5),
            .tvOS(.v13)
        ]
    ...

### Using Attributes and API Availability

On the other hand, you may want to offer some functionality on some
devices. With this in mind, you can use the attributes and API
availability checks. In other words the `available` attribute allows you
to mark certain functionality of your Swift package unavailable on
certain operating systems and versions.

In addition, by doing API availability checks you can supply the correct
implementation based on operating system and version. Furthermore,
whenever you may need to import certain frameworks which may be required
but may not be available, you can use `canImport`, as well.

Here's an example of extending `CGFloat` for all operating systems, but
importing `CoreGraphics`, when possible:

    #if canImport(CoreGraphics)
      import CoreGraphics
    #endif

    extension CGFloat {
      var clean: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : description
      }
    }

------------------------------------------------------------------------

Be that as it may, if you are planning on supporting all operating
systems which support Swift then there is no need to do this.
Regardless, it may be worth spending some time verifying and updating
this property accordingly.

## Why Continuous Integration?

Having properly setup your package and provided correct compatibility,
it’s important to make sure your package works. Additionally, you may
want to make sure each change to your code works correctly. Luckily,
this is where Continuous Integration comes in.

Continuous integration (CI) is the software practice where small code
changes are frequently tested with the rest of the code to ensure
nothing breaks as it changes. In other words, with CI we can make sure
each change works correctly by integrating a service with our code.

<span class="play-btn icon-play-circle" v-show="!playing" title="Play"
aria-hidden="true" focusable="false"></span> <span
class="pause-btn icon-pause-circle" v-show="playing" title="Pause"
aria-hidden="true" focusable="false"></span>

**{{ show.title }}** • <span
v-if="selectedEpisode.episode_type === 'trailer'">Trailer</span> <span
v-if="selectedEpisode.episode_type === 'bonus'">Bonus</span> <span
v-if="selectedEpisode.number">Episode {{ selectedEpisode.number
}}</span> • Season {{ selectedEpisode.season }}

{{ selectedEpisode.title }}

<span class="play-btn icon-play-circle" v-show="!playing" title="Play"
aria-hidden="true" focusable="false"></span> <span
class="pause-btn icon-pause-circle" v-show="playing" title="Pause"
aria-hidden="true" focusable="false"></span>

<span id="progress" :style="{ left: '-'+ progressBar + '%' }"></span>

{{ currentTimer }}|{{ currentDuration }}

{{ displaySpeed }}x

<span id="subscribeBtn">Subscribe</span> <span
id="shareBtn">Share</span> <span id="infoBtn">More Info</span>

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span>

Subscribe

RSS Feed <span class="copy-btn icon-copy" v-clipboard:copy="feed_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy RSS Feed URL to clipboard"></span>

Apple Podcasts Google Podcasts Spotify Pocket Casts Overcast Castro
Amazon Music Breaker Stitcher RadioPublic Pandora CastBox iHeartRadio
TuneIn Player FM SoundCloud Deezer Podcast Addict

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span>

Share

Embed <span class="copy-btn icon-copy" v-clipboard:copy="embed_html"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Embed code to clipboard"></span>

Share <span class="copy-btn icon-copy" v-clipboard:copy="share_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Share URL to clipboard"></span>

<span class="twitter icon-twitter-circle"></span> <span
class="facebook icon-facebook-circle"></span> <span
class="download icon-download-circle"></span>

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span> **{{
selectedEpisode.formatted\_published\_at }}** • <span
v-if="selectedEpisode.episode_type === 'trailer'">Trailer</span> <span
v-if="selectedEpisode.episode_type === 'bonus'">Bonus</span> <span
v-if="selectedEpisode.number">Episode {{ selectedEpisode.number
}}</span> • Season {{ selectedEpisode.season }}

{{ selectedEpisode.title }}

By {{ selectedEpisode.author }} • Full Transcript • View the Website

<span class="powered-by"> [**Broadcast by**
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTQ3cHgiIGhlaWdodD0iMTQ0cHgiIHZpZXdib3g9IjAgMCA1NDcgMTQ0IiB2ZXJzaW9uPSIxLjEiIGNsYXNzPSJ0cmFuc2lzdG9yLWxvZ28iPgogICAgPGRlZnM+PC9kZWZzPgogICAgPGcgaWQ9IlBhZ2UtMSIgc3Ryb2tlPSJub25lIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgaWQ9InRyYW5zaXN0b3JfaG9yaXpvbnRhbCIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkZGRkZGIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMDAwMDAwLCA0Mi4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJTaGFwZSIgcG9pbnRzPSIwLjcgMTAuNCAwLjcgMS44IDM4LjYgMS44IDM4LjYgMTAuNCAyNC41IDEwLjQgMjQuNSA1OC4zIDE0LjcgNTguMyAxNC43IDEwLjQiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik02My4zLDI2LjIgQzYyLjEsMjYgNjAuNywyNS44IDU4LjcsMjUuOCBDNTIuNCwyNS44IDQ4LjcsMjkuOSA0OC43LDM4LjIgTDQ4LjcsNTguMiBMMzkuNCw1OC4yIEwzOS40LDE4LjYgTDQ4LjUsMTguNiBMNDguNSwyNC4yIEw0OC43LDI0LjIgQzUwLjUsMjAuOCA1NC41LDE3LjMgNTkuOCwxNy4zIEM2MS4zLDE3LjMgNjIuMywxNy40IDYzLjMsMTcuNSBMNjMuMywyNi4yIEw2My4zLDI2LjIgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMTA3LjgsNTguMiBMOTguOCw1OC4yIEw5OC44LDUzLjIgTDk4LjYsNTMuMiBDOTUuOSw1Ni42IDkxLjYsNTkuNyA4NSw1OS43IEM3Ni4xLDU5LjcgNjYsNTIuNiA2NiwzOC40IEM2NiwyNS44IDc0LjksMTcuNCA4NS43LDE3LjQgQzkyLjMsMTcuNCA5Ni4zLDIwLjkgOTguNywyNCBMOTguOSwyNCBMOTguOSwxOC42IEwxMDcuOSwxOC42IEwxMDcuOSw1OC4yIEwxMDcuOCw1OC4yIFogTTg3LjQsNTEuNSBDOTMuNSw1MS41IDk5LjIsNDYuMiA5OS4yLDM4LjYgQzk5LjIsMzAuNiA5NCwyNS4zIDg3LjUsMjUuMyBDNzkuMywyNS4zIDc1LjQsMzEuOSA3NS40LDM4LjQgQzc1LjQsNDUgNzkuMiw1MS41IDg3LjQsNTEuNSBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMTguNiwxOC42IEwxMjcuOCwxOC42IEwxMjcuOCwyMy42IEwxMjgsMjMuNiBDMTMxLjEsMTkuMSAxMzUuNywxNy4zIDE0MC4xLDE3LjMgQzE0OC4zLDE3LjMgMTU1LjUsMjIuNyAxNTUuNSwzNS40IEwxNTUuNSw1OC4yIEwxNDYuMiw1OC4yIEwxNDYuMiwzNS45IEMxNDYuMiwyOS4xIDE0MywyNS41IDEzNy43LDI1LjUgQzEzMS45LDI1LjUgMTI3LjksMjkuNiAxMjcuOSwzNy4zIEwxMjcuOSw1OC4zIEwxMTguNiw1OC4zIEwxMTguNiwxOC42IEwxMTguNiwxOC42IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTE4My42LDI4LjggQzE4My4yLDI1LjkgMTgxLDI0IDE3OC4zLDI0IEMxNzUuMSwyNCAxNzMuMywyNiAxNzMuMywyOC4yIEMxNzMuMywzMC42IDE3NC41LDMyLjMgMTgxLjQsMzQuNiBDMTg5LjksMzcuMyAxOTIuOSw0MS43IDE5Mi45LDQ3LjMgQzE5Mi45LDU0LjYgMTg3LjQsNTkuNyAxNzguMyw1OS43IEMxNjguOCw1OS43IDE2NC4xLDU0LjUgMTYzLjQsNDcuMSBMMTcyLDQ3LjEgQzE3Mi40LDUwLjQgMTc0LjQsNTIuOSAxNzguNSw1Mi45IEMxODIsNTIuOSAxODQsNTAuNyAxODQsNDggQzE4NCw0NSAxODIuMyw0My4xIDE3NS43LDQwLjkgQzE2OC4zLDM4LjUgMTY0LjUsMzQuOCAxNjQuNSwyOC42IEMxNjQuNSwyMi4xIDE2OS42LDE3LjMgMTc4LDE3LjMgQzE4Ni41LDE3LjMgMTkxLDIyLjMgMTkyLDI4LjggTDE4My42LDI4LjggTDE4My42LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAxLDAuNCBMMjExLjMsMC40IEwyMTEuMyw5LjggTDIwMSw5LjggTDIwMSwwLjQgWiBNMjAxLjUsMTguNiBMMjEwLjgsMTguNiBMMjEwLjgsNTguMyBMMjAxLjUsNTguMyBMMjAxLjUsMTguNiBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yMzkuNSwyOC44IEMyMzkuMSwyNS45IDIzNi45LDI0IDIzNC4yLDI0IEMyMzEsMjQgMjI5LjIsMjYgMjI5LjIsMjguMiBDMjI5LjIsMzAuNiAyMzAuNCwzMi4zIDIzNy4zLDM0LjYgQzI0NS44LDM3LjMgMjQ4LjgsNDEuNyAyNDguOCw0Ny4zIEMyNDguOCw1NC42IDI0My4zLDU5LjcgMjM0LjIsNTkuNyBDMjI0LjcsNTkuNyAyMjAsNTQuNSAyMTkuMyw0Ny4xIEwyMjcuOSw0Ny4xIEMyMjguMyw1MC40IDIzMC4zLDUyLjkgMjM0LjQsNTIuOSBDMjM3LjksNTIuOSAyMzkuOSw1MC43IDIzOS45LDQ4IEMyMzkuOSw0NSAyMzguMiw0My4xIDIzMS42LDQwLjkgQzIyNC4yLDM4LjUgMjIwLjQsMzQuOCAyMjAuNCwyOC42IEMyMjAuNCwyMi4xIDIyNS41LDE3LjMgMjMzLjksMTcuMyBDMjQyLjQsMTcuMyAyNDYuOSwyMi4zIDI0Ny45LDI4LjggTDIzOS41LDI4LjggTDIzOS41LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjUyLjgsMTguNiBMMjU3LjgsMTguNiBMMjU3LjgsNS45IEwyNjcuMSw1LjkgTDI2Ny4xLDE4LjYgTDI3NywxOC42IEwyNzcsMjYuNCBMMjY3LDI2LjQgTDI2Nyw0NC4xIEMyNjcsNDkuNSAyNjguNyw1MSAyNzIuNSw1MSBDMjc0LjEsNTEgMjc1LjksNTAuNyAyNzcuMyw1MC4zIEwyNzcuMyw1Ny44IEMyNzUuMiw1OC40IDI3Mi42LDU4LjcgMjcwLjMsNTguNyBDMjYwLjQsNTguNyAyNTcuOCw1Mi43IDI1Ny44LDQ0LjYgTDI1Ny44LDI2LjQgTDI1Mi44LDI2LjQgTDI1Mi44LDE4LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzAyLjMsMTcuMyBDMzE0LjcsMTcuMyAzMjMuNSwyNi40IDMyMy41LDM4LjQgQzMyMy41LDUwLjEgMzE0LjYsNTkuNyAzMDIuMyw1OS43IEMyOTAuMiw1OS43IDI4MS4xLDUwLjQgMjgxLjEsMzguNCBDMjgxLjEsMjYuMSAyOTAuMywxNy4zIDMwMi4zLDE3LjMgWiBNMzAyLjMsNTEuNCBDMzA5LjMsNTEuNCAzMTQuMSw0NS44IDMxNC4xLDM4LjQgQzMxNC4xLDMxLjQgMzA5LjYsMjUuNSAzMDIuMywyNS41IEMyOTUuMiwyNS41IDI5MC41LDMxIDI5MC41LDM4LjQgQzI5MC41LDQ2IDI5NS45LDUxLjQgMzAyLjMsNTEuNCBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0zNTAuOSwyNS44IEMzNDQuNiwyNS44IDM0MC45LDI5LjkgMzQwLjksMzguMiBMMzQwLjksNTguMiBMMzMxLjYsNTguMiBMMzMxLjYsMTguNiBMMzQwLjcsMTguNiBMMzQwLjcsMjQuMiBMMzQwLjksMjQuMiBDMzQyLjcsMjAuOCAzNDYuNywxNy4zIDM1MiwxNy4zIEMzNTMuNSwxNy4zIDM1NC41LDE3LjQgMzU1LjUsMTcuNSBMMzU1LjUsMjYuMiBDMzU0LjMsMjYgMzUyLjksMjUuOCAzNTAuOSwyNS44IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxnIGlkPSJHcm91cCI+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNC4wMDAwMDAsIDI0LjAwMDAwMCkiIGlkPSJTaGFwZSI+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTQ4LDk1LjkgQzQ1LjQsOTUuOSA0My4yLDkzLjggNDMuMiw5MS4xIEw0My4yLDQuOSBDNDMuMiwyLjMgNDUuMywwLjEgNDgsMC4xIEM1MC42LDAuMSA1Mi44LDIuMiA1Mi44LDQuOSBMNTIuOCw5MS4xIEM1Mi44LDkzLjcgNTAuNiw5NS45IDQ4LDk1LjkgWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yOCw1Mi44IEw1LDUyLjggQzIuNCw1Mi44IDAuMiw1MC43IDAuMiw0OCBDMC4yLDQ1LjMgMi4zLDQzLjIgNSw0My4yIEwyOCw0My4yIEMzMC42LDQzLjIgMzIuOCw0NS4zIDMyLjgsNDggQzMyLjgsNTAuNyAzMC42LDUyLjggMjgsNTIuOCBaIj48L3BhdGg+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTkxLjEsNTIuOCBMNjgsNTIuOCBDNjUuNCw1Mi44IDYzLjIsNTAuNyA2My4yLDQ4IEM2My4yLDQ1LjMgNjUuMyw0My4yIDY4LDQzLjIgTDkxLDQzLjIgQzkzLjYsNDMuMiA5NS44LDQ1LjMgOTUuOCw0OCBDOTUuOCw1MC43IDkzLjcsNTIuOCA5MS4xLDUyLjggWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTcyLDE0NCBDMzIuMywxNDQgMCwxMTEuNyAwLDcyIEMwLDMyLjMgMzIuMywwIDcyLDAgQzExMS43LDAgMTQ0LDMyLjMgMTQ0LDcyIEMxNDQsMTExLjcgMTExLjcsMTQ0IDcyLDE0NCBaIE03Miw5LjYgQzM3LjYsOS42IDkuNiwzNy42IDkuNiw3MiBDOS42LDEwNi40IDM3LjYsMTM0LjQgNzIsMTM0LjQgQzEwNi40LDEzNC40IDEzNC40LDEwNi40IDEzNC40LDcyIEMxMzQuNCwzNy42IDEwNi40LDkuNiA3Miw5LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg==" class="transistor-logo" />](https://transistor.fm "Broadcast by Transistor.fm")
</span>

{{ episodes.length}} {{ show.playlist\_limit ? 'latest' : '' }} episodes

1.  <span class="icon-play-circle"
    v-show="!playing || (playing &amp;&amp;  selectedEpisodeIndex != index)"></span>
    <span class="icon-pause-circle"
    v-show="playing &amp;&amp; selectedEpisodeIndex === index"></span>
    <span class="playlist-title">{{ episode.title }}</span> {{
    episode.duration\_in\_minutes }} min

### Choosing a service for Swift Package Continuous Integration

What’s important to realize is that by using a cloud service for your
Swift package, you can make sure your package works everywhere. Often
times, we may be have some source, artifact, or tool required to build
our code. However with a cloud service, you can ensure that if your
Swift package builds and tests in the cloud it will work for anyone
else.

Luckily, there are some great services out there to help your Swift
package especially if it’s a public GitHub repository. At the present
time, unfortunately, some services **only** support Continuous
Integration for iOS Applications rather than Swift packages such as
**[Circle CI](https://circleci.com)** and
**[Bitrise](https://www.bitrise.io)**. Be that as it may,
**[Travis-CI](https://travis-ci.com)** as well as the most recent
**[GitHub Actions](https://github.com/features/actions)** allow for
Swift Package Continuous
Integration.<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/02/TravisCI-Full-Color-2.png" class="alignnone size-full wp-image-841" width="642" height="201" />

### Travis-CI

**[Travis-CI](https://travis-ci.com)** is one of the older Continuous
Integration services out there. Most importantly for public
repositories, **[Travis-CI](https://travis-ci.com)** is completely free.
In other words, you can configure your Swift package on
**[Travis-CI](https://travis-ci.com)**. In order to configure your
repository, signup with **[Travis-CI](https://travis-ci.com)** by
linking your GitHub account or organization. Next you need to setup your
`.travis.yml` file.

Notably, there are three key components for setting up a Swift package
in Travis-CI:

-   Specifying the correct operating system and Xcode version
-   Building and testing your code

For example, here is a simple `.travis.yml` file:

    language: objective-c
    os: osx
    osx_image: xcode11.3
    script:
      - swift build
      - swift test

The first three properties setup the virtual machine which
**[Travis-CI](https://travis-ci.com)** uses. Next, the lines under
`script` specify the commands Travis-CI needs to run to verify the Swift
package is working. In this case, **since we are not building from an
Xcode project or workspace, we need to specify our own *custom*
commands.** In other words, rather than using *xcodebuild*, the Swift
command line tool will build and test our package.

While Travis-CI is the most experienced cloud CI service out there,
recently GitHub has also offered its own service with **[GitHub
Actions](https://github.com/features/actions)**.

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/02/44036562-2.png" class="wp-image-840" />
</figure>

### Github Actions

With the fairly recent release of **[GitHub
Actions](https://github.com/features/actions)**, you can setup Swift
package continuous integration right from your repo. Most importantly
**[GitHub Actions](https://github.com/features/actions)** is completely
free for public repositories. Therefore, let’s breakdown the
functionality of **[GitHub
Actions](https://github.com/features/actions)**.

#### GitHub Actions Components - Workflows, Actions, Jobs and more

In order to setup our Swift package continuous integration in GitHub
Actions, we need to understand the components. Similar to Travis-CI,
GitHub uses YAML for its configuration. Specifically these YAML files
are known as workflow files. For example, here is a sample with the name
`macOS`:

    name: macOS

    on: [push]

    jobs:
      build:  
        runs-on: macos-latest
        steps:
        - uses: actions/checkout@v2
        - name: Build
          run: swift build
        - name: Run tests
          run: swift test

In contrast to Travis-CI, you can setup multiple of these files.
Therefore as long as you store them in your repository under the
`.github/workflow` folder, **[GitHub
Actions](https://github.com/features/actions)** will execute each of
these workflow files on trigger.

Speaking of *trigger*, you can specify many triggers. However in the
case of our Swift package, we will only be using the `push` trigger to
activate this workflow.

Below the `on` trigger, we have setup one job under `jobs` called
`build`. With in the `build` job, we have specified the runner type (i.e
virtual environment) of `macOS-latest`. In other words, it will be using
the latest version of macOS to run the series of steps.

    ...
        steps:
        - uses: actions/checkout@v2
        - name: Build
          run: swift build
        - name: Run tests
          run: swift test

##### GitHub Actions - Step By Step

Below the runner type property are the series of steps specified. In
this case, the first step with the single `uses` property checks out the
code from the repository. While the following steps have a `name` label
and a `run` command to execute: first building the Swift package
(`swift build`) then running tests provided (`swift test`).

What’s important to note is that each needs a custom command (via `run`)
with a `name` or to use a prebuilt action from the GitHub repo such as
`actions/checkout@v2` to pull the source code from the repository.
Unfortunately many of the GitHub Actions provided on GitHub may not be
compatible with macOS due to various requirements.

Luckily you should have Continuous Integration setup for your Swift
package in both Travis-CI and GitHub Actions. However if you wish to
support Linux with your Swift package, it is import to configure the
Swift package continuous integration for a Linux environment as well.

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/02/ubuntu_black-orange_hex.png" class="wp-image-839" width="379" height="86" />
</figure>

### Linux Support for Swift Package Continuous Integration

If you wish for your Swift package to be supported everywhere, it might
be a good idea to support Linux. Therefore, it’s important to have your
Swift package Continuous integration to extend to Linux. Thankfully both
Travis-CI and GitHub Action support Linux (i.e. Ubuntu) as well as the
configuration of more than one environment per repository. First, let’s
understand how build matrices work in Travis-CI.

#### Configuring Travis-CI for Linux

With Travis-CI, we can use a build matrix to include more than one
environment. In other words, Travis-CI will run each environment in the
build matrix in parallel. Therefore, let’s swap the top section
specifying only macOS from above with a build matrix including both
macOS and Linux (i.e. Ubuntu 18.04-bionic):

    jobs:
      include:
        - os: linux
          dist: bionic
          sudo: required
        - os: osx
          osx_image: xcode11.3

Now, it will run each phase in parallel on Ubuntu as well as macOS.
However we'll need to make changes to both of the these sections in
order to support Linux. Most importantly, we will need to install Swift.

Therefore, we will move or create the `script` and `before_install`
phases into separate bash scripts and update `.travis.yml` accordingly:

    jobs:
      include:
        - os: linux
          dist: bionic
          sudo: required
        - os: osx
          osx_image: xcode11.3
    before_install:
      - ./Scripts/before_install.sh
    script:
      - ./Scripts/script.sh

Next let’s create a script for `before_install` named
`before_install.sh` under the `Scripts` folder with the following code:

    #!/bin/bash

    if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
      # install macOS prerequistes
    elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
      # download swift
      wget https://swift.org/builds/swift-5.2-release/ubuntu1804/swift-5.2-RELEASE/swift-5.2-RELEASE-ubuntu18.04.tar.gz
      # extract the archive
      tar xzf swift-5.2-RELEASE-ubuntu18.04.tar.gz
      # include the swift command in the PATH
      export PATH="${PWD}/swift-5.2-RELEASE-ubuntu18.04/usr/bin:$PATH"
    fi

Within the bash script, we check the environment variable
`TRAVIS_OS_NAME` setup by Travis-CI. With the variable, we check whether
it is `osx` for a macOS environment or `linux` for the Ubuntu
environment.

Since Xcode is not available on Ubuntu, we need to manually within the
bash script, download and extract Swift. Lastly we need to include the
directory path of the Swift command tool within the environment `PATH`
variable.

Correspondingly we need to make sure the `PATH` is updated in the
`Scripts/script.sh` file:

    #!/bin/bash

    if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
      # What to do in macOS
    elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
      # What to do in Ubunutu
      export PATH="${PWD}/swift-5.2-RELEASE-ubuntu18.04/usr/bin:$PATH"
    fi

    swift build
    swift test

Therefore the only major change within the `script` section of the
Travis-CI configuration is including the path to the Swift command line
tool.

As a result, each time a push is made to the repository, Travis-CI will
run both a macOS and Ubuntu process. In effect, we have setup Swift
package continuous integration for both operating systems in Travis-CI.
Accordingly, let’s do the same thing for GitHub Actions.

#### Configuring GitHub Actions for Linux

While Travis-CI requires us to check the operating system within the
build script, GitHub Actions allows us to use separate workflow files
for each operating system.

    name: ubuntu

    on: [push]

    jobs:
      build:

        runs-on: ubuntu-18.04

        steps:
        - uses: actions/checkout@v2
        - name: Download Swift 5.2
          run: wget -q https://swift.org/builds/swift-5.2-release/ubuntu1804/swift-5.2-RELEASE/swift-5.2-RELEASE-ubuntu18.04.tar.gz
        - name: Extract Swift 5.2
          run: tar xzf swift-5.2-RELEASE-ubuntu18.04.tar.gz
        - name: Add Path
          run: echo "::add-path::$GITHUB_WORKSPACE/swift-5.2-RELEASE-ubuntu18.04/usr/bin"
        - name: Build
          run: swift build
        - name: Run tests
          run: swift test

In this case, each command is stored within an individual step. As can
be seen, the one custom part is the method we use to add the path using
GitHub Actions logging commands and variables. With
`echo "::add-path::$GITHUB_WORKSPACE/swift-5.2-RELEASE-ubuntu18.04/usr/bin"`,
we update the `PATH` variable.

As a result, your Swift package continuous integration should support
Linux via Travis-CI and GitHub Action. However, there are a few steps in
order to support Linux when it comes to testing.

## Testing, CI, and Linux

<figure>
<img src="https://i1.wp.com/learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/03/linux-test-swift.png?fit=640%2C316&amp;ssl=1" class="wp-image-875" />
</figure>

When it comes to verifying whether your package works correctly, having
the right unit tests are a major component of that. Luckily, if you are
using the XCTest framework and setup the CI scaffold previously
described, you should be good to go. However with Linux, XCTest will not
automatically provide all the correct tests in your application without
some modifications. There are a few ways of doing this:

1.  Manually update your XCTestManifests.swift and LinuxMain.swift :(
2.  Run `swift test --generate-linuxmain` **before commit on your macOS
    machine** to let the swift command line tool update your
    LinuxMain.swift.
3.  **Update your CI for Linux** to run
    `swift test --enable-test-discovery` which will automatically
    discover and run your tests.

If you are interested in learning more about this check out Ole
Begemann’s piece on [keeping XCTest in
sync](https://oleb.net/blog/2017/03/keeping-xctest-in-sync/) as well as
[how automatic test discovery
works](https://oleb.net/2020/swift-test-discovery/).

Now that we have our unit tests working correctly, let's look into
keeping tracking of code coverage.

### Integrating Code Coverage

Code coverage is a good way to keep track of how well your unit tests
are handling. Luckily there are some great services out there to keep
track of your code coverage as you build your Swift package.

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/02/7c4f41a-pink.png" class="wp-image-838" width="150" height="150" />
</figure>

#### CodeCov

**[CodeCov.io](http://codecov.io/)** is one such service which we can
plugin into our Swift Package Continuous Integration setup. However,
once you have signed up and added your public repository, it will take
some configuration to make it work completely.

For instance, we must make sure that the tests, build a report, convert
the report to a compatible format, then lastly upload the the report to
**[CodeCov.io](http://codecov.io/)**. Building the report when you run
the unit tests is fairly easy. In this case, we simply need to add the
flag `--enable-code-coverage` to our `swift test` for both Travis-CI and
GitHub Actions; macOS and Linux:

    swift test --enable-code-coverage

Next, we need to prepare the report for upload using `llvm-cov`. With
this in mind, on macOS you can use `xcrun` to run `llvm-cov`:

    xcrun llvm-cov export -format="lcov" .build/debug/${{FRAMEWORK_NAME}}PackageTests.xctest/Contents/MacOS/${{FRAMEWORK_NAME}}PackageTests -instr-profile .build/debug/codecov/default.profdata > info.lcov

Corresponding in Linux, we can run `llvm-cov` manually:

    llvm-cov export -format="lcov" .build/x86_64-unknown-linux-gnu/debug/${{FRAMEWORK_NAME}}PackageTests.xctest -instr-profile .build/debug/codecov/default.profdata > info.lcov

Simply replace `${{FRAMEWORK_NAME}}` with your Swift package name or
even better setup an environment variable in Travis-CI and GitHub
Actions.

Lastly, we need to upload the report using the Bash script provided by
CodeCov.io:

    bash <(curl https://codecov.io/bash)

While Travis-CI automatically integrates with CodeCov.io, GitHub does
require [manually setting up the token for
CodeCov.io](https://docs.codecov.io/docs/about-the-codecov-bash-uploader):

1.  First, go to your project in CodeCov.io and copy the token from the
    project overview.
2.  Go to your GitHub repository settings and under *Secrets* add the
    token under the name `CODECOV_TOKEN`.
3.  Under both the macOS and ubuntu workflow files, add the
    `CODECOV_TOKEN` as the environment variable under the upload step.

For example, here’s the Ubuntu workflow file which uses an environment
variable for the Swift package name and maps the `CODECOV_TOKEN` secret
to the uploader command environment variable:

    ...    
        - name: Run tests
          run: swift test --enable-code-coverage
        - name: Prepare Code Coverage
          run: llvm-cov export -format="lcov" .build/x86_64-unknown-linux-gnu/debug/${{ env.PACKAGE_NAME }}PackageTests.xctest -instr-profile .build/debug/codecov/default.profdata > info.lcov
        - name: Upload to CodeCov.io
          run: bash <(curl https://codecov.io/bash)
          env:
              CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN }}

Now that we have completed setting up a code coverage report with
**CodeCov.io**, Let’s talk about ensuring good code quality.

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/02/medal-150x150.png" class="wp-image-837" />
</figure>

## Code Quality and CI

There are some great automated ways we can keep up code quality inside
our Swift package continuous integration. However, nothing replaces a
good code review. If you can, have some sort of code review process by
someone else. If it’s difficult to find someone else, I suggest
reviewing a Swift package’s code after some down time to ensure you can
have a fresh look at your code.

Regardless, let’s look at some of the ways we can automate code quality
checks.

### Formatting, Beautification, and Linting

There are two command line tools I use to maintain quality code while
keeping formatting consistent:
**[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)** and
**[SwiftLint](https://github.com/realm/SwiftLint)**. Fortunately, each
application can be installed via Homebrew. Therefore, we can use
Homebrew bundle to automate the installation of both applications inside
our Swift package continuous integration. With this in mind, add a file
called `Brewfile` to the root of repository with the following text:

    brew "swiftformat"
    brew "swiftlint"

Next we need to add the installation these applications in the earliest
part of our CI setup. However these applications will only work on macOS
and we need to verify that as well. Therefore we modify our
`before_install.sh` script for Travis-CI with:

    ...
    if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
      brew update
      brew bundle
    elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
    ...

Meanwhile, for Github Actions, we simply need to add steps to our macOS
workflow file:

    ...
      steps:
        - uses: actions/checkout@v2
        - name: Prepare Build
          run: brew bundle
    ...

Lastly we need to add the following command to verify code quality after
the installation:

    swiftformat --lint . && swiftlint

In short, this command will run both applications in the CI process.
Specifically we run `swiftformat` in linter mode, since our expectation
is that the developer has already formatted the code correctly before
commit. Correspondingly, with `swiftlint`, you can use the `autocorrect`
subcommand to fix some linter errors in your code before commit.

Again, for Travis-CI, verify the `$TRAVIS_OS_NAME` is `osx`, so the CI
doesn’t run the tool in Linux.

Beside installation and execution of the tools within the Swift package
continuous integration, you should probably add configuration files for
both tools. In brief, these are `.swiftformat` and `.swiftlint.yml`.
Futhermore, check out both the
**[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)** and
**[SwiftLint](https://github.com/realm/SwiftLint)** projects for details
on how setup these configurations.

<span class="play-btn icon-play-circle" v-show="!playing" title="Play"
aria-hidden="true" focusable="false"></span> <span
class="pause-btn icon-pause-circle" v-show="playing" title="Pause"
aria-hidden="true" focusable="false"></span>

**{{ show.title }}** • <span
v-if="selectedEpisode.episode_type === 'trailer'">Trailer</span> <span
v-if="selectedEpisode.episode_type === 'bonus'">Bonus</span> <span
v-if="selectedEpisode.number">Episode {{ selectedEpisode.number
}}</span> • Season {{ selectedEpisode.season }}

{{ selectedEpisode.title }}

<span class="play-btn icon-play-circle" v-show="!playing" title="Play"
aria-hidden="true" focusable="false"></span> <span
class="pause-btn icon-pause-circle" v-show="playing" title="Pause"
aria-hidden="true" focusable="false"></span>

<span id="progress" :style="{ left: '-'+ progressBar + '%' }"></span>

{{ currentTimer }}|{{ currentDuration }}

{{ displaySpeed }}x

<span id="subscribeBtn">Subscribe</span> <span
id="shareBtn">Share</span> <span id="infoBtn">More Info</span>

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span>

Subscribe

RSS Feed <span class="copy-btn icon-copy" v-clipboard:copy="feed_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy RSS Feed URL to clipboard"></span>

Apple Podcasts Google Podcasts Spotify Pocket Casts Overcast Castro
Amazon Music Breaker Stitcher RadioPublic Pandora CastBox iHeartRadio
TuneIn Player FM SoundCloud Deezer Podcast Addict

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span>

Share

Embed <span class="copy-btn icon-copy" v-clipboard:copy="embed_html"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Embed code to clipboard"></span>

Share <span class="copy-btn icon-copy" v-clipboard:copy="share_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Share URL to clipboard"></span>

<span class="twitter icon-twitter-circle"></span> <span
class="facebook icon-facebook-circle"></span> <span
class="download icon-download-circle"></span>

<span class="close-btn icon-cancel-circle"
@click.prevent="closePanel"></span> **{{
selectedEpisode.formatted\_published\_at }}** • <span
v-if="selectedEpisode.episode_type === 'trailer'">Trailer</span> <span
v-if="selectedEpisode.episode_type === 'bonus'">Bonus</span> <span
v-if="selectedEpisode.number">Episode {{ selectedEpisode.number
}}</span> • Season {{ selectedEpisode.season }}

{{ selectedEpisode.title }}

By {{ selectedEpisode.author }} • Full Transcript • View the Website

<span class="powered-by"> [**Broadcast by**
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTQ3cHgiIGhlaWdodD0iMTQ0cHgiIHZpZXdib3g9IjAgMCA1NDcgMTQ0IiB2ZXJzaW9uPSIxLjEiIGNsYXNzPSJ0cmFuc2lzdG9yLWxvZ28iPgogICAgPGRlZnM+PC9kZWZzPgogICAgPGcgaWQ9IlBhZ2UtMSIgc3Ryb2tlPSJub25lIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgaWQ9InRyYW5zaXN0b3JfaG9yaXpvbnRhbCIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkZGRkZGIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMDAwMDAwLCA0Mi4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJTaGFwZSIgcG9pbnRzPSIwLjcgMTAuNCAwLjcgMS44IDM4LjYgMS44IDM4LjYgMTAuNCAyNC41IDEwLjQgMjQuNSA1OC4zIDE0LjcgNTguMyAxNC43IDEwLjQiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik02My4zLDI2LjIgQzYyLjEsMjYgNjAuNywyNS44IDU4LjcsMjUuOCBDNTIuNCwyNS44IDQ4LjcsMjkuOSA0OC43LDM4LjIgTDQ4LjcsNTguMiBMMzkuNCw1OC4yIEwzOS40LDE4LjYgTDQ4LjUsMTguNiBMNDguNSwyNC4yIEw0OC43LDI0LjIgQzUwLjUsMjAuOCA1NC41LDE3LjMgNTkuOCwxNy4zIEM2MS4zLDE3LjMgNjIuMywxNy40IDYzLjMsMTcuNSBMNjMuMywyNi4yIEw2My4zLDI2LjIgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMTA3LjgsNTguMiBMOTguOCw1OC4yIEw5OC44LDUzLjIgTDk4LjYsNTMuMiBDOTUuOSw1Ni42IDkxLjYsNTkuNyA4NSw1OS43IEM3Ni4xLDU5LjcgNjYsNTIuNiA2NiwzOC40IEM2NiwyNS44IDc0LjksMTcuNCA4NS43LDE3LjQgQzkyLjMsMTcuNCA5Ni4zLDIwLjkgOTguNywyNCBMOTguOSwyNCBMOTguOSwxOC42IEwxMDcuOSwxOC42IEwxMDcuOSw1OC4yIEwxMDcuOCw1OC4yIFogTTg3LjQsNTEuNSBDOTMuNSw1MS41IDk5LjIsNDYuMiA5OS4yLDM4LjYgQzk5LjIsMzAuNiA5NCwyNS4zIDg3LjUsMjUuMyBDNzkuMywyNS4zIDc1LjQsMzEuOSA3NS40LDM4LjQgQzc1LjQsNDUgNzkuMiw1MS41IDg3LjQsNTEuNSBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMTguNiwxOC42IEwxMjcuOCwxOC42IEwxMjcuOCwyMy42IEwxMjgsMjMuNiBDMTMxLjEsMTkuMSAxMzUuNywxNy4zIDE0MC4xLDE3LjMgQzE0OC4zLDE3LjMgMTU1LjUsMjIuNyAxNTUuNSwzNS40IEwxNTUuNSw1OC4yIEwxNDYuMiw1OC4yIEwxNDYuMiwzNS45IEMxNDYuMiwyOS4xIDE0MywyNS41IDEzNy43LDI1LjUgQzEzMS45LDI1LjUgMTI3LjksMjkuNiAxMjcuOSwzNy4zIEwxMjcuOSw1OC4zIEwxMTguNiw1OC4zIEwxMTguNiwxOC42IEwxMTguNiwxOC42IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTE4My42LDI4LjggQzE4My4yLDI1LjkgMTgxLDI0IDE3OC4zLDI0IEMxNzUuMSwyNCAxNzMuMywyNiAxNzMuMywyOC4yIEMxNzMuMywzMC42IDE3NC41LDMyLjMgMTgxLjQsMzQuNiBDMTg5LjksMzcuMyAxOTIuOSw0MS43IDE5Mi45LDQ3LjMgQzE5Mi45LDU0LjYgMTg3LjQsNTkuNyAxNzguMyw1OS43IEMxNjguOCw1OS43IDE2NC4xLDU0LjUgMTYzLjQsNDcuMSBMMTcyLDQ3LjEgQzE3Mi40LDUwLjQgMTc0LjQsNTIuOSAxNzguNSw1Mi45IEMxODIsNTIuOSAxODQsNTAuNyAxODQsNDggQzE4NCw0NSAxODIuMyw0My4xIDE3NS43LDQwLjkgQzE2OC4zLDM4LjUgMTY0LjUsMzQuOCAxNjQuNSwyOC42IEMxNjQuNSwyMi4xIDE2OS42LDE3LjMgMTc4LDE3LjMgQzE4Ni41LDE3LjMgMTkxLDIyLjMgMTkyLDI4LjggTDE4My42LDI4LjggTDE4My42LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAxLDAuNCBMMjExLjMsMC40IEwyMTEuMyw5LjggTDIwMSw5LjggTDIwMSwwLjQgWiBNMjAxLjUsMTguNiBMMjEwLjgsMTguNiBMMjEwLjgsNTguMyBMMjAxLjUsNTguMyBMMjAxLjUsMTguNiBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yMzkuNSwyOC44IEMyMzkuMSwyNS45IDIzNi45LDI0IDIzNC4yLDI0IEMyMzEsMjQgMjI5LjIsMjYgMjI5LjIsMjguMiBDMjI5LjIsMzAuNiAyMzAuNCwzMi4zIDIzNy4zLDM0LjYgQzI0NS44LDM3LjMgMjQ4LjgsNDEuNyAyNDguOCw0Ny4zIEMyNDguOCw1NC42IDI0My4zLDU5LjcgMjM0LjIsNTkuNyBDMjI0LjcsNTkuNyAyMjAsNTQuNSAyMTkuMyw0Ny4xIEwyMjcuOSw0Ny4xIEMyMjguMyw1MC40IDIzMC4zLDUyLjkgMjM0LjQsNTIuOSBDMjM3LjksNTIuOSAyMzkuOSw1MC43IDIzOS45LDQ4IEMyMzkuOSw0NSAyMzguMiw0My4xIDIzMS42LDQwLjkgQzIyNC4yLDM4LjUgMjIwLjQsMzQuOCAyMjAuNCwyOC42IEMyMjAuNCwyMi4xIDIyNS41LDE3LjMgMjMzLjksMTcuMyBDMjQyLjQsMTcuMyAyNDYuOSwyMi4zIDI0Ny45LDI4LjggTDIzOS41LDI4LjggTDIzOS41LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjUyLjgsMTguNiBMMjU3LjgsMTguNiBMMjU3LjgsNS45IEwyNjcuMSw1LjkgTDI2Ny4xLDE4LjYgTDI3NywxOC42IEwyNzcsMjYuNCBMMjY3LDI2LjQgTDI2Nyw0NC4xIEMyNjcsNDkuNSAyNjguNyw1MSAyNzIuNSw1MSBDMjc0LjEsNTEgMjc1LjksNTAuNyAyNzcuMyw1MC4zIEwyNzcuMyw1Ny44IEMyNzUuMiw1OC40IDI3Mi42LDU4LjcgMjcwLjMsNTguNyBDMjYwLjQsNTguNyAyNTcuOCw1Mi43IDI1Ny44LDQ0LjYgTDI1Ny44LDI2LjQgTDI1Mi44LDI2LjQgTDI1Mi44LDE4LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzAyLjMsMTcuMyBDMzE0LjcsMTcuMyAzMjMuNSwyNi40IDMyMy41LDM4LjQgQzMyMy41LDUwLjEgMzE0LjYsNTkuNyAzMDIuMyw1OS43IEMyOTAuMiw1OS43IDI4MS4xLDUwLjQgMjgxLjEsMzguNCBDMjgxLjEsMjYuMSAyOTAuMywxNy4zIDMwMi4zLDE3LjMgWiBNMzAyLjMsNTEuNCBDMzA5LjMsNTEuNCAzMTQuMSw0NS44IDMxNC4xLDM4LjQgQzMxNC4xLDMxLjQgMzA5LjYsMjUuNSAzMDIuMywyNS41IEMyOTUuMiwyNS41IDI5MC41LDMxIDI5MC41LDM4LjQgQzI5MC41LDQ2IDI5NS45LDUxLjQgMzAyLjMsNTEuNCBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0zNTAuOSwyNS44IEMzNDQuNiwyNS44IDM0MC45LDI5LjkgMzQwLjksMzguMiBMMzQwLjksNTguMiBMMzMxLjYsNTguMiBMMzMxLjYsMTguNiBMMzQwLjcsMTguNiBMMzQwLjcsMjQuMiBMMzQwLjksMjQuMiBDMzQyLjcsMjAuOCAzNDYuNywxNy4zIDM1MiwxNy4zIEMzNTMuNSwxNy4zIDM1NC41LDE3LjQgMzU1LjUsMTcuNSBMMzU1LjUsMjYuMiBDMzU0LjMsMjYgMzUyLjksMjUuOCAzNTAuOSwyNS44IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxnIGlkPSJHcm91cCI+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNC4wMDAwMDAsIDI0LjAwMDAwMCkiIGlkPSJTaGFwZSI+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTQ4LDk1LjkgQzQ1LjQsOTUuOSA0My4yLDkzLjggNDMuMiw5MS4xIEw0My4yLDQuOSBDNDMuMiwyLjMgNDUuMywwLjEgNDgsMC4xIEM1MC42LDAuMSA1Mi44LDIuMiA1Mi44LDQuOSBMNTIuOCw5MS4xIEM1Mi44LDkzLjcgNTAuNiw5NS45IDQ4LDk1LjkgWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yOCw1Mi44IEw1LDUyLjggQzIuNCw1Mi44IDAuMiw1MC43IDAuMiw0OCBDMC4yLDQ1LjMgMi4zLDQzLjIgNSw0My4yIEwyOCw0My4yIEMzMC42LDQzLjIgMzIuOCw0NS4zIDMyLjgsNDggQzMyLjgsNTAuNyAzMC42LDUyLjggMjgsNTIuOCBaIj48L3BhdGg+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTkxLjEsNTIuOCBMNjgsNTIuOCBDNjUuNCw1Mi44IDYzLjIsNTAuNyA2My4yLDQ4IEM2My4yLDQ1LjMgNjUuMyw0My4yIDY4LDQzLjIgTDkxLDQzLjIgQzkzLjYsNDMuMiA5NS44LDQ1LjMgOTUuOCw0OCBDOTUuOCw1MC43IDkzLjcsNTIuOCA5MS4xLDUyLjggWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTcyLDE0NCBDMzIuMywxNDQgMCwxMTEuNyAwLDcyIEMwLDMyLjMgMzIuMywwIDcyLDAgQzExMS43LDAgMTQ0LDMyLjMgMTQ0LDcyIEMxNDQsMTExLjcgMTExLjcsMTQ0IDcyLDE0NCBaIE03Miw5LjYgQzM3LjYsOS42IDkuNiwzNy42IDkuNiw3MiBDOS42LDEwNi40IDM3LjYsMTM0LjQgNzIsMTM0LjQgQzEwNi40LDEzNC40IDEzNC40LDEwNi40IDEzNC40LDcyIEMxMzQuNCwzNy42IDEwNi40LDkuNiA3Miw5LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg==" class="transistor-logo" />](https://transistor.fm "Broadcast by Transistor.fm")
</span>

{{ episodes.length}} {{ show.playlist\_limit ? 'latest' : '' }} episodes

1.  <span class="icon-play-circle"
    v-show="!playing || (playing &amp;&amp;  selectedEpisodeIndex != index)"></span>
    <span class="icon-pause-circle"
    v-show="playing &amp;&amp; selectedEpisodeIndex === index"></span>
    <span class="playlist-title">{{ episode.title }}</span> {{
    episode.duration\_in\_minutes }} min

### Cloud-Based Code Quality Services

Besides **[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)**
and **[SwiftLint](https://github.com/realm/SwiftLint)**, there are a few
cloud based code quality tools which easily integrate with your public
GitHub repository. Therefore, you may be interested in:

-   **[CodeFactor.io](https://www.codefactor.io/)**
-   **[CodeBeat](https://codebeat.co)**
-   **[CodeClimate](https://codeclimate.com)**
-   **[HoundCI](https://houndci.com)**

After having setup these various tools, it’s worth taking a look at some
various issues which may crop up.

### Common Code Quality Issues

Now that we have setup our Swift package continuous integration and
plugged in several services, there are few issues you could resolve
which will show up:

#### Cyclomatic Complexity

*Cyclomatic Complexity* refers to the complexity of the code
specifically when it comes to testability. In the end, if your code
contains several logical paths, it is best to break these up. For
instance, using *Protocol Oriented Programming*, you can have a protocol
to test the case. Then, for each case use individual implementations and
store them in an array. For instance, rather than:

    if a == 0 {
        if b == 0 {
        } ...
    ...
    } else if a == 1 {
    ...
    } else if a == 2
    ...
    }

Use a protocol which does:

    protocol Doer {
      func test (_ a: Int, _ b: Int) -> Result?
    }

    let implementations : [Doer] = [FooDoer(), BarDoer()]

    var result : Result?

    for implementation in implmentations while result == nil {
      result = implementation(a, b)
    }

As a result, testing and maintaining this code becomes much more simple.

#### Cognitive Complexity

While Cyclomatic Complexity determines how difficult your code will be
to test, Cognitive Complexity is how difficult it is to read and
understand. Therefore much of this involves breaks in logic, and
unnecessary loop statements. However by making your code flow clearly
from top to bottom this can be avoided.

#### File and Function Too Long

One of the easiest metrics of complexity is the length of your files and
functions. In the end, simply refactoring should resolve the issue. To
put it differently, break down large functions, classes, and structs
into smaller components. At the same time, you may find a class which is
difficult to split up such as a `UITableViewController`. In this case,
Swift extensions are a great way to resolve this.

#### Assignment Branch Condition

Assignment Branch Condition typically is calculated based on the number
of assignments, branches, and conditions as opposed to simply length.
Therefore, this can be resolved by separating your functions into
smaller pieces. In other words, reduce these complex elements from one
function into several.

------------------------------------------------------------------------

Many of these code quality issues should be resolved, however it is good
to not be overly concerned with some of these metrics. Similar to code
coverage, it is much more a case-by-case need for resolution.

Additionally there can easily be instances of false positives such as
*identical code* issues. In the end, it’s important to have a measured
but determined approach to code quality.

<figure>
<img src="https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/03/book-2.png" class="wp-image-877" />
</figure>

## Documenting Your Swift Package

If you intend to distribute your Swift package to the public then it’s
important to document your code and make that documentation easily
available. In the first place, take a look at [Apple’s guidance on
documenting Swift
code](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/)
as well as:

-   [**Swift Documentation** by Sarun
    Wongpatcharapakorn](https://sarunw.com/posts/swift-documentation/)
-   [**Swift Documentation** -
    NSHipster](https://nshipster.com/swift-documentation/)

Once you’ve properly documented your Swift package API, let’s add code
documentation to our Swift package continuous integration.

Primarily, you have the option of using either **[Jazzy by
Realm](https://github.com/realm/jazzy)** or
[**SourceDocs**](https://github.com/eneko/SourceDocs). Each has their
advantage depending on whether you wish to build a complete static HTML
site. In that case, I would recommend
**[Jazzy](https://github.com/realm/jazzy)**. Especially considering the
maturity of **[Jazzy](https://github.com/realm/jazzy)**, it can be an
excellent tool. On the other hand, if you wish to simply output Markdown
for your package documentation, I’d recommend
[**SourceDocs**](https://github.com/eneko/SourceDocs).

### Using SourceDocs

To build documentation using `sourcedocs`, first build your Swift
package using `swift build`. Once your package is built, you run
`sourcedocs` using:

    sourcedocs generate --spm-module PACKAGE_NAME

Additionally, you can use a different output directory besides
`Documentation`, such as `docs`. In order to do that, you can use the
flag `--output-folder` like so:

    sourcedocs generate --spm-module PACKAGE_NAME --output-folder docs

Furthermore, we can take the next step and integrate `sourcedocs` into
our Swift package Continuous Integration.

#### Adding SourceDocs to Swift Package Continuous Integration

Similar to our other tools, we need to add `sourcedocs` to our Homebrew
bundle file:

    brew "swiftformat"
    brew "swiftlint"
    brew "sourcedocs"

Next in our macOS GitHub Action workflow file, we can add a step to
build the documentation:

        - name: Build Documentation
          run: sourcedocs generate --spm-module ${{ env.PACKAGE_NAME }} --output-folder docs

Lastly, in order to make sure our change is pushed, we need to add a
step to commit and push any documentation changes:

        - name: Commit files
          run: |
            git config --local user.email "action@github.com"
            git config --local user.name "GitHub Action"
            git status
            git add [DOCUMENTATION DIRECTORY]
            git diff-index --quiet HEAD || git commit -m "[github action] Update Docs"
            git push

A point often overlooked, is that this will fail if there is an already
existing push committed while this CI takes place. Therefore, in those
cases, the CI will fail. If you are concerned, I would recommend looking
at using a pull request rather than a direct push to the branch.

After having built documentation for our swift package, it is important
to make our package discoverable to others.

## Making Your Swift Package Available

Now that we have setup:

-   CI based on the supported platforms such as Linux
-   linting and code quality checks
-   code documentation

… let’s discuss how we can properly distribute the package to others.

### SwiftPM

While Swift packages can easily be added simply as a few lines in a
`Package.swift`, discoverability can be difficult. Luckily thanks to the
work of Dave Verwer, the community has a great site with
**[swiftpm.co](http://swiftpm.co)**.

However there are some checks we should add to make sure your Swift
package is valid. Additionally we can add these checks to the Swift
package continuous integration.

#### Using `jq` to Verify Products

With this intention, we need to make sure that our swift package has at
least one valid product. For instance, under the product section of my
`Package.swift` for my package
**[AssetLib](https://github.com/brightdigit/AssetLib)**, it has a
library product listed:

    ...
      products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
          name: "AssetLib",
          targets: ["AssetLib"]
        )
      ],
    ...

Fortunately, we can automate this by dumping the JSON of the package and
verifying the products listed using
**[jq](https://stedolan.github.io/jq/)**.
**[jq](https://stedolan.github.io/jq/)** is a fantastic command-line
tool for processing JSON data similar to *sed*. Therefore by piping the
JSON from the swift subcommand `package dump-package` to `jq`, we can
check the number products:

    swift package dump-package | jq -e ".products | length > 0"

As can be seen, we are using the filter string to check the `length`
property of the property `products` to see if there is more than one
product.

Lastly, we can submit our Swift package for review by:

-   Forking **[the Repo](https://github.com/daveverwer/SwiftPMLibrary)**
-   Adding our repos to `packages.json`
-   Making sure `packages.json` is sorted via `jq` by running:  
    `echo "$(jq 'sort_by(ascii_downcase)' packages.json)" > packages.json`
-   Run `validate.sh`
-   Create a pull request in GitHub

Then wait for acceptance to see your package listed at
**[swiftpm.co](http://swiftpm.co)**.

### Cocoapods Compatibility

While Swift packages are the future of dependency management, there are
several reasons why **[Cocoapods](https://cocoapods.org)** is still in
use. For this reason, it’s a good idea to add support for
**[Cocoapods](https://cocoapods.org)** to your library. Luckily, there
are only a few simple steps to add for making our Swift package is
compatible.

Once you have **[Cocoapods](https://cocoapods.org)** installed, create
the **[Cocoapods](https://cocoapods.org)** spec by running:

    pod spec create $(git remote get-url origin)

At the present time, you should have a `.podspec` file named after your
library. Inside the `.podspec.` file, add or set:

-   Long description under `spec.description`
-   Short summary under `spec.summary`
-   [Create License
    File](https://help.github.com/en/github/building-a-strong-community/adding-a-license-to-a-repository)
    and set the set license type and file name under `spec.license`
-   Your name and email address under `spec.author`
-   [The deployment targets for each operating
    system](https://guides.cocoapods.org/syntax/podspec.html#deployment_target)
-   The `spec.source` to the repository url and git tag of the target
    version
-   `spec.source_files` to `Sources/**/*.swift`
-   The `spec.swift_versions`

Lastly we can verify our package is valid in our existing continuous
integration by including `pod lib lint` within the macOS sections of our
script.

#### Setting Up An Example Project

Additionally I would encourage creating an example project using your
library with targets in each operating system. Moreover, we can also
verify our example project builds. After creating the example project in
a directory called Example, create a Podfile using `pod init`. Then
update the `Podfile` by adding a reference to your pod in the parent
directory:

    ...
    target 'iOS Example' do
      # Comment the next line if you don't want to use dynamic frameworks
      use_frameworks!
      pod 'PackageName', :path => '../'

      # Pods for iOS Example

    end
    ...

Next to verify the build in our macOS continuous integration, include
the following lines:

    if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
    ...
      swift package generate-xcodeproj
      pod install --silent --project-directory=Example
      xcodebuild -quiet -workspace Example/Example.xcworkspace -scheme "iOS Example"  ONLY_ACTIVE_ARCH=NO  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
      xcodebuild -quiet -workspace Example/Example.xcworkspace -scheme "tvOS Example"  ONLY_ACTIVE_ARCH=NO   CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
      xcodebuild -quiet -workspace Example/Example.xcworkspace -scheme "macOS Example"  ONLY_ACTIVE_ARCH=NO CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
    ...

In other words, this script example for Travis-CI, will:

-   Generate the Xcode project **[Cocoapods](https://cocoapods.org)**
    needs.
-   Install the **[Cocoapod](https://cocoapods.org)** and create the
    workspace file
-   Build each application target for each operating system

Therefore, we have created a `.podspec` and added continuous integration
for the pod as well as the example project. Lastly, we need to push the
repository to GitHub and tag it with the proper version. Once that’s
done, make sure you have a **[Cocoapods](https://cocoapods.org)**
account setup and run: `pod trunk push NAME.podspec` to push our repo.

## Examples and Integration

In the end, it's important to make sure your package maintains good
quality, works on its designated platforms, is easily available, and is
fully tested. If you are interested, you can check out packages which I
have implemented using these practices:

-   **[Base32Crockford](https://github.com/brightdigit/Base32Crockford)** -
    the Swift implementation of [the Base32Crockford
    encoding](https://www.crockford.com/base32.html)
-   **[AssetLib](https://github.com/brightdigit/AssetLib)** - which
    reads and updates app icon and image set information used in Xcode
    Asset Libraries
-   **[SwiftVer](https://github.com/brightdigit/swiftver)** - reads
    version information from Bundles and Plists as well as information
    stored from version control
    using [autorevision](https://autorevision.github.io/)

Furthermore, you can use my GitHub template
**[EggSeed](https://github.com/brightdigit/EggSeed)**, which automates
most of what we've talked about here:

-   creation of a Swift package library
-   creation of Cocoapod spec
-   setup of example projects
-   SwiftLint and SwiftFormat tooling
-   code documentation setup
-   CI Integration with Travis-CI, GitHub Actions, and CodeCov.IO

Additionally, badges are included from
**[shields.io](https://shields.io)** to showcase the quality of your
Swift package continuous integration.

Feel free to reach out if you have any additional questions
<a href="https://twitter.com/leogdion" id="signup">on Twitter <strong>@leogdion</strong></a>
or signup for the newsletter below to get the latest tutorials and
guides on Swift development.