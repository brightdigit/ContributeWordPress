---
date: 2021-05-25 20:36
description: "Learn four mistakes to avoid when designing your iOS App\u2019s UI so
  you can deliver a great experience to your users while keeping it easy to maintain."
---
It\'s common for UI design to be one of the last things development
teams think about when creating iOS apps. This includes situations when
the developers need to relay what they need to the designer, often
uncomfortably close to the launch date.

It's also common, in scenarios like this, to have designers not
specifically familiar with iOS, **creating UIs that look great on other
platforms, but end up looking messy and buggy when ported to iOS. **

This is understandable. **iOS UI design can be difficult**. But, as
understandable as it is, neglecting the app UI can sabotage even the
best-built app if it means people experience friction using it. 

**How can you create a UI for your iOS app that delights your user
without making it difficult to maintain**? Like many things in software,
a little bit of planning goes a long way in avoiding common mistakes.
**Here are four mistakes you see in iOS app UI design or when working
with UI designers.**

![](https://brightdigit.com/wp-content/uploads/2021/05/amelie-mourichon-wusOJ-2uY6w-unsplash-1-1024x512.jpg){.wp-image-2334
width="1024" height="512"}

## Mistake 1: Failing to Communicate

UI designers and app developers usually have very different skill sets
and notice different things when looking at the same app. This
distinction is often missed on a lot of projects.

On one hand, a designer may not understand all the code that has gone
into the app. So, they won't know what constraints they need to consider
when designing the UI. On the other hand, a developer may not understand
why a designer specified a particular layout.

The unfortunate reality is developers and designers can be confused by
each other\'s work during a project. This means missed opportunities and
deadlines, frustrated professionals, and time and cost overruns.

Avoiding this mistake is relatively simple: **create time and space for
both designer and developer to communicate directly in a way that works
for them.** It gives them room to develop a mutual understanding of both
what the app can do and how that can be designed to create a great user
experience.

::: {.iframe}
::: {#embed-app episodes="[{\"id\":367788,\"title\":\"UI Design for Developers with Heidi Helen Pilypas\",\"episode_type\":\"full\",\"number\":66,\"season\":1,\"formatted_published_at\":\"October 17, 2020\",\"duration\":2729,\"duration_in_minutes\":45,\"duration_in_mmss\":\"45:29\",\"trackable_media_url\":\"https://pdcn.co/e/media.transistor.fm/35474f21/9bc7b676.mp3\",\"share_url\":\"https://share.transistor.fm/s/35474f21\",\"transcript_url\":null,\"artwork\":\"https://images.transistor.fm/file/transistor/images/episode/367788/thumb_1601995933-artwork.jpg\",\"author\":\"Leo Dion, Principal CEO and Swift Developer at BrightDigit \",\"formatted_summary\":\"In this episode, Leo talks with Heidi Helen Pilypas about UI Design. We talk communication for developers, iOS 14 updates, Widgets, and SwiftUI.\",\"embed_html\":\"\\u003ciframe width=\\\"100%\\\" height=\\\"180\\\" frameborder=\\\"no\\\" scrolling=\\\"no\\\" seamless src=\\\"https://share.transistor.fm/e/35474f21\\\"\\u003e\\u003c/iframe\\u003e\"}]" show="{\"id\":122,\"title\":\"Empower Apps\",\"website\":\"https://www.empowerapps.show\",\"multiple_seasons\":false,\"playlist_limit\":7,\"feed_url\":\"https://feeds.transistor.fm/empowerapps-show\",\"private_feed\":false,\"disable_feed\":false,\"disable_downloads\":false,\"apple_podcasts_url\":\"https://itunes.apple.com/us/podcast/empower-apps/id1437435392?mt=2\",\"spotify\":\"https://open.spotify.com/show/0TGuZyeXPPyxYe1JApM6Z5\",\"overcast\":\"https://overcast.fm/itunes1437435392/empower-apps\",\"stitcher\":\"https://www.stitcher.com/s?fid=240018\\u0026refid=stpr\",\"pocket_casts\":\"https://pca.st/9n7e\",\"castro\":\"https://castro.fm/itunes/1437435392\",\"podcast_addict\":\"https://podcastaddict.com/podcast/2393954\",\"deezer\":\"\",\"google_podcasts\":\"https://www.google.com/podcasts?feed=aHR0cHM6Ly9mZWVkcy50cmFuc2lzdG9yLmZtL2VtcG93ZXJhcHBzLXNob3c%3D\",\"radioPublic\":\"https://radiopublic.com/empower-apps-WezKN2\",\"breaker\":\"https://www.breaker.audio/empower-apps\",\"tuneIn\":\"http://tun.in/pjaZJ\",\"castbox\":\"https://castbox.fm/ch/1453575\",\"pandora\":\"https://www.pandora.com/podcast/empower-apps/PC:21228\",\"iHeartRadio\":\"https://iheart.com/podcast/78369923/\",\"soundcloud\":\"\",\"amazon_music\":\"https://music.amazon.com/podcasts/0e053161-686d-47e6-91a1-31d55b121423/Empower-Apps\",\"player_FM\":\"https://player.fm/series/empower-apps\"}"}
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

## Mistake 2: Not Respecting The Development Environment of iOS

One error people often make is not recognizing the specific constraints
of building an app for iOS. Apple's ecosystem is unique, requiring you
to do things a certain way. There are limitations that are either
different or don't exist on other platforms. This affects everything --
from button placement and usage, to what fonts you can use and in what
sizes and weights.

This can be challenging if a designer isn't specifically versed in iOS.
There is an enormous appeal in having an app that you only have to build
once and can be used everywhere. But it\'s difficult, and sometimes
impossible, to take what you have on a website or Android app and make
it look and work the same way in iOS.

Trying to shoehorn an Android UI design into iOS will often lead to
shortcuts and hacks that work, but leaves you with an app that doesn't
look good and/or work reliably.

When it comes to both iOS development and design, if you don't want
headaches later on maintaining the app, you're far better off [building
and designing your app
natively](https://brightdigit.com/blog/2019/10/18/native-app-development-advantages/).
Apple also provides [guidelines to their platforms to help guide both
the design and development of the
app.](https://developer.apple.com/design/human-interface-guidelines/)
And with the widespread deployment of SwiftUI, Apple is encouraging us
to make it easy for ourselves.

![](https://brightdigit.com/wp-content/uploads/2021/05/harpal-singh-_zKxPsGOGKg-unsplash-1024x512.jpg){.wp-image-2335
width="1024" height="512"}

## Mistake 3: Not Being Consistent With Design

Related to the above, an issue app designers run into is trying to
design everything to be as customized as possible, but without
consistency. Designing this way is nothing new. It's very popular and
successful in web design, with whole rafts of different pattern
libraries and tools available.

But in iOS, this is more difficult to emulate, resulting in design
elements that are a hassle to update. They might also be only possible
with third-party plugins and libraries, creating a lot of dependencies
for the app.

To avoid design inconsistency: **having a single pattern library for an
iOS project is a good idea**, but only one. This means both elements
aren't going to have to be designed in every instance and ensures
consistency in appearance throughout.

Hopefully, [SwiftUI will likely make it easier to create pattern
libraries, making this mistake easier to avoid as time goes
on.](https://brightdigit.com/blog/2020/02/04/swiftui-everything-is-possible-if-you-think-like-apple/)

![](https://brightdigit.com/wp-content/uploads/2021/05/szabo-viktor-k1A0LleY4Mo-unsplash.jpg){.wp-image-2337}

## Mistake 4: Trying To Do Too Much With An App

The other mistake you often find with design inconsistency is an app's
design trying to do too much. Nowhere this is more evident than with
widgets in iOS 14, where a designer has tried to cram as much as
possible within it. 

Widgets should be all about focusing on communicating a single idea,
message, or bit of information to your user. Widgets, by design, need to
be **glanceable** -- they exist so people can get information quickly. 

*For example* let\'s say you have a weather app. It can show the users
lots of different details about the local weather. A good widget for an
app like this should ideally focus on only delivering one detail at a
time -- such as the current temperature. However, users may also want to
frequently know what the current forecast is as well.

The mistake happens if you design a widget fitting both temperature and
forecast together at the expense of no longer being glanceable. Sure,
you\'ve maximized available space, but your users will no longer find it
easy to look at quickly.

**Additionally, you also have to consider the different sizes of
iPhones.** A widget that's comfortable to look at on the 6.7" screen of
an iPhone 12 Pro might be difficult to read on the 5.4" iPhone 12 Mini.
And with the tendency for tech professionals to go in for the biggest
and best available, this can be easily missed by both developers and
designers before going live.

For apps like this, a good rule is to **always give things more space on
the screen than you think they need**. If you need to put that
information somewhere, you're best off:

1.  Offer the widget in larger sizes
2.  Creating two different widgets for each piece of information; or
3.  Have one widget, but make it easy for your user to change the
    information displayed.

Consider how much of that data is really necessary, and what your users
ask for. Sometimes having less leads to a more positive user experience

------------------------------------------------------------------------

So there you have it, four all-too-common mistakes to avoid when it
comes to UI design, and how you can stop them dragging down your iOS
app.

Good UI design creates a connection to your user gives them a pleasant,
effortless experience using your app. This can mean the difference
between an app that's a positive investment for your business, drawing
in and retaining customers, or a flop that you'll write off when it
becomes too much of a pain to maintain.

## Want to avoid more mistakes in iOS development? The BrightDigit newsletter gives you regular helpful tips and advice right to your inbox!

A couple of times a month, I publish a newsletter, with news, updates,
and other content related to Apple and iOS. I try to help people better
understand how to succeed with iOS apps, and keep you informed about
what's coming up on the horizon for the industry.

If that's something you want more of, [click here to
subscribe](https://brightdigit.com/subscribe/), and enjoy!