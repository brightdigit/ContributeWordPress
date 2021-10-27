---
title: Combine & CoreLocation, Part 3 - Integrations with flatMap
date: 2020-09-01 03:38
description: Most of the older APIs from Apple use the Delegation Pattern. The challenge
  is adapting this pattern for SwiftUI through Combine.
tags: combine, functional programming, GCD
featuredImage: /media/images/learningswift/2020/08/combine-harvester-merge.png
---
In our [previous
post](https://learningswift.brightdigit.com/combine-corelocation-receiving-handling-events/),
I explained how to hook up our new CLManagerDelegate publishers for
CLAuthorizationStatus to the ObservableObject using Combine. In this
post, we be transforming the CLLocation publisher data into something
useful using flatMap and the built-in publisher, Sequence.

-   [Creating Publishers from
    Delegates](https://learningswift.brightdigit.com/combine-corelocation-publishers-delegates/)
-   [Using Function Reactive Programming to Transform
    Values](https://learningswift.brightdigit.com/combine-corelocation-receiving-handling-events/)
-   **Understanding FlatMap and Built-In Publishers**

## Using Combine for Complex Transformations

While we can simply assign the value from the authorizationPublisher to
our authorizationStatus property, locationPublisher requires more work.

    class CoreLocationObject: ObservableObject {
      @Published var location: CLLocation?
      ...
    }

    protocol CLLocationManagerCombineDelegate: CLLocationManagerDelegate {
      func locationPublisher() -> AnyPublisher<[CLLocation], Never>
      ...
    }

While our locationPublisher returns a `[CLLocation]` result, our
location property is `CLLocation?`.

That is to say we are going to need to do some functional programming to
transform the result of our publisher:

1.  Turn the Array itself into a Sequential Publisher of each value
2.  Use `flatMap` to return a new Publisher
3.  Cast the CLLocation into the matching `CLLocation?` (i.e.
    `Optional<CLLocation>`)

Here is our result:

          locationPublisher
            // convert the array of CLLocation into a Publisher itself
            .flatMap(Publishers.Sequence.init(sequence:))
            // in order to match the property map to Optional
            .map { $0 as CLLocation? }
            // since this is used in the UI,
            //  it needs to be on the main DispatchQueue
            .receive(on: DispatchQueue.main)
            // store the value in the location property
            .assign(to: &$location)

Let’s break each of these steps down starting with
`Publishers.Sequence`.

### Built-In Publishers from Combine

Combine comes with several built-in Publishers we can use.

-   `Just` - single value
-   `Future` - handling asynchronous callbacks
-   `Sequence` - publishing individual values from a sequence in order

We already talked about `Just` which takes in a single value. Another
popular built-in publisher to use with asynchronous calls is `Future`
which takes in a result type for when a call is completed. In this case,
we are using `Sequence` which transforms a sequence type object into a
Publisher stream of sequential values. Therefore when
CLLocationManagerDelegate receives multiple locations, the publisher
acts as if each location from that array received in order.

However, as `Just` is a Publisher so is `Sequence`, therefore we can not
use `.map` but `.flatMap` since we want the values from the Publisher
not the publisher itself. `flatMap` is especially powerful in Combine
since it allows us to integrate Publishers from multiple technologies.

### Integrations in Combine

[I’ve talked previously about what `flatMap` does in the functional
sense whether that be Arrays or
Optionals.](https://learningswift.brightdigit.com/flatmap-double-optionals-functional-programming/)
The same goes for Publishers as well.

Here’s an example of a piece of code to download json from **[the Bacon
Ipsum JSON API](https://baconipsum.com/json-api/)**:

      let url = URL(string: "https://baconipsum.com/api/?type=all-meat&sentences=1&format=json")!
       
      let urlPublisher = URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: [String].self, decoder: JSONDecoder())
        .replaceError(with: [String]())
        .compactMap{ $0.first }

This uses the dataTaskPublisher available on URLSession and transforms
it to a single String. Here is step-by-step how:

1.  Create DataTaskPublisher from URL
2.  Use the `map` function to get the `data` property from the tuple
3.  Decode the JSON into an Array of Strings
4.  In order to assign the value, we change the Failure type to Never.
    In this case, we are replacing each Error instance with an empty
    Array of Strings.
5.  Lastly, we use compactMap to get the first string and therefore
    ignore all empty Arrays.

Depending on your app and the data you are looking for, you’ll want
change the transformations and error handle but typically this is the
basics for handling a data task in Combine.

### Combine System Publishers with `flatMap`

Along with URLSession.dataTaskPublisher there are other System
publishers available to use:

-   `URLSession.dataTaskPublisher`
-   `NotificationCenter.publisher`
-   Key Value Observation via `NSObject.publisher`
-   `Timer.publisher`

With this in mind, let’s use the Timer publisher and use flatMap to
update our String from the Bacon Ipsum JSON API at a regular interval.
Firstly, let’s create a Timer publisher:

    let timerInterval:TimeInterval = 1.0
    let timerPublisher = Timer.publish(every: timerInterval, on: .current, in: .default)
          .autoconnect()

In this instance, we are creating a Timer publisher on the current
RunLoop using the default mode for every 1 second. Lastly is
`autoconnect` which ensure the publisher connects when subscribed.

Now we can use flatMap to initiate a new dataTaskPublisher each second:

    timerPublisher.flatMap {_ in urlPublisher }
          .receive(on: DispatchQueue.main)
          .assign(to: &$publishedStringProperty)

With this we can automate the assignment of the String value, as each
dataTask is completed. In other words, our string property will update
every second as the url is called.

Let’s again take a look at our code for updating CLLocation:

          locationPublisher
            // convert the array of CLLocation into a Publisher itself
            .flatMap(Publishers.Sequence.init(sequence:))
            // in order to match the property map to Optional
            .map { $0 as CLLocation? }
            // since this is used in the UI,
            //  it needs to be on the main DispatchQueue
            .receive(on: DispatchQueue.main)
            // store the value in the location property
            .assign(to: &$location)

By using Sequence to create a Publisher and flatMap to flatten and
return the values from the Sequence Publisher, we have transformed the
value from `[CLLocation]` to `CLLocation` without losing any data.

However the `location` property type and the Publisher result type must
match. Therefore since our property takes into not having `CLLocation`
as a possibility, we need to transform the `CLLocation` to an
`Optional<CLLocation>` (i.e. `CLLocation?`).

## Combine with other Delegates

While I've demonstrated how to use CoreLocation with Combine, this can
be useful for other uses of Delegation APIs.

Recently, I've used these *Publicists* in my app,
[Heartwitch](https://heartwitch.app), which is an Apple Watch app for
broadcasting your heart rate to a live stream, as you are playing games
or doing presentations. Likewise with HealthKit workouts, I've used the
same pattern of creating publishers.

    ...   
        public let coalesce: CoalescePublicist
        public let failurePublisist: FailurePublicist
        public let fullIdentifier: FullIdentifierPublicist
        public let metadata: MetadataPublicist
        public let optional: OptionalPublicist
        public let transition: TransitionPublicist
        public let workoutCreation: WorkoutCreationPublicist
        public let workoutDataUpdate: WorkoutDataUpdatePublicist
        public let workoutStart: WorkoutStartPublicist
    ...

This same pattern can be used with other Delegation APIs such as:

-   CoreBluetooth
-   UINotificationCenter
-   AVFoundation etc...

## Other Resources

If you are interested in catching this in video format, be sure to check
out my presentation from 360iDev 2020:

https://www.youtube.com/watch?v=zkFxOlmLWoA

Combine-ing the Old with the New from 360iDev

If you are interested in learning more about Combine, I highly recommend
checking out:

-   [Using Combine by Joseph
    Heck](https://heckj.github.io/swiftui-notes/)
-   [Donny Wals](https://www.donnywals.com) and [His Book *Practical
    Combine*](https://practicalcombine.com)

Donny also appeared on my podcast EmpowerApps.Show:

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

For code samples, check out my repositories here:

-   <https://github.com/leogdion/PublisherSample.playground>
-   <https://github.com/brightdigit/CombineAPIHarvesterApp>

If you have any questions or comments on this series, reach out to me on
Twitter [@leogdion](http://twitter.com/leogdion). If you are interested
in learning more about Combine, drop me your email and I'll let you know
when the next Combine or Swift article is out.