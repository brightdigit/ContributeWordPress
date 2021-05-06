---
date: 2020-05-22 00:07
---
In this episode, [Leo talks with Kristaps
Grinbergs](https://share.transistor.fm/s/fca974ca) about alternative
backends like GraphQL and WebSockets as well as their upcoming talks at
[UIKonf](https://uikonf.com).

::: {.iframe}
::: {#embed-app episodes="[{\"id\":251311,\"title\":\"Alternative Backends with Kristaps Grinbergs\",\"episode_type\":\"full\",\"number\":48,\"season\":1,\"formatted_published_at\":\"May 8, 2020\",\"duration\":2976,\"duration_in_minutes\":50,\"duration_in_mmss\":\"49:36\",\"trackable_media_url\":\"https://pdcn.co/e/media.transistor.fm/fca974ca/efd4ebea.mp3\",\"share_url\":\"https://share.transistor.fm/s/fca974ca\",\"artwork\":\"https://images.transistor.fm/file/transistor/images/episode/251311/medium_1588909876-artwork.jpg\",\"author\":\"Leo Dion, Principal CEO and Swift Developer at BrightDigit \",\"formatted_summary\":\"In this episode, Leo talks with Kristaps Grinbergs about alternative backends like GraphQL and WebSockets as well as their upcoming talks at UIKonf.\",\"embed_html\":\"\\u003ciframe width=\\\"100%\\\" height=\\\"180\\\" frameborder=\\\"no\\\" scrolling=\\\"no\\\" seamless src=\\\"https://share.transistor.fm/e/fca974ca\\\"\\u003e\\u003c/iframe\\u003e\"}]" show="{\"id\":122,\"title\":\"Empower Apps\",\"website\":\"https://www.empowerapps.show\",\"multiple_seasons\":false,\"playlist_limit\":7,\"feed_url\":\"https://feeds.transistor.fm/empowerapps-show\",\"private_feed\":false,\"disable_feed\":false,\"disable_downloads\":false,\"apple_podcasts_url\":\"https://itunes.apple.com/us/podcast/empower-apps/id1437435392?mt=2\",\"spotify\":\"https://open.spotify.com/show/0TGuZyeXPPyxYe1JApM6Z5\",\"overcast\":\"https://overcast.fm/itunes1437435392/empower-apps\",\"stitcher\":\"https://www.stitcher.com/s?fid=240018\\u0026refid=stpr\",\"pocket_casts\":\"https://pca.st/9n7e\",\"castro\":\"https://castro.fm/itunes/1437435392\",\"podcast_addict\":\"https://podcastaddict.com/podcast/2393954\",\"deezer\":\"\",\"google_podcasts\":\"https://www.google.com/podcasts?feed=aHR0cHM6Ly9mZWVkcy50cmFuc2lzdG9yLmZtL2VtcG93ZXJhcHBzLXNob3c%3D\",\"radioPublic\":\"https://radiopublic.com/empower-apps-WezKN2\",\"breaker\":\"https://www.breaker.audio/empower-apps\",\"tuneIn\":\"http://tun.in/pjaZJ\",\"castbox\":\"https://castbox.fm/ch/1453575\",\"pandora\":\"https://www.pandora.com/podcast/empower-apps/PC:21228\",\"iHeartRadio\":\"https://iheart.com/podcast/78369923/\",\"soundcloud\":\"\",\"amazon_music\":\"https://music.amazon.com/podcasts/0e053161-686d-47e6-91a1-31d55b121423/Empower-Apps\",\"player_FM\":\"https://player.fm/series/empower-apps\"}"}
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
By {{ selectedEpisode.author }} • View the Website
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