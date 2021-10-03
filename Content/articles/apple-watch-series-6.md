---
date: 2020-10-06 12:26
description: Apple Watch Series 6 with WatchOS 7 presents exciting opportunities for
  Apple app developers and their customers with the power of watch face complications.
tags: swiftui
---
Apple unveiled its brand-new Apple Watch Series 6 on September 15 with
some fanfare. This was followed the next day by the release of the
Watch's latest operating system, WatchOS 7. 

This is a big deal for Apple app developers -- the new hardware and
software offer new features that significantly raise the bar for what is
possible with the Watch. Apple has given us the tools to create more
sophisticated kinds of apps, both standalone for the Watch, as well as
companions for iOS.

**By far the most important addition with WatchOS 7 is the newly enabled
ability to build complications (i.e. watch face elements) using
SwiftUI.** This opens up all kinds of possibilities for how we can show
information to users. There were also some great new service additions
with the Family Setup and Fitness+. Finally, on the hardware side, the
new blood oxygen sensor in the new Watch opens up opportunities for new
apps, particularly in the health and fitness segment.

I'll be covering a general overview of these new features, then dive
into what app developers can do to take advantage of this new release,
and what I think they should consider offering to their customers.

![](https://brightdigit.com/wp-content/uploads/2020/10/Apple_announces-watch-se_09152020-1024x881.jpg){.wp-image-2206}

## Watch Faces Are Now More Complicated... and that's a good thing.

The most interesting part of the new Apple Watch Series 6 release is the
power to create watch face complications using SwiftUI. Along with newly
added complications, this expands what we can put on the watch face. It
also makes the work of creating face customizations quicker and easier.

**SwiftUI complications remove the difficulties we've had building
custom elements for Watch apps or Watch companions to iOS apps.** This
is especially noticeable with navigation bars. Particularly, SwiftUI can
now be used to build dynamic navigation bars, the same as with any other
Apple platform. Even better, you can now code these elements and reuse
them, something that was painful about building apps on earlier versions
of the Watch.

*For more information on SwiftUI, [check out our SwiftUI articles
here.](https://brightdigit.com/blog/tag/swiftui/)*

The complications themselves are also more refined with SwiftUI. SwiftUI
can make use of the same tools we use to code other Apple apps. This
includes the ability to customize templates that already existed in
SwiftUI, but weren't usable before now for the Watch. You can now also
have more than one complication and watch face for an app. This has been
a serious barrier before now to making more complex software. **We also
have more watch faces to choose from, with Apple pointing to the new
Stripes, Chronograph, and Artist faces, giving more options for what we
can render in a watch app.**

## New Blood Oxygen Sensor

The sensor on the Series 6 Watches that measures blood oxygen levels is
a great addition, particularly for developers that build apps for
clients in the healthcare and fitness industry. The way it works is
pretty straightforward -- the sensor measures the oxygen saturation
levels using LEDs built into the back of the Watch. 

What's also worth considering is what's not here (yet). The introduction
of the blood oxygen sensor speaks to increasing sophistication in the
Watch's hardware, which may mean even more impressive things are to
come.

For instance, what if the Series 7 Watches could help detect blood
*sugar* levels? Then we could build apps that could assist the millions
of diabetics in the world -- with a watch -- and transform the way they
manage their own health. Again, we're not there yet, but with this
technology improving by leaps and bounds, it may be here soon.

## Even more from Apple Watch Series 6?

The new Apple Watch Series 6 and has a couple of other things worth
briefly noting: 

### Family Setup

**Family Setup is a system that allows multiple Watches to connect to a
single iPhone.** Apple sells this with the idea that kids can
communicate with their parents through the Watch, while parents can keep
track of where their kids are and send them reminders.

### Hardware Performance

Overall, Series 6 is a nice improvement over its predecessors in terms
of power and performance. **It features a new CPU, the S6, making
everything run faster.** While the battery hasn't improved like we were
hoping, it maintains 18 hours of battery life despite hardware upgrades
and now includes fast-charging capability.

## So, what does this all mean?

Several months back, I'd said that while the Apple Watch was good, it
needed more improvements before it deserved great investment. With the
exception of battery life, this new release demonstrates the maturity of
the platform -- it's ready to stop being a curiosity worn only by early
adopters and tech enthusiasts, and into something that most public
consumers could benefit from having. The Apple Watch, in short, has
arrived.

**The Apple Watch SE will also likely contribute to bringing more users
into the fold with a smaller price tag while not skimping on
performance.** The SE models have the same size display, while only
really compromising by not having an always-on display, the newest
sensors found on the Series 6 (like the blood oxygen sensor), and limits
on available colours and materials.I would anticipate at least a few
people go in for this, especially first-time buyers of Apple Watches or
Apple products generally.

This means now is the perfect time to build an app for the Apple Watch
or a companion app for iOS. Doing so has never been easier, both to
build the app and to integrate it with other Apple devices. Getting
started now also means getting ahead of the curve, so by the time Series
7 is released, which will likely be a refinement of the major changes
delivered this year, you can take full advantage of the latest Apple has
to offer.

![](https://brightdigit.com/wp-content/uploads/2020/10/luke-chesser-vCF5sB7QecM-unsplash-1024x683.jpg){.wp-image-2210}

## What Can You Do Now?

Since there's such a wide range of things you do with the new Watch,
rather than try to wade through the technical possibilities, I've got
three examples of apps that can be made with the new Watch that was not
possible with older models/OS versions:

### Pizza Delivery

This was a great idea that my recent guest to my podcast, Steve Lipton,
casually mentioned. I think it makes a great example of a companion app
that could make use of multiple complications and watch faces.

> I made an order form on a watch to order a pizza. In reality, that\'s
> not something that people will be doing is sitting there, scrolling
> away, trying to hit buttons. They\'ll do that on their phones.
> Instead, what they\'ll do is look at their watch and know where when
> the delivery time is going to be.
>
> Steve Lipton - Episode 63

First off, given its size, you're not likely going to enjoy trying to
order a pizza on the Watch (with maybe the exception of a repeat order
that the app remembered) ---You'll still be wanting an iPhone or iPad.
Once the order is made, however, the companion app could tell the
customer, with a glance at their wrist:

-   the status of their order
-   how long until delivery arrives
-   a map showing the delivery driver's progress
-   even a message alert from the driver

### Sports Tracking App

This takes advantage of the new multiple complications and watch faces.
This app could conveniently let the user know the stats of, say, an
ongoing hockey game while they are out walking their dog. With a single
face (perhaps Stripes, Infograph, or Modular) you could have
complications showing the time, score, as well as more detailed
information like who scored the last goal or is in the penalty box. With
WatchOS 7, displaying this relatively large amount of fast-moving data
can be achieved relatively painlessly.

### Health & Fitness Monitoring App

I would be amiss if I didn't mention the potential of new health &
fitness apps for the Watch, something Apple itself heavily emphasized
during the release with its Fitness+ workout service, 

**With all these new features, you could have a watch-based 'cardiobot'
that could track, display, and record various statistics related to the
user's heart (heart rate, blood oxygen level, ECG).** This could be
helpful for someone out for a run focusing on maintaining an optimal
heart rate. It could be equally helpful for a more sedentary user,
alerting them to make sure they're drinking enough water, or when it
would be a good idea to go out for a walk. It could even alert medical
services if it detects an arrhythmia or dangerous slowing of the
wearer's heart.

::: {.iframe}
::: {#embed-app episodes="[{\"id\":349434,\"title\":\"Apple Watch 2020 with Steve Lipton\",\"episode_type\":\"full\",\"number\":63,\"season\":1,\"formatted_published_at\":\"September 19, 2020\",\"duration\":2962,\"duration_in_minutes\":49,\"duration_in_mmss\":\"49:22\",\"trackable_media_url\":\"https://pdcn.co/e/media.transistor.fm/21517a94/ac42f9f8.mp3\",\"share_url\":\"https://share.transistor.fm/s/21517a94\",\"transcript_url\":null,\"artwork\":\"https://images.transistor.fm/file/transistor/images/episode/349434/thumb_1600348274-artwork.jpg\",\"author\":\"Leo Dion, Principal CEO and Swift Developer at BrightDigit \",\"formatted_summary\":\"In this episode, Leo talks with Steve Lipton about the Apple Watch. We go into detail on the September Apple Event, watchOS 7, iOS 14 release, Apple Watch Series 6, and more.\",\"embed_html\":\"\\u003ciframe width=\\\"100%\\\" height=\\\"180\\\" frameborder=\\\"no\\\" scrolling=\\\"no\\\" seamless src=\\\"https://share.transistor.fm/e/21517a94\\\"\\u003e\\u003c/iframe\\u003e\"}]" show="{\"id\":122,\"title\":\"Empower Apps\",\"website\":\"https://www.empowerapps.show\",\"multiple_seasons\":false,\"playlist_limit\":7,\"feed_url\":\"https://feeds.transistor.fm/empowerapps-show\",\"private_feed\":false,\"disable_feed\":false,\"disable_downloads\":false,\"apple_podcasts_url\":\"https://itunes.apple.com/us/podcast/empower-apps/id1437435392?mt=2\",\"spotify\":\"https://open.spotify.com/show/0TGuZyeXPPyxYe1JApM6Z5\",\"overcast\":\"https://overcast.fm/itunes1437435392/empower-apps\",\"stitcher\":\"https://www.stitcher.com/s?fid=240018\\u0026refid=stpr\",\"pocket_casts\":\"https://pca.st/9n7e\",\"castro\":\"https://castro.fm/itunes/1437435392\",\"podcast_addict\":\"https://podcastaddict.com/podcast/2393954\",\"deezer\":\"\",\"google_podcasts\":\"https://www.google.com/podcasts?feed=aHR0cHM6Ly9mZWVkcy50cmFuc2lzdG9yLmZtL2VtcG93ZXJhcHBzLXNob3c%3D\",\"radioPublic\":\"https://radiopublic.com/empower-apps-WezKN2\",\"breaker\":\"https://www.breaker.audio/empower-apps\",\"tuneIn\":\"http://tun.in/pjaZJ\",\"castbox\":\"https://castbox.fm/ch/1453575\",\"pandora\":\"https://www.pandora.com/podcast/empower-apps/PC:21228\",\"iHeartRadio\":\"https://iheart.com/podcast/78369923/\",\"soundcloud\":\"\",\"amazon_music\":\"https://music.amazon.com/podcasts/0e053161-686d-47e6-91a1-31d55b121423/Empower-Apps\",\"player_FM\":\"https://player.fm/series/empower-apps\"}"}
::: {#embed-player .player-large .player-light :class="{ 'player-playlist': isPlaylist }" aria-label="Audio Player for Empower Apps" tabindex="1"}
::: {.player-main}
::: {.player-artwork tabindex="-1"}
[]{.play-btn .icon-play-circle v-show="!playing" title="Play"
aria-hidden="true" focusable="false"} []{.pause-btn .icon-pause-circle
v-show="playing" title="Pause" aria-hidden="true" focusable="false"}

::: {.loader-ring v-show="loading"}
:::
:::

::: {.player}
::: {.playback-progress}
::: {.currently-playing}
::: {.show-title}
**{{ show.title }}** •
[Trailer]{v-if="selectedEpisode.episode_type === 'trailer'"}
[Bonus]{v-if="selectedEpisode.episode_type === 'bonus'"} [Episode {{
selectedEpisode.number }}]{v-if="selectedEpisode.number"} • Season {{
selectedEpisode.season }}
:::

::: {.title}
{{ selectedEpisode.title }}
:::
:::

::: {.play-progress}
[]{.play-btn .icon-play-circle v-show="!playing" title="Play"
aria-hidden="true" focusable="false"} []{.pause-btn .icon-pause-circle
v-show="playing" title="Pause" aria-hidden="true" focusable="false"}

::: {.loader-ring v-show="loading"}
:::

::: {#progressBar title="Seek" @click="seekTo" aria-label="Seek within Episode"}
[]{#progress :style="{ left: '-'+ progressBar + '%' }"}
:::
:::

::: {.playback-controls}
::: {.playback-duration}
{{ currentTimer }}\|{{ currentDuration }}
:::

::: {.volume-speed-controls}
{{ displaySpeed }}x
:::
:::
:::

[Subscribe]{#subscribeBtn} [Share]{#shareBtn} [More Info]{#infoBtn}
:::

::: {.subscribe .panel :class="{ expanded: expandedPanel === 'subscribe' }"}
[]{.close-btn .icon-cancel-circle @click.prevent="closePanel"}

::: {.title}
Subscribe
:::

::: {.copyable-input v-if="!show.private_feed && !show.disable_feed"}
RSS Feed []{.copy-btn .icon-copy v-clipboard:copy="feed_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy RSS Feed URL to clipboard"}
:::

::: {.social-links}
Apple Podcasts Google Podcasts Spotify Pocket Casts Overcast Castro
Amazon Music Breaker Stitcher RadioPublic Pandora CastBox iHeartRadio
TuneIn Player FM SoundCloud Deezer Podcast Addict
:::
:::

::: {.sharing .panel :class="{ expanded: expandedPanel === 'sharing' }"}
[]{.close-btn .icon-cancel-circle @click.prevent="closePanel"}

::: {.title}
Share
:::

::: {.copyable-input}
Embed []{.copy-btn .icon-copy v-clipboard:copy="embed_html"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Embed code to clipboard"}
:::

::: {.copyable-input v-if="!show.private_feed"}
Share []{.copy-btn .icon-copy v-clipboard:copy="share_url"
v-clipboard:success="onCopy" title="Copy to clipboard"
aria-label="Copy Share URL to clipboard"}
:::

::: {.share-links}
[]{.twitter .icon-twitter-circle} []{.facebook .icon-facebook-circle}
[]{.download .icon-download-circle}
:::
:::

::: {.details .panel :class="{ expanded: expandedPanel === 'more' }"}
[]{.close-btn .icon-cancel-circle @click.prevent="closePanel"} **{{
selectedEpisode.formatted_published_at }}** •
[Trailer]{v-if="selectedEpisode.episode_type === 'trailer'"}
[Bonus]{v-if="selectedEpisode.episode_type === 'bonus'"} [Episode {{
selectedEpisode.number }}]{v-if="selectedEpisode.number"} • Season {{
selectedEpisode.season }}

::: {.details-title}
{{ selectedEpisode.title }}
:::

::: {.details-author}
By {{ selectedEpisode.author }} • Full Transcript • View the Website
:::

::: {.details-summary v-html="selectedEpisode.formatted_summary"}
:::
:::

[ [**Broadcast by**
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTQ3cHgiIGhlaWdodD0iMTQ0cHgiIHZpZXdib3g9IjAgMCA1NDcgMTQ0IiB2ZXJzaW9uPSIxLjEiIGNsYXNzPSJ0cmFuc2lzdG9yLWxvZ28iPgogICAgPGRlZnM+PC9kZWZzPgogICAgPGcgaWQ9IlBhZ2UtMSIgc3Ryb2tlPSJub25lIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgaWQ9InRyYW5zaXN0b3JfaG9yaXpvbnRhbCIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkZGRkZGIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOTEuMDAwMDAwLCA0Mi4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJTaGFwZSIgcG9pbnRzPSIwLjcgMTAuNCAwLjcgMS44IDM4LjYgMS44IDM4LjYgMTAuNCAyNC41IDEwLjQgMjQuNSA1OC4zIDE0LjcgNTguMyAxNC43IDEwLjQiPjwvcG9seWdvbj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik02My4zLDI2LjIgQzYyLjEsMjYgNjAuNywyNS44IDU4LjcsMjUuOCBDNTIuNCwyNS44IDQ4LjcsMjkuOSA0OC43LDM4LjIgTDQ4LjcsNTguMiBMMzkuNCw1OC4yIEwzOS40LDE4LjYgTDQ4LjUsMTguNiBMNDguNSwyNC4yIEw0OC43LDI0LjIgQzUwLjUsMjAuOCA1NC41LDE3LjMgNTkuOCwxNy4zIEM2MS4zLDE3LjMgNjIuMywxNy40IDYzLjMsMTcuNSBMNjMuMywyNi4yIEw2My4zLDI2LjIgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMTA3LjgsNTguMiBMOTguOCw1OC4yIEw5OC44LDUzLjIgTDk4LjYsNTMuMiBDOTUuOSw1Ni42IDkxLjYsNTkuNyA4NSw1OS43IEM3Ni4xLDU5LjcgNjYsNTIuNiA2NiwzOC40IEM2NiwyNS44IDc0LjksMTcuNCA4NS43LDE3LjQgQzkyLjMsMTcuNCA5Ni4zLDIwLjkgOTguNywyNCBMOTguOSwyNCBMOTguOSwxOC42IEwxMDcuOSwxOC42IEwxMDcuOSw1OC4yIEwxMDcuOCw1OC4yIFogTTg3LjQsNTEuNSBDOTMuNSw1MS41IDk5LjIsNDYuMiA5OS4yLDM4LjYgQzk5LjIsMzAuNiA5NCwyNS4zIDg3LjUsMjUuMyBDNzkuMywyNS4zIDc1LjQsMzEuOSA3NS40LDM4LjQgQzc1LjQsNDUgNzkuMiw1MS41IDg3LjQsNTEuNSBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMTguNiwxOC42IEwxMjcuOCwxOC42IEwxMjcuOCwyMy42IEwxMjgsMjMuNiBDMTMxLjEsMTkuMSAxMzUuNywxNy4zIDE0MC4xLDE3LjMgQzE0OC4zLDE3LjMgMTU1LjUsMjIuNyAxNTUuNSwzNS40IEwxNTUuNSw1OC4yIEwxNDYuMiw1OC4yIEwxNDYuMiwzNS45IEMxNDYuMiwyOS4xIDE0MywyNS41IDEzNy43LDI1LjUgQzEzMS45LDI1LjUgMTI3LjksMjkuNiAxMjcuOSwzNy4zIEwxMjcuOSw1OC4zIEwxMTguNiw1OC4zIEwxMTguNiwxOC42IEwxMTguNiwxOC42IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTE4My42LDI4LjggQzE4My4yLDI1LjkgMTgxLDI0IDE3OC4zLDI0IEMxNzUuMSwyNCAxNzMuMywyNiAxNzMuMywyOC4yIEMxNzMuMywzMC42IDE3NC41LDMyLjMgMTgxLjQsMzQuNiBDMTg5LjksMzcuMyAxOTIuOSw0MS43IDE5Mi45LDQ3LjMgQzE5Mi45LDU0LjYgMTg3LjQsNTkuNyAxNzguMyw1OS43IEMxNjguOCw1OS43IDE2NC4xLDU0LjUgMTYzLjQsNDcuMSBMMTcyLDQ3LjEgQzE3Mi40LDUwLjQgMTc0LjQsNTIuOSAxNzguNSw1Mi45IEMxODIsNTIuOSAxODQsNTAuNyAxODQsNDggQzE4NCw0NSAxODIuMyw0My4xIDE3NS43LDQwLjkgQzE2OC4zLDM4LjUgMTY0LjUsMzQuOCAxNjQuNSwyOC42IEMxNjQuNSwyMi4xIDE2OS42LDE3LjMgMTc4LDE3LjMgQzE4Ni41LDE3LjMgMTkxLDIyLjMgMTkyLDI4LjggTDE4My42LDI4LjggTDE4My42LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAxLDAuNCBMMjExLjMsMC40IEwyMTEuMyw5LjggTDIwMSw5LjggTDIwMSwwLjQgWiBNMjAxLjUsMTguNiBMMjEwLjgsMTguNiBMMjEwLjgsNTguMyBMMjAxLjUsNTguMyBMMjAxLjUsMTguNiBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yMzkuNSwyOC44IEMyMzkuMSwyNS45IDIzNi45LDI0IDIzNC4yLDI0IEMyMzEsMjQgMjI5LjIsMjYgMjI5LjIsMjguMiBDMjI5LjIsMzAuNiAyMzAuNCwzMi4zIDIzNy4zLDM0LjYgQzI0NS44LDM3LjMgMjQ4LjgsNDEuNyAyNDguOCw0Ny4zIEMyNDguOCw1NC42IDI0My4zLDU5LjcgMjM0LjIsNTkuNyBDMjI0LjcsNTkuNyAyMjAsNTQuNSAyMTkuMyw0Ny4xIEwyMjcuOSw0Ny4xIEMyMjguMyw1MC40IDIzMC4zLDUyLjkgMjM0LjQsNTIuOSBDMjM3LjksNTIuOSAyMzkuOSw1MC43IDIzOS45LDQ4IEMyMzkuOSw0NSAyMzguMiw0My4xIDIzMS42LDQwLjkgQzIyNC4yLDM4LjUgMjIwLjQsMzQuOCAyMjAuNCwyOC42IEMyMjAuNCwyMi4xIDIyNS41LDE3LjMgMjMzLjksMTcuMyBDMjQyLjQsMTcuMyAyNDYuOSwyMi4zIDI0Ny45LDI4LjggTDIzOS41LDI4LjggTDIzOS41LDI4LjggWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjUyLjgsMTguNiBMMjU3LjgsMTguNiBMMjU3LjgsNS45IEwyNjcuMSw1LjkgTDI2Ny4xLDE4LjYgTDI3NywxOC42IEwyNzcsMjYuNCBMMjY3LDI2LjQgTDI2Nyw0NC4xIEMyNjcsNDkuNSAyNjguNyw1MSAyNzIuNSw1MSBDMjc0LjEsNTEgMjc1LjksNTAuNyAyNzcuMyw1MC4zIEwyNzcuMyw1Ny44IEMyNzUuMiw1OC40IDI3Mi42LDU4LjcgMjcwLjMsNTguNyBDMjYwLjQsNTguNyAyNTcuOCw1Mi43IDI1Ny44LDQ0LjYgTDI1Ny44LDI2LjQgTDI1Mi44LDI2LjQgTDI1Mi44LDE4LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzAyLjMsMTcuMyBDMzE0LjcsMTcuMyAzMjMuNSwyNi40IDMyMy41LDM4LjQgQzMyMy41LDUwLjEgMzE0LjYsNTkuNyAzMDIuMyw1OS43IEMyOTAuMiw1OS43IDI4MS4xLDUwLjQgMjgxLjEsMzguNCBDMjgxLjEsMjYuMSAyOTAuMywxNy4zIDMwMi4zLDE3LjMgWiBNMzAyLjMsNTEuNCBDMzA5LjMsNTEuNCAzMTQuMSw0NS44IDMxNC4xLDM4LjQgQzMxNC4xLDMxLjQgMzA5LjYsMjUuNSAzMDIuMywyNS41IEMyOTUuMiwyNS41IDI5MC41LDMxIDI5MC41LDM4LjQgQzI5MC41LDQ2IDI5NS45LDUxLjQgMzAyLjMsNTEuNCBaIiBpZD0iU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0zNTAuOSwyNS44IEMzNDQuNiwyNS44IDM0MC45LDI5LjkgMzQwLjksMzguMiBMMzQwLjksNTguMiBMMzMxLjYsNTguMiBMMzMxLjYsMTguNiBMMzQwLjcsMTguNiBMMzQwLjcsMjQuMiBMMzQwLjksMjQuMiBDMzQyLjcsMjAuOCAzNDYuNywxNy4zIDM1MiwxNy4zIEMzNTMuNSwxNy4zIDM1NC41LDE3LjQgMzU1LjUsMTcuNSBMMzU1LjUsMjYuMiBDMzU0LjMsMjYgMzUyLjksMjUuOCAzNTAuOSwyNS44IFoiIGlkPSJTaGFwZSI+PC9wYXRoPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxnIGlkPSJHcm91cCI+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNC4wMDAwMDAsIDI0LjAwMDAwMCkiIGlkPSJTaGFwZSI+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTQ4LDk1LjkgQzQ1LjQsOTUuOSA0My4yLDkzLjggNDMuMiw5MS4xIEw0My4yLDQuOSBDNDMuMiwyLjMgNDUuMywwLjEgNDgsMC4xIEM1MC42LDAuMSA1Mi44LDIuMiA1Mi44LDQuOSBMNTIuOCw5MS4xIEM1Mi44LDkzLjcgNTAuNiw5NS45IDQ4LDk1LjkgWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yOCw1Mi44IEw1LDUyLjggQzIuNCw1Mi44IDAuMiw1MC43IDAuMiw0OCBDMC4yLDQ1LjMgMi4zLDQzLjIgNSw0My4yIEwyOCw0My4yIEMzMC42LDQzLjIgMzIuOCw0NS4zIDMyLjgsNDggQzMyLjgsNTAuNyAzMC42LDUyLjggMjgsNTIuOCBaIj48L3BhdGg+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTkxLjEsNTIuOCBMNjgsNTIuOCBDNjUuNCw1Mi44IDYzLjIsNTAuNyA2My4yLDQ4IEM2My4yLDQ1LjMgNjUuMyw0My4yIDY4LDQzLjIgTDkxLDQzLjIgQzkzLjYsNDMuMiA5NS44LDQ1LjMgOTUuOCw0OCBDOTUuOCw1MC43IDkzLjcsNTIuOCA5MS4xLDUyLjggWiI+PC9wYXRoPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTcyLDE0NCBDMzIuMywxNDQgMCwxMTEuNyAwLDcyIEMwLDMyLjMgMzIuMywwIDcyLDAgQzExMS43LDAgMTQ0LDMyLjMgMTQ0LDcyIEMxNDQsMTExLjcgMTExLjcsMTQ0IDcyLDE0NCBaIE03Miw5LjYgQzM3LjYsOS42IDkuNiwzNy42IDkuNiw3MiBDOS42LDEwNi40IDM3LjYsMTM0LjQgNzIsMTM0LjQgQzEwNi40LDEzNC40IDEzNC40LDEwNi40IDEzNC40LDcyIEMxMzQuNCwzNy42IDEwNi40LDkuNiA3Miw5LjYgWiIgaWQ9IlNoYXBlIj48L3BhdGg+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg==){.transistor-logo}](https://transistor.fm "Broadcast by Transistor.fm")
]{.powered-by}
:::

::: {.break}
:::

::: {.playlist-header}
{{ episodes.length}} {{ show.playlist_limit ? \'latest\' : \'\' }}
episodes
:::

::: {.break}
:::

1.  []{.icon-play-circle
    v-show="!playing || (playing &&  selectedEpisodeIndex != index)"}
    []{.icon-pause-circle
    v-show="playing && selectedEpisodeIndex === index"} [{{
    episode.title }}]{.playlist-title} {{ episode.duration_in_minutes }}
    min
:::
:::
:::

## The new Apple Watch shows a lot of promise

I don't think there's been a more exciting time to be looking at
developing for the Apple Watch since it first came out. Having a tiny
computer on your wrist is a great idea, but it's taken years to make it
convenient, accessible, and worthwhile for both users and developers.

## Keep track of the latest in Apple Watch app development

If you want to stay up-to-date on developer-relevant news, advice, and
tips about the Watch and other platforms in the Apple ecosystem, I
regularly cover this through [my
newsletter.](https://brightdigit.com/subscribe/) As a specialist iOS and
Apple developer, I'm always looking to the future to see what is coming
next and how we can build better apps for our customers.