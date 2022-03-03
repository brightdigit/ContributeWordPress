---
title: Why 2020 will be amazing for the Apple Watch
date: 2020-04-13 06:30
description: 2020 is the year the Apple Watch will come into its own, moving from
  being a curiosity and a status object to a useful device for everyone.
tags: Apple Hardware, Apple Watch, apple-development, swiftui
featuredImage: /media/wp-images/brightdigit/2020/03/daniel-canibano-JE3ASpuEld4-unsplash-1.jpg
---
2020 is the year you should start building that Apple Watch app you’ve
been thinking about making.

At the time of writing, **the Apple Watch is coming up on its 5th
birthday**. The technology has come a long way since it was first
released. **With the release of its latest operating system, watchOS 6,
I believe this is the year the Apple Watch will come into its own.**
2020 is when it moves from being a curiosity and a status object to a
useful device for everyone.

<figure>
<img src="https://i2.wp.com/brightdigit.com/wp-content/uploads/2020/03/daniel-canibano-JE3ASpuEld4-unsplash-1.jpg?fit=640%2C263&amp;ssl=1" class="wp-image-2024" />
</figure>

If you’re thinking about building an app for the Watch, read on: **this
article is for you. **

I’ll be covering:

-   why and how the Apple Watch has improved
-   where it still needs improvement
-   and what you need to know to decide **if a watch app is a good idea
    for your business**

## Hearts & Minds: What the Apple Watch is good for.

**There are two core areas where the Watch can excel: health and
location.**

With so many of us using our personal data to become fitter and
healthier, the Watch represents an opportunity. watchOS 6 makes things a
lot easier when creating watch apps that help you measure data about
your body: everything from...

-   exercise time and speed
-   heart rate to your breathing
-   sleep patterns
-   or menstrual cycle

It’s relatively straightforward to design an app that allows you to
input the data via the Watch, as well as have the watch passively record
information while you’re active.

Secondly, **there is potential to incorporate location-based tools that
could be useful for business.** It's now easy to imagine your watch
tracking shipments and deliveries, or letting your customer know how far
away their delivery is on their watch. What if your watch could help you
navigate a building you're unfamiliar with, so you know you'll arrive on
time for a meeting? In another situation, a nurse could find out where a
doctor is in the hospital. It would mean not having to page them because
they could see they're seeing a patient or doing surgery.

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

## It’s come a long way, but Apple Watch still has a ways to go.

All that said, there are some things the Watch needs work on before it
can flex its complete potential: **battery and sensor improvements.**

While the battery of Series 3 or later Apple Watches is magnitudes
better than what Apple started with, it still runs down faster than I
feel most people will find convenient. The *always-on* display
introduced in the last couple of releases, while improving usability,
also doesn’t seem to have helped battery usage like Apple hoped it
would. **With so many apps needing direct connections to the internet –
a relatively energy-intensive task – the battery will need to be
improved if it’s going to succeed in the long term.**

At the same time, while the sensor capabilities the current Watch series
are powerful, they can still be less than reliable, notably when it
comes to movement and speed. That said, we are still very much in the
infancy of wearable technology, so it is reasonable to expect these to
improve and new sensors to be added: as an example, for the last few
years we’ve seen demos of watches that can help you monitor your blood
sugar levels – a boon for diabetics.

Finally, while I’m expecting this to change very soon at the time of
writing, Apple has not yet deployed StoreKit to the Watch – the
framework we use for functions related to the App Store. This will be
necessary if Apple wants to develop the Watch ‘app ecosystem’ and make
it easy to deploy, buy, and install apps on the Watch itself.

<figure>
<img src="https://i2.wp.com/brightdigit.com/wp-content/uploads/2020/03/Screen-Shot-2020-03-23-at-2.46.07-PM.png?fit=640%2C400&amp;ssl=1" class="wp-image-2020" alt="Building an Apple Watch app in Xcode" /><figcaption aria-hidden="true">Building an Apple Watch app in Xcode</figcaption>
</figure>

## So you want to build a Watch app?

**Businesses and organizations related to areas I’ve covered above,
especially health & fitness, are most likely to benefit from the Apple
Watch and its new operating system.** There are a few considerations I
think everyone should take into account before committing to a new app:

### Battery usage... again

The first consideration is, what kind of resources will your app need,
specifically related to the limitations of the current battery? If your
app needs frequent or constant connectivity to the cloud or a server,
you may find the results a little disappointing. Your users will likely
love the performance of a Watch app but will struggle with how quickly
the Watch runs out of juice.

If this is a critical need to serve your customers, **my recommendation
is to wait perhaps another year for Apple to tackle this challenge and
see what hardware improvements they deliver.**

### Is it going to take a long time to build?

Another thing to think about is how long it will take to build and
deploy your new app. With the release of independent Watch apps and
(hopefully) the imminent release of StoreKit for the Watch, the Apple
development community is expecting a number of important changes and
improvements. This may alter the needs or requirements of your app.

### To SwiftUI or not to SwiftUI

I recently covered [the significance of
SwiftUI](https://brightdigit.com/blog/2020/02/04/swiftui-everything-is-possible-if-you-think-like-apple/)
and how it’s going to change the way we build user interfaces on Apple
platforms, which I recommend [you skim if you’re
unfamiliar](https://brightdigit.com/blog/2020/02/04/swiftui-everything-is-possible-if-you-think-like-apple/).
**The key takeaway is if you’re able to work within the restrictions of
SwiftUI, it will make it easier (and probably cheaper) to create and
deliver an app to your customers where they will find the same quality
experience on their Macs, iPhones, iPads, and Watches. **

### Think about your customer’s wallet

Finally, a new Apple Watch isn’t cheap, so it’s not going to be for
everyone. **A brand-new small size Series 5 Watch will set you back
around $400; an even older Series 3 costs around $200.** Now, for a lot
of the benefits I’ve covered above, this is less important than the
release of the latest operating system, but you will want to consider
factors like screen size and whether your app will need the latest
hardware. I recommend, before you build the app, carefully considering
your own user base and their device usage: **Do they already mostly own
Watches, and will they really get a lot out of having your app on
them?**

## Want to keep track of the latest Apple Watch developments?

**If you’re interested in keeping up to date with what happens with the
Watch, and Apple-based app development, I invite you to [sign up for my
newsletter](https://brightdigit.com/subscribe/) or check out [our latest
posts on developing for the Apple
Watch](https://learningswift.brightdigit.com/category/watch/).** I will
let you know when I put out new content and if there are important
things you should know when it comes to creating or updating your apps.