---
title: You Need A Plan For Swift Error Handling
date: 2020-12-08 03:47
description: Learn the best strategies for how to manage error handling when developing
  apps in Swift. See examples of processes for common Swift errors
tags: swift, swiftui
featuredImage: /media/wp-images/brightdigit/2020/12/Screen-Shot-2020-12-03-at-7.27.00-AM-3.png
---
With the use of Swift as the sole language for creating apps with Apple,
it is now essential to know how to plan for, and respond to, Swift-based
errors in your app. 

There will always be errors you do not expect. As developers, we want as
much information about how and why something failed to either make the
best possible change to the code or to help the user respond. However,
**what is most helpful for the developer is not always so helpful for
the user, which is critical to understand if you want a successful
app.**

This article is designed to help both developers and team managers:

-   create a plan for dealing with errors; and
-   offer examples of how to effectively handle the most common errors
    you’ll encounter.

## Successful Swift Error Handling Always Starts With A Plan

If you’re on a team that manages an app’s codebase, or are the manager
of that team, you need to have an effective plan for dealing with
errors. Not having a plan, or having a plan not clearly understood by
everyone, is going to needlessly create more work for everyone, and
you’ll find it difficult to deliver a consistent and satisfying
experience to your users.

An effective error handling plan for a Swift-built app should include:

-   **Recording and Tracking Errors**  
    You need a tool that records and tracks errors. Crashlytics and
    Bugsnag are two popular ones. Beyond that, you should have some kind
    of internal process on the team level for acknowledging, assigning,
    and reviewing errors, so that they don’t use up more team resources
    than necessary to address.  
-   **Error Testing**  
    If you expect an error and crash, you should test for those in your
    unit tests. While XCTest provides ways to test for errors, crashes
    take a little bit of work. 

I’d recommend taking a look at the [links on our Error Handling
episode](https://share.transistor.fm/s/03d8db53) with Jeff Kelley or his
presentation from 360iDev:

https://vimeo.com/366587634

  
A successful testing approach for Swift should then include this
functionality, allowing you to be able to proactively fix and, more
importantly, anticipate and accommodate expected errors.  

-   **Communicating With Users**  
    This last part is essential to delivering a quality user experience.
    So many apps that experience errors do an inadequate job of
    communicating to the user how and why an error occurs, or what the
    user might be able to do to avoid the error in the future. A
    successful error handling plan should include an approach to using
    UI tools to inform and help your user when they experience an error
    using your app.

That last part of the plan, clearly communicating with and engaging your
user in the event of an error, can be very challenging. To help, I’ve
got examples of three of the most common types of errors you’ll likely
encounter, and how to engage your users when they happen.

### Networking Errors – Don’t Overwhelm Your User

Network errors are likely to be the most common type of error when
developing an app with Swift. Most iOS apps, or apps of any kind for
that matter, have networking as a core part of their functionality. 

As a preventative measure, you want some sort of indication built into
your app that there is network connectivity, especially if something is
in progress. For example, **if the app is transferring data, you should
make that clear to your user and warn them not to disconnect.**

Networking errors are a good example of the kind of error where you’ll
likely need your user to take action. If your app tries to connect and
the network is unavailable, use a dialogue screen explaining to your
user that the app has failed due to inadequate connectivity. For a
superior user experience, give the user the option to try and connect
again, if possible.

But, as anyone that has ever coded a *try again* button knows, this can
be difficult to do depending if your network architecture isn’t separate
from your app UI (common in most modern apps). The error and information
explaining why it happened need to be raised to a point where the user
can respond, which can be tricky to determine.

What is critical is considering how much detail about the network error
you want to relay to the user. While the error number and data are
useful for a developer, that much information is going to be
overwhelming to a non-technical user. As a rule, if the information is
not relevant to the user experience, it should be hidden from the user.

<figure>
<img src="https://brightdigit.com/wp-content/uploads/2020/12/Screen-Shot-2020-12-03-at-7.27.00-AM-3.png" class="wp-image-2252" alt="From Apple&#39;s Human Interface Guidelines on Alerts" /><figcaption aria-hidden="true"><a href="https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/">From Apple's Human Interface Guidelines on Alerts</a></figcaption>
</figure>

### Permissions – An Informed User is a Happy User

Building on communicating effectively with your user, sometimes you’ll
have errors that require your user to make decisions to get the app
working again. Apple’s system for accessing Protected Resources is a
source of great examples of this scenario. 

Even if you’re not intimately familiar with this aspect of the Apple
ecosystem, it’s easy enough to understand: **our phones and devices have
a lot of sensitive information about us on them these days**; Many apps
use this data to help their users; This includes location information,
your photos, and access to the camera itself, among other things. These
are known as Protected Resources.

Because not all apps need access to them, by default Apple restricts
access to Protected Resources. If an app needs a Protected Resource to
carry out a function and doesn’t have access, this will create an error.
To gain access, an app must make a case request, with an explanation of
why it needs permission to use certain data or hardware functions. The
user then decides whether to give permission to the app or not.

There are two key considerations when dealing with permissions. The
first is making it clear to the user why the app needs access to a given
Protected Resource. Apple itself is explicit about this:

***“Accurately and concisely explaining to the user why your app needs
access to sensitive data, typically in one complete sentence, lets the
user make an informed decision and improves the chances that they’ll
grant access.”***

Having an easy-to-understand explanation then is not only needed, it
makes for a better user experience and ultimately, a more successful
app.

The second consideration is deciding how to handle the user denying
permission. Again, clear communication to the user about the limitations
of the app’s functionality if denied access is helpful. You also must
decide, on a code level, how to deal with the persistent error of denied
permission.

Ideally, you want the user to still be able to use the app, even if
certain data or functions are not available. At the same time, it’s
important to continue to make it clear that if a user wants to do
something that needs a Protected Resource, they have to go into their
settings and grant permission.

A stumbling block to be aware of is in some cases there isn’t (yet) a
way of telling the difference between a lack of access and a lack of
input. A good example of this is heart rate monitoring: an app may
experience an error because it can’t collect data on a user’s heart
rate, but isn’t able to report whether this is because of a lack of
permission or because the heart rate sensor on the device isn’t working.

If you’re using health data, this is something to be aware of.

### Missing Files – How to Fail Gracefully

While many errors are recoverable with some help from the user,
sometimes there are errors that can happen, and will be fatal. How
should you handle these?

Ideally, you want to handle these errors as cleanly and gracefully as
possible. Missing files are a common example of this – when your app
can’t find or access a key resource it needs to function, like a
storyboard file, an image, a database, or a key piece of code. The app
needs to close and a bug report sent to the developer to review the
error and make fixes. 

Indicate to the user that something has gone seriously wrong and the app
needs to shut down. Perhaps offer them a button to close the app and
assure them that a bug report has been sent. You can also let them know
if it’s not just a glitch or the user has tampered with the app.*  *

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
Amazon Music Stitcher RadioPublic Pandora CastBox iHeartRadio TuneIn
Player FM SoundCloud Deezer Podcast Addict

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
<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTQ3cHgiIGhlaWdodD0iMTQ0cHgiIHZpZXdib3g9IjAgMCA1NDcgMTQ0IiB2ZXJzaW9uPSIxLjEiIGNsYXNzPSJ0cmFuc2lzdG9yLWxvZ28iPgogICAgPGcgaWQ9IlBhZ2UtMSIgc3Ryb2tlPSJub25lIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgaWQ9InRyYW5zaXN0b3JfaG9yaXpvbnRhbCIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkZGRkZGIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMDAwMDAwLCA0Mi4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJTaGFwZSIgcG9pbnRzPSIwLjcgMTAuNCAwLjcgMS44IDM4LjYgMS44IDM4LjYgMTAuNCAyNC41IDEwLjQgMjQuNSA1OC4zIDE0LjcgNTguMyAxNC43IDEwLjQiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik02My4zLDI2LjIgQzYyLjEsMjYgNjAuNywyNS44IDU4LjcsMjUuOCBDNTIuNCwyNS44IDQ4LjcsMjkuOSA0OC43LDM4LjIgTDQ4LjcsNTguMiBMMzkuNCw1OC4yIEwzOS40LDE4LjYgTDQ4LjUsMTguNiBMNDguNSwyNC4yIEw0OC43LDI0LjIgQzUwLjUsMjAuOCA1NC41LDE3LjMgNTkuOCwxNy4zIEM2MS4zLDE3LjMgNjIuMywxNy40IDYzLjMsMTcuNSBMNjMuMywyNi4yIEw2My4zLDI2LjIgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMTA3LjgsNTguMiBMOTguOCw1OC4yIEw5OC44LDUzLjIgTDk4LjYsNTMuMiBDOTUuOSw1Ni42IDkxLjYsNTkuNyA4NSw1OS43IEM3Ni4xLDU5LjcgNjYsNTIuNiA2NiwzOC40IEM2NiwyNS44IDc0LjksMTcuNCA4NS43LDE3LjQgQzkyLjMsMTcuNCA5Ni4zLDIwLjkgOTguNywyNCBMOTguOSwyNCBMOTguOSwxOC42IEwxMDcuOSwxOC42IEwxMDcuOSw1OC4yIEwxMDcuOCw1OC4yIFogTTg3LjQsNTEuNSBDOTMuNSw1MS41IDk5LjIsNDYuMiA5OS4yLDM4LjYgQzk5LjIsMzAuNiA5NCwyNS4zIDg3LjUsMjUuMyBDNzkuMywyNS4zIDc1LjQsMzEuOSA3NS40LDM4LjQgQzc1LjQsNDUgNzkuMiw1MS41IDg3LjQsNTEuNSBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMTguNiwxOC42IEwxMjcuOCwxOC42IEwxMjcuOCwyMy42IEwxMjgsMjMuNiBDMTMxLjEsMTkuMSAxMzUuNywxNy4zIDE0MC4xLDE3LjMgQzE0OC4zLDE3LjMgMTU1LjUsMjIuNyAxNTUuNSwzNS40IEwxNTUuNSw1OC4yIEwxNDYuMiw1OC4yIEwxNDYuMiwzNS45IEMxNDYuMiwyOS4xIDE0MywyNS41IDEzNy43LDI1LjUgQzEzMS45LDI1LjUgMTI3LjksMjkuNiAxMjcuOSwzNy4zIEwxMjcuOSw1OC4zIEwxMTguNiw1OC4zIEwxMTguNiwxOC42IEwxMTguNiwxOC42IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTE4My42LDI4LjggQzE4My4yLDI1LjkgMTgxLDI0IDE3OC4zLDI0IEMxNzUuMSwyNCAxNzMuMywyNiAxNzMuMywyOC4yIEMxNzMuMywzMC42IDE3NC41LDMyLjMgMTgxLjQsMzQuNiBDMTg5LjksMzcuMyAxOTIuOSw0MS43IDE5Mi45LDQ3LjMgQzE5Mi45LDU0LjYgMTg3LjQsNTkuNyAxNzguMyw1OS43IEMxNjguOCw1OS43IDE2NC4xLDU0LjUgMTYzLjQsNDcuMSBMMTcyLDQ3LjEgQzE3Mi40LDUwLjQgMTc0LjQsNTIuOSAxNzguNSw1Mi45IEMxODIsNTIuOSAxODQsNTAuNyAxODQsNDggQzE4NCw0NSAxODIuMyw0My4xIDE3NS43LDQwLjkgQzE2OC4zLDM4LjUgMTY0LjUsMzQuOCAxNjQuNSwyOC42IEMxNjQuNSwyMi4xIDE2OS42LDE3LjMgMTc4LDE3LjMgQzE4Ni41LDE3LjMgMTkxLDIyLjMgMTkyLDI4LjggTDE4My42LDI4LjggTDE4My42LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAxLDAuNCBMMjExLjMsMC40IEwyMTEuMyw5LjggTDIwMSw5LjggTDIwMSwwLjQgWiBNMjAxLjUsMTguNiBMMjEwLjgsMTguNiBMMjEwLjgsNTguMyBMMjAxLjUsNTguMyBMMjAxLjUsMTguNiBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yMzkuNSwyOC44IEMyMzkuMSwyNS45IDIzNi45LDI0IDIzNC4yLDI0IEMyMzEsMjQgMjI5LjIsMjYgMjI5LjIsMjguMiBDMjI5LjIsMzAuNiAyMzAuNCwzMi4zIDIzNy4zLDM0LjYgQzI0NS44LDM3LjMgMjQ4LjgsNDEuNyAyNDguOCw0Ny4zIEMyNDguOCw1NC42IDI0My4zLDU5LjcgMjM0LjIsNTkuNyBDMjI0LjcsNTkuNyAyMjAsNTQuNSAyMTkuMyw0Ny4xIEwyMjcuOSw0Ny4xIEMyMjguMyw1MC40IDIzMC4zLDUyLjkgMjM0LjQsNTIuOSBDMjM3LjksNTIuOSAyMzkuOSw1MC43IDIzOS45LDQ4IEMyMzkuOSw0NSAyMzguMiw0My4xIDIzMS42LDQwLjkgQzIyNC4yLDM4LjUgMjIwLjQsMzQuOCAyMjAuNCwyOC42IEMyMjAuNCwyMi4xIDIyNS41LDE3LjMgMjMzLjksMTcuMyBDMjQyLjQsMTcuMyAyNDYuOSwyMi4zIDI0Ny45LDI4LjggTDIzOS41LDI4LjggTDIzOS41LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjUyLjgsMTguNiBMMjU3LjgsMTguNiBMMjU3LjgsNS45IEwyNjcuMSw1LjkgTDI2Ny4xLDE4LjYgTDI3NywxOC42IEwyNzcsMjYuNCBMMjY3LDI2LjQgTDI2Nyw0NC4xIEMyNjcsNDkuNSAyNjguNyw1MSAyNzIuNSw1MSBDMjc0LjEsNTEgMjc1LjksNTAuNyAyNzcuMyw1MC4zIEwyNzcuMyw1Ny44IEMyNzUuMiw1OC40IDI3Mi42LDU4LjcgMjcwLjMsNTguNyBDMjYwLjQsNTguNyAyNTcuOCw1Mi43IDI1Ny44LDQ0LjYgTDI1Ny44LDI2LjQgTDI1Mi44LDI2LjQgTDI1Mi44LDE4LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzAyLjMsMTcuMyBDMzE0LjcsMTcuMyAzMjMuNSwyNi40IDMyMy41LDM4LjQgQzMyMy41LDUwLjEgMzE0LjYsNTkuNyAzMDIuMyw1OS43IEMyOTAuMiw1OS43IDI4MS4xLDUwLjQgMjgxLjEsMzguNCBDMjgxLjEsMjYuMSAyOTAuMywxNy4zIDMwMi4zLDE3LjMgWiBNMzAyLjMsNTEuNCBDMzA5LjMsNTEuNCAzMTQuMSw0NS44IDMxNC4xLDM4LjQgQzMxNC4xLDMxLjQgMzA5LjYsMjUuNSAzMDIuMywyNS41IEMyOTUuMiwyNS41IDI5MC41LDMxIDI5MC41LDM4LjQgQzI5MC41LDQ2IDI5NS45LDUxLjQgMzAyLjMsNTEuNCBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0zNTAuOSwyNS44IEMzNDQuNiwyNS44IDM0MC45LDI5LjkgMzQwLjksMzguMiBMMzQwLjksNTguMiBMMzMxLjYsNTguMiBMMzMxLjYsMTguNiBMMzQwLjcsMTguNiBMMzQwLjcsMjQuMiBMMzQwLjksMjQuMiBDMzQyLjcsMjAuOCAzNDYuNywxNy4zIDM1MiwxNy4zIEMzNTMuNSwxNy4zIDM1NC41LDE3LjQgMzU1LjUsMTcuNSBMMzU1LjUsMjYuMiBDMzU0LjMsMjYgMzUyLjksMjUuOCAzNTAuOSwyNS44IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxnIGlkPSJHcm91cCI+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNC4wMDAwMDAsIDI0LjAwMDAwMCkiIGlkPSJTaGFwZSI+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTQ4LDk1LjkgQzQ1LjQsOTUuOSA0My4yLDkzLjggNDMuMiw5MS4xIEw0My4yLDQuOSBDNDMuMiwyLjMgNDUuMywwLjEgNDgsMC4xIEM1MC42LDAuMSA1Mi44LDIuMiA1Mi44LDQuOSBMNTIuOCw5MS4xIEM1Mi44LDkzLjcgNTAuNiw5NS45IDQ4LDk1LjkgWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yOCw1Mi44IEw1LDUyLjggQzIuNCw1Mi44IDAuMiw1MC43IDAuMiw0OCBDMC4yLDQ1LjMgMi4zLDQzLjIgNSw0My4yIEwyOCw0My4yIEMzMC42LDQzLjIgMzIuOCw0NS4zIDMyLjgsNDggQzMyLjgsNTAuNyAzMC42LDUyLjggMjgsNTIuOCBaIj48L3BhdGg+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTkxLjEsNTIuOCBMNjgsNTIuOCBDNjUuNCw1Mi44IDYzLjIsNTAuNyA2My4yLDQ4IEM2My4yLDQ1LjMgNjUuMyw0My4yIDY4LDQzLjIgTDkxLDQzLjIgQzkzLjYsNDMuMiA5NS44LDQ1LjMgOTUuOCw0OCBDOTUuOCw1MC43IDkzLjcsNTIuOCA5MS4xLDUyLjggWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTcyLDE0NCBDMzIuMywxNDQgMCwxMTEuNyAwLDcyIEMwLDMyLjMgMzIuMywwIDcyLDAgQzExMS43LDAgMTQ0LDMyLjMgMTQ0LDcyIEMxNDQsMTExLjcgMTExLjcsMTQ0IDcyLDE0NCBaIE03Miw5LjYgQzM3LjYsOS42IDkuNiwzNy42IDkuNiw3MiBDOS42LDEwNi40IDM3LjYsMTM0LjQgNzIsMTM0LjQgQzEwNi40LDEzNC40IDEzNC40LDEwNi40IDEzNC40LDcyIEMxMzQuNCwzNy42IDEwNi40LDkuNiA3Miw5LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg==" class="transistor-logo" />](https://transistor.fm "Broadcast by Transistor.fm")
</span>

{{ episodes.length}} {{ show.playlist\_limit ? 'latest' : '' }} episodes

1.  <span class="icon-play-circle"
    v-show="!playing || (playing &amp;&amp;  selectedEpisodeIndex != index)"></span>
    <span class="icon-pause-circle"
    v-show="playing &amp;&amp; selectedEpisodeIndex === index"></span>
    <span class="playlist-title">{{ episode.title }}</span> {{
    episode.duration\_in\_minutes }} min

## Subscribe to the BrightDigit newsletter for more on best practices with Swift

 As a specialist iOS and Apple developer, I’m always looking to the
future to see what is coming next and how we can build better apps for
our customers. Being able to proactively address error handling in Swift
is a big part of not only building a better app but also optimizing the
time and resources you need to manage an app over its lifetime.

If that’s something you and your business are committed to,
[subscribe](https://brightdigit.com/subscribe/), where I’ll let you know
the latest best practices for making and maintaining Apple apps.