---
title: 'Working Remotely: Best Practices for Distributed iOS development'
date: 2021-02-25 04:17
description: Working remotely on iOS development can be very successful. To make it
  a powerful tool for building great apps, you should consider these best practices...
featuredImage: /media/wp-images/brightdigit/2021/02/dan-gold-kARZuSYMfrA-unsplash.jpg
---
2020 was the year so many businesses were pushed into remote work to
survive. **The number of Americans working remotely more than a day a
week has exploded from less than 25% to more than 67%.** And, for many,
it has been popular. Working remotely will be more common, even after
the global pandemic has passed.

Remote work in software development isn’t anything new. Just ask those
with experience in **[*distributed software
development*](https://www.smartsheet.com/content/distributed-software-development).**

There are some important lessons we’ve learned over the years on how to
do work remotely well. There are benefits that help both employees and
employers. I’ll go through the most important best practices you’re
going to want to put in place. This will ensure remote work supports
your capacity to build great iOS apps without slowing everything down.

<figure>
<img src="https://brightdigit.com/wp-content/uploads/2021/02/dan-gold-kARZuSYMfrA-unsplash-1024x576.jpg" class="wp-image-2270" />
</figure>

## The Benefits of Remote Working

As an independent developer, I have a bias for remote work – I’ve been
working remotely for almost 10 years. I’ve noticed major benefits:

-   **Dealing with Home Life** - It makes it easier to adapt to changing
    circumstances in your work and home life. If a project you’re
    working on needs your attention unexpectedly, or one of your
    children is home from school sick, it's much easier to adapt with
    everything you need within easy reach.

<!-- -->

-   **Saving Time and Money** - Working from home saves an enormous
    amount of time and money that you may not be aware of until you try
    it. It is estimated that, before COVID-19, the [average American was
    spending 225 hours a
    year](https://www.washingtonpost.com/business/2019/10/07/nine-days-road-average-commute-time-reached-new-record-last-year/)
    – more than nine calendar days – commuting.  As well, the cost of
    car maintenance and/or public transit adds up to thousands of
    dollars each year. And that’s to say nothing of what other things
    you could be doing for your work or life with that time.

<!-- -->

-    **Reducing Overhead** - It reduces overhead and productivity loss
    from commuting and needing an office to accommodate all your staff
    all the time. There is data that shows that, if management has a
    positive, trusting relationship with their staff, [remote work can
    give employees a significant productivity
    boost](https://www.inc.com/scott-mautz/a-2-year-stanford-study-shows-astonishing-productivity-boost-of-working-from-home.html).

<!-- -->

-   **Improved Flexibility** - Remote working can also make the business
    more competitive. First, the flexibility of remote work makes it
    easier for employees to deliver their best work and for employers to
    retain them. As well, remote working usually forces a shift toward
    focusing on whether goals are being met, and away from performance
    being judged by mere presence in the office.

Some of these benefits are hampered by the fact that remote working
needed to be implemented quickly. This is further compounded by
complications like healthcare, loss of business, and having kids remote
learning from home. However, we can reasonably expect it to get easier.

## Working Remotely Best Practices for iOS Development

### Get Buy-in

This should be obvious to most people, but with [the regular failure of
*workplace
transformations*](https://www.linkedin.com/pulse/73-business-transformations-fail-biggest-failure-factor-lowgren/),
the realization that [the much-vaunted open-plan office did the opposite
of what it was sold to
do](https://hbr.org/2019/11/the-truth-about-open-offices), and the
additional analysis that shows [such offices are excellent vectors of
disease](https://www.nationalgeographic.com/science/article/will-coronavirus-end-the-open-office-floor-plan),
it bears repeating. If you’re a manager, keen to implement remote work
for your team, you need to make the change collaborative. If you want
your developers to be effective with a remote work policy, **have them
be a part in creating it. **

The pandemic imposed this way of work on millions in a way that they
never got to have a say in, let alone prepare for.

### iOS App Provisioning

**App Provisioning is probably the single most important Apple-specific
consideration when it comes to remote work.** Apple has a chain of
authority between itself and your app. This chain is designed to make
sure your app is trustworthy and stable before being downloadable from
the App Store. Apple doesn’t make it especially easy to understand how
it works.

#### A Brief (as possible) explanation of iOS App Provisioning

First, there is the Apple Certificate Authority. It serves as the
gatekeeper to the App Store.

When you start building an iOS app, you create a Signing Certificate.
This identifies you as a developer recognized by Apple. Creating a
Signing Certificate generates a key on your computer (and only your
computer) that connects you to the Apple Certificate Authority.

With that done, the iOS app you’re creating is assigned an App ID,
linking your app to your Signing Certificate.

**Next, you must create Provisioning Profiles.** These profiles declare
connections between a specific build of your app and the App ID. Each
profile specifies what that build is for (i.e. internal development,
adhoc distribution, release to the App Store). It may also contain a
list of devices where the app can be tested and distributed.

Now, why does this all matter if you want to work remotely? Because to
make this work, you’re going to need to determine, for every member of
your development team, who has what access to a specific provision
profile, and on which machines (both in the work office and the remote
office). You'll also need to decide who handles the computer with the
Signing Certificate key.

It’s not especially difficult to manage once it’s done, but expect it to
be a time-consuming task to set up.

I highly recommend taking a look at the Fastlane suite and their [Match
command](https://docs.fastlane.tools/actions/match/) to help streamline
this. Also here's a great list of tech articles to help with this:

-   [DEMYSTIFYING IOS PROVISIONING By Cory
    Bohon](https://martiancraft.com/blog/2017/05/demystifying-ios-provisioning-part1/)
-   [What is a provisioning profile & code signing in iOS? by
    Abhimuralidharan](https://martiancraft.com/blog/2017/05/demystifying-ios-provisioning-part1/)

<figure>
<img src="https://brightdigit.com/wp-content/uploads/2021/02/chris-montgomery-smgTvepind4-unsplash-1024x768.jpg" class="wp-image-2271" />
</figure>

### Communication

Successful remote work is almost entirely about communication.
Critically, the style of communication needed for effective remote work
is different from those that are successful when everyone is together.
You need a different set of rules and tools for remote work
communication:

#### Choose your tools

For many teams, there is likely already an answer to the question of
what tool they want to use for communication because they’re already
using one. [Slack](https://slack.com/intl/en-us/) is far and away the
most popular. [MS
Teams](https://www.microsoft.com/en-us/microsoft-teams/group-chat-software)
and [Chanty](https://www.chanty.com) are also proven and effective
platforms. There are many different tools and platforms available
depending on how many people are involved and the details of what they
need.

#### Choose your communication rules

In an office, people pick up on what are usually unwritten rules of
communication through context and observation. This is obviously much
more difficult when your colleagues only appear as names on a screen.

To keep things running smoothly, make rules written and explicit.

-   How often should you reasonably wait for a response during work
    hours?
-   And work hours in which timezone?
-   With many channels, what information do you put in which channel?
-   If there are important announcements, how are those delivered?

These are just some questions for which the answers should rules or
guidelines.

With asynchronous communication, you need to be open to learning new
communication habits. You will need a different attitude than you do at
the office. People will not always message you back right away. If you
need to talk to someone about something important, schedule a meeting.

For more details on how to communicate remotely, [we did a podcast
episode on this very topic.](https://share.transistor.fm/s/2445da70) We
talked with Jacob Gorban who has been leading remote work for over 10
years at his company [**Apparent
Software.**](https://www.apparentsoft.com) Not only do we talk about
communication, but also keeping teams productive, managing iOS
development and more.

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

### Training/Code Review Planning

You will want a remote work-specific process for code review and
feedback, especially for junior developers who need mentoring. How you
handle this up to you: you might schedule meetings between senior
developers and juniors, or even (when conditions allow) having them meet
at the office.

### Working Remotely Doesn’t Work For Everyone

There are some conditions where remote work probably isn’t an optimal
policy. Much like getting buy-in, involving everyone and discussing how
remote work might work should reveal if it’s a good idea. That said,
there are cases where it can often be unhelpful:

-   Unstable or rapidly changing workflow  
    Remote work usually succeeds when the workflow is stable and
    consistent (even if there are rapid changes within the project
    itself). If the workflow is constantly shifting, remote work can
    work, but you’re probably going to discover you will need to bring
    everyone together often to ensure they’re all on the same page.

<!-- -->

-   Inexperienced teams or very old teams  
    Remote work tends to work best with teams that already know and
    understand each other well. If team members are working with each
    other for the first time, there is no reason they shouldn’t be able
    to work remotely, but they should have opportunities to work
    together to build better rapport.

On the other hand, teams that have been together for a long time, and
have up until this point only worked together in the same space, might
find remote work challenging if it goes against the grain of how they’ve
always worked together before.

None of this should be considered a universal rule, only that it
shouldn’t be surprising if teams like these find remote work to be
difficult.

## Getting started with working remotely

To make remote work iOS development a successful practice, you do need
to put in the work up front. A lot of it is communication-related, with
some technical. Done effectively, it can be a powerful tool for your
organization. It can help you develop better apps faster, and with less
overhead and friction than when working together in an office.

## Was this useful to you? You can get more helpful advice like with the BrightDigit newsletter

I put together a newsletter twice a month, where I deliver iOS and
iOS-related content and news. I aim to make sure that my subscribers are
always on the leading edge of knowing what’s going on in the rapidly
changing world of iOS and Apple. If you want to join them, [click here
to subscribe, and enjoy!](https://brightdigit.com/subscribe/)