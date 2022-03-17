---
title: Combine & CoreLocation, Part 3 - Integrations with flatMap
date: 2020-09-01 03:38
description: Most of the older APIs from Apple use the Delegation Pattern. The challenge
  is adapting this pattern for SwiftUI through Combine.
tags: combine, functional programming, GCD
featuredImage: /media/wp-images/learningswift/2020/08/combine-harvester-merge.png
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
```
class CoreLocationObject: ObservableObject {
  @Published var location: CLLocation?
  ...
}

protocol CLLocationManagerCombineDelegate: CLLocationManagerDelegate {
  func locationPublisher() -> AnyPublisher<[CLLocation], Never>
  ...
}
```

While our locationPublisher returns a `[CLLocation]` result, our
location property is `CLLocation?`.

That is to say we are going to need to do some functional programming to
transform the result of our publisher:

1.  Turn the Array itself into a Sequential Publisher of each value
2.  Use `flatMap` to return a new Publisher
3.  Cast the CLLocation into the matching `CLLocation?` (i.e.
`Optional<CLLocation>`)

Here is our result:
```
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
```

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
```
  let url = URL(string: "https://baconipsum.com/api/?type=all-meat&sentences=1&format=json")!
   
  let urlPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .decode(type: [String].self, decoder: JSONDecoder())
    .replaceError(with: [String]())
    .compactMap{ $0.first }
```

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
```
let timerInterval:TimeInterval = 1.0
let timerPublisher = Timer.publish(every: timerInterval, on: .current, in: .default)
      .autoconnect()
```

In this instance, we are creating a Timer publisher on the current
RunLoop using the default mode for every 1 second. Lastly is
`autoconnect` which ensure the publisher connects when subscribed.

Now we can use flatMap to initiate a new dataTaskPublisher each second:
```
timerPublisher.flatMap {_ in urlPublisher }
      .receive(on: DispatchQueue.main)
      .assign(to: &$publishedStringProperty)
```

With this we can automate the assignment of the String value, as each
dataTask is completed. In other words, our string property will update
every second as the url is called.

Let’s again take a look at our code for updating CLLocation:
```
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
```

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
```
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
```

This same pattern can be used with other Delegation APIs such as:

-   CoreBluetooth
-   UINotificationCenter
-   AVFoundation etc...

## Other Resources

If you are interested in catching this in video format, be sure to check
out my presentation from 360iDev 2020:

> youtube https://www.youtube.com/watch?v=zkFxOlmLWoA

Combine-ing the Old with the New from 360iDev

If you are interested in learning more about Combine, I highly recommend
checking out:

-   [Using Combine by Joseph
Heck](https://heckj.github.io/swiftui-notes/)
-   [Donny Wals](https://www.donnywals.com) and [His Book *Practical
Combine*](https://practicalcombine.com)

Donny also appeared on my podcast EmpowerApps.Show:



For code samples, check out my repositories here:

-   <https://github.com/leogdion/PublisherSample.playground>
-   <https://github.com/brightdigit/CombineAPIHarvesterApp>

If you have any questions or comments on this series, reach out to me on
Twitter [@leogdion](http://twitter.com/leogdion). If you are interested
in learning more about Combine, drop me your email and I'll let you know
when the next Combine or Swift article is out.