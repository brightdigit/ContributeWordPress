---
date: 2021-05-04 10:12
featuredImage: /media/images/brightdigit/2021/05/copyright.png
description: Building an iOS app is a complex process. One of the last things you
  have to do is pass an App Store Review. Here are 4 tips for success.
---
Building and publishing an app is a complex process. One of the last
things you have to do before your app can go live on the App Store is
passing Apple's App Store Review.

**The challenge is that Apple isn't always completely clear** about the
Review process. You would think Apple would want greater clarity on its
Store, but given the complexity of all the different kinds of apps in
the Store, it's impossible to not have exceptions or at least grey areas
where it's not clear which rules might apply.

**Here are four tips to help you avoid some of the trickiest things that
might come up in a Store Review.**

::: {.wp-block-image}
![An Example of In-App
Purchases](https://brightdigit.com/wp-content/uploads/2021/05/Screen-Shot-2021-05-01-at-10.22.45-AM-1024x277.png){.wp-image-2306}
:::

## Set Up Your In-App Purchases

It shouldn't come as any surprise, but Apple is quite particular about
the use of In-App Purchases. They are, after all, how Apple makes money.

For your first-ever Store Review, your In-App Purchases must be complete
and integrated into the app. **Not having them complete, up-to-date, and
clear about what the customer is paying for is essentially going to
guarantee your app will be rejected or declared incomplete.**

What usually trips up a lot of developers is that the Store Review is
not just a quality check on your app's functionality and usability -- it
is also an assessment of the validity of your business model. If the
reviewer can't easily discern what your model is, they're not going to
pass you.

You should include an explanation of your In-App Purchases in your App
Review Notes, including any supporting documentation that might be
needed. This includes things like purchase icons, screenshots, and what
will be visible in an app preview.

### If You Want To Use Auto-Renewing Subscriptions...

There isn't a lot that needs to be said about this, only that if your
app offers auto-renewing, in-app subscriptions, Apple requires you to
provide ongoing value to subscribed users.

This means that you need to be regularly delivering new content,
updates, features, or services to these users. Apple is pretty flexible
about what qualifies as *ongoing value*, only that it must be there, and
users should be able to access it without needing to perform additional
tasks (i.e. they don't need to download anything, rate the app, etc.).

::: {.wp-block-image}
![](https://brightdigit.com/wp-content/uploads/2021/05/copyright.png){.wp-image-2307}
:::

## Be Careful About Your Use of Copyrighted Content

**Legal copyright issues are often one of the things that catch out
developers when it comes to content on their apps.** This isn't strictly
a problem with Apple: copyright law has a lot of grey areas, and often
doesn't become clearer until someone gets sued.

Apple's official line is:

> *Don't use protected third-party material such as trademarks,
> copyrighted works, or patented ideas in your app without permission,
> and don't include misleading, false, or copycat representations,
> names, or metadata in your app bundle or developer name.*
>
> [Apple App Store Review Guidelines - 5.2.1 Intellectual
> Property](https://developer.apple.com/app-store/review/guidelines/#intellectual-property)

What commonly happens is an app will get rejected or delayed because it
uses content -- usually videos, pictures, music, or literature -- that
is not owned by the developer. 

Be sure to include, when submitting your app for review, that **you have
documentation that shows that you are either the owner of the content in
your app, or that shows you have permission from the copyright owner to
use their content in your app**. That last little bit might be a little
hazy, as there are a wide array of different copyright permissions you
can be authorized for (and these might change depending on your legal
jurisdiction), so be sure to read the fine print before you submit your
app for review. That said, this is not legal advice, and you should
consult with a lawyer if you have questions or aren't sure about
something.

::: {.wp-block-image}
![New Privacy Controls in iOS
14.5](https://brightdigit.com/wp-content/uploads/2021/05/apple_ios-update_privacy-controls_04262021.jpg){.wp-image-2308}
:::

## Make Sure You're Using the "Right" 3rd-Party Plugins & Libraries

Along with copyrighted material, Apple is also strict about what
libraries and plugins you can use in your app. You are responsible that
everything in your app, including third-party services, complies with
Apple's guidelines.

**This is especially true if you're using analytics libraries.** The
principal reason is their concern for data security and privacy. Apple
[recently updated its guidance regarding data
privacy](https://developer.apple.com/app-store/user-privacy-and-data-use/).
I recommend you give it a read, but some notable highlights include:

-   If your app is collecting any data from your users, you need to
    provide a detailed explanation of what data is being collected and
    how, and all the ways you're going to use that data.
-   If you're collecting data, you must have the consent of the user,
    and there will be no tolerance for coercing consent for unnecessary
    data collection.
-   You may only request data collection if you can show that the data
    is relevant to the core functionality of your app

Something that gets overlooked is that in the case of very popular
third-party services there may be multiple libraries of them, including
many that might use "hacks" to get the data you want.

In many cases, only the use of the service provider-approved version
will pass the Store Review. For example, you might want to use embedded
YouTube videos, for which you might be able to find several libraries
that facilitate them, and while you might find one that perfectly fits
your needs, there is only one approved YouTube library (that is also
assured to comply) that will be allowed to pass the Review.

## Don't Try to Cheat Apple -- There's Probably A Better Way

You might remember the controversy surrounding the Hey app, that made
industry headlines last year trying to get around the normal 30% cut
that Apple takes from In-App purchases. Without going through the entire
story Hey tried to avoid paying Apple by declaring itself a reader app
like Netflix or Spotify (it's an email service), and Apple (eventually)
said no. After that, Basecamp, Hey's developer, added a feature allowing
for free randomized temporary email addresses that you could get through
the app, which appears to have satisfied Apple.

Regardless of the way you stand in the debate, the takeaway is it's a
losing fight to try to cheat Apple (unless you're just looking for
publicity or have a squad of lawyers backing you up). But, **if you're
confronted with a dispute with them, there may well be a creative
solution to your problem.**

::: {.iframe}
::: {#embed-app episodes="[{\"id\":393606,\"title\":\"App Store Review Guidelines with Paweł Madej\",\"episode_type\":\"full\",\"number\":68,\"season\":1,\"formatted_published_at\":\"November 7, 2020\",\"duration\":3022,\"duration_in_minutes\":50,\"duration_in_mmss\":\"50:22\",\"trackable_media_url\":\"https://pdcn.co/e/media.transistor.fm/1decc81f/2b20bb50.mp3\",\"share_url\":\"https://share.transistor.fm/s/1decc81f\",\"transcript_url\":null,\"artwork\":\"https://images.transistor.fm/file/transistor/images/episode/393606/thumb_1604511329-artwork.jpg\",\"author\":\"Leo Dion, Principal CEO and Swift Developer at BrightDigit \",\"formatted_summary\":\"In this episode, Leo chats with Paweł Madej, pharmacist turned iOS developer on his learning experience and what pitfalls devs should know about App Store reviews. We talk about what he learned during the submission process of his app CodeConf, as well as the major App Store stories of the year: Hey, Wordpress, xCloud and of course Fortnite. \",\"embed_html\":\"\\u003ciframe width=\\\"100%\\\" height=\\\"180\\\" frameborder=\\\"no\\\" scrolling=\\\"no\\\" seamless src=\\\"https://share.transistor.fm/e/1decc81f\\\"\\u003e\\u003c/iframe\\u003e\"}]" show="{\"id\":122,\"title\":\"Empower Apps\",\"website\":\"https://www.empowerapps.show\",\"multiple_seasons\":false,\"playlist_limit\":7,\"feed_url\":\"https://feeds.transistor.fm/empowerapps-show\",\"private_feed\":false,\"disable_feed\":false,\"disable_downloads\":false,\"apple_podcasts_url\":\"https://itunes.apple.com/us/podcast/empower-apps/id1437435392?mt=2\",\"spotify\":\"https://open.spotify.com/show/0TGuZyeXPPyxYe1JApM6Z5\",\"overcast\":\"https://overcast.fm/itunes1437435392/empower-apps\",\"stitcher\":\"https://www.stitcher.com/s?fid=240018\\u0026refid=stpr\",\"pocket_casts\":\"https://pca.st/9n7e\",\"castro\":\"https://castro.fm/itunes/1437435392\",\"podcast_addict\":\"https://podcastaddict.com/podcast/2393954\",\"deezer\":\"\",\"google_podcasts\":\"https://www.google.com/podcasts?feed=aHR0cHM6Ly9mZWVkcy50cmFuc2lzdG9yLmZtL2VtcG93ZXJhcHBzLXNob3c%3D\",\"radioPublic\":\"https://radiopublic.com/empower-apps-WezKN2\",\"breaker\":\"https://www.breaker.audio/empower-apps\",\"tuneIn\":\"http://tun.in/pjaZJ\",\"castbox\":\"https://castbox.fm/ch/1453575\",\"pandora\":\"https://www.pandora.com/podcast/empower-apps/PC:21228\",\"iHeartRadio\":\"https://iheart.com/podcast/78369923/\",\"soundcloud\":\"\",\"amazon_music\":\"https://music.amazon.com/podcasts/0e053161-686d-47e6-91a1-31d55b121423/Empower-Apps\",\"player_FM\":\"https://player.fm/series/empower-apps\"}"}
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

*In this episode, Leo chats with Paweł Madej, pharmacist turned iOS
developer on his learning experience and what pitfalls devs should know
about App Store reviews. We talk about what he learned during the
submission process of his app CodeConf, as well as the major App Store
stories of the year: Hey, Wordpress, xCloud and of course Fortnite.*

## What are your experiences with App Store Reviews?

So there you have it, five things that you should know before submitting
your app for an App Store Review. Do you have any uncommon or
little-known challenges you've had trying to get your app through the
Store Review? I'd love to hear your stories \-- feel free to email them,
or reach out to [me on social media.](https://twitter.com/brightdigit)

## Was this useful? Sign up today for the BrightDigit newsletter for more helpful tips!

I put out a newsletter twice a month, where I write about Apple, iOS and
iOS-related content and news. I aim to make sure you know what's going
on in the rapidly changing world of Apple. If you want to join them,
click [here to subscribe,](https://brightdigit.com/subscribe/) and
enjoy!
