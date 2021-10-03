---
date: 2020-08-23 20:31
description: In our previous post, we talked about how to build a Publisher Factory.
  Here, we'll talk about how to use the factory for receiving and handling events.
tags: combine, functional programming, GCD
---
[In our previous
post,](https://learningswift.brightdigit.com/combine-corelocation-publishers-delegates/)
we talked about how to build a Publisher Factory or Publicist. In this
post, we\'ll talk about how receiving and handling Events in our
ObservableObject from our new Publicist class.

-   [Creating Publishers from
    Delegates](https://learningswift.brightdigit.com/combine-corelocation-publishers-delegates/)
-   **Using Function Reactive Programming to Transform Values**
-   [Understanding flatMap and Built-In Publishers
    (Part 3)](https://learningswift.brightdigit.com/combine-corelocation-swiftui-delegates/)

## Receiving and Handling Events in our ObservableObject

Our `ObservableObject` needs to accomplish a few things to update our
SwiftUI while listening to our *CoreLocation* publishers. First of all
we need to:

1.  Create the CoreLocation Manager
2.  Create our CoreLocation Publicist
3.  Connect the Publicist as the Delegate of the Manager
4.  Create our Authorization Status and Location Publishers

With this in mind, here is how that looks:

``` {.wp-block-code}
class CoreLocationObject: ObservableObject {
  @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
  @Published var location: CLLocation?

  let manager: CLLocationManager
  let publicist: CLLocationManagerCombineDelegate

  var cancellables = [AnyCancellable]()

  init() {
    let manager = CLLocationManager()
    let publicist = CLLocationManagerPublicist()

    manager.delegate = publicist

    self.manager = manager
    self.publicist = publicist

    let authorizationPublisher = publicist.authorizationPublisher()
    let locationPublisher = publicist.locationPublisher()
  ...
```

Next, we can actually deal with receiving and handling events from our
Publishers. Firstly, let's deal with the `CLAuthorizationStatus`.

## Receiving and Handling Events with Sink and Assign

As far the CLAuthorizationStatus, there are two things we need to do
when the authorization status changes:

-   Trigger Location Update when `CLAuthorizationStatus` is valid
-   Assign the `CLAuthorizationStatus` to our
    `@Published CLAuthorizationStatus` Property `authorizationStatus`

### Using Sink For Calling Methods

Let's first deal with triggering location updates by creating a method
to begin those updates:

``` {.wp-block-code}
class CoreLocationObject: ObservableObject {
  @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
  @Published var location: CLLocation?

  let manager: CLLocationManager

...

  func beginUpdates(_ authorizationStatus: CLAuthorizationStatus) {
    if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
      manager.startUpdatingLocation()
    }
  }
}
```

Our `beginUpdate` method will take in the `CLAuthorizedStatus` as it
comes in from the `Publisher`. As a result, **if the status allows for
location update then it calls `startUpdatingLocation` on the
`CLLocationManager`.**

With this in mind, let's connect the `authorizationPublisher` to the
`beginUpdates` method:

``` {.wp-block-code}
class CoreLocationObject: ObservableObject {

  ...
  var cancellables = [AnyCancellable]()

  init() {
    let publicist = CLLocationManagerPublicist()
   
    ...
    
    let authorizationPublisher = publicist.authorizationPublisher()

    // trigger an update when authorization changes
    authorizationPublisher
      .sink(receiveValue: beginUpdates)
      .store(in: &cancellables)
  ...
```

In this case, we are using `sink` and passing a reference to our new
method. `sink` returns a `Cancellable` which we'll need to make sure is
disposed properly. Therefore, we use `.store` to make sure that
`Cancellable` is stored correctly in our \`cancelables\` `Array`.

Now we should be correctly starting location updates when permission is
granted. Next, let's store the `CLAuthorizationStatus` in our
`@Published` property so we can display it in our SwiftUI view.

### Receiving and Handling Events with Assign (in iOS 13 and iOS 14)

**One of the first things you learn as an iOS developer using UIKit is
the importance of making UI updates on the main dispatch queue.** In
other words, failure to do this results in incorrect UI updates or even
crashing your app. Likewise, in SwiftUI, you need to specify UI updates
on the main dispatch queue. Therefore we can use `receive` to ensure
updates are on the main `DispatchQueue`.

``` {.wp-block-code}
...
      authorizationPublisher
        // since this is used in the UI,
        //  it needs to be on the main DispatchQueue
        .receive(on: DispatchQueue.main)
    ...
```

As far as assigning we have a few options, we can stick with `sink` to
assign our value the published property:

``` {.wp-block-code}
...
      authorizationPublisher
        // since this is used in the UI,
        //  it needs to be on the main DispatchQueue
        .receive(on: DispatchQueue.main)
    .sink(receiveValue: {
          self.authorizationStatus = $0
        })
...
```

However, we could simplify this with `assign`:

``` {.wp-block-code}
...
      authorizationPublisher
        // since this is used in the UI,
        //  it needs to be on the main DispatchQueue
        .receive(on: DispatchQueue.main)
        // store the value in the authorizationStatus property
        .assign(to: &$authorizationStatus)
...
```

[This new assign available in all the new 2020 OSes (iOS 14, macOS 11,
watchOS 7,
etc...)](https://developer.apple.com/documentation/combine/publisher/assign(to:))
allows us to assign the value directly to the publisher using the & (for
an in-out parameter) and \$ (for the publisher).

Additionally no `Cancellable` is returned and therefore not needed to be
stored.

## Sink vs Assign when Receiving and Handling Events

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2020/08/Combine-ing-the-Old-with-the-New.001-1024x204.png){.wp-image-1062}
:::

Choosing the correct method can be difficult but here\'s some
guidelines:

-   If you are doing some additional logic besides just assigning a
    value, use `sink`
-   For just assigning a value, use `assign`
-   When assigning a value which is being used directly by the UI (i.e.
    UIKit View or SwiftUI View), use
    [`.receive(on: DispatchQueue.main)`](https://developer.apple.com/documentation/combine/publisher/receive(on:options:))
-   Make sure when using `sink` or the [2019 version of
    `assign`](https://developer.apple.com/documentation/combine/publisher/assign(to:on:))
    (i.e. `assign(to:on:)`), save the resulting `Cancellable` by [using
    `.store`](https://developer.apple.com/documentation/combine/anycancellable/store(in:)-6cr9i)
-   When there\'s more than one `AnyCancellable` property, consider
    using a [`Set` or `Array` for storing the
    `Cancellables`](https://developer.apple.com/documentation/combine/anycancellable/store(in:)-3hyxs)

In the next blog post, I\'ll cover some more advance functional
programming techniques in Combine when we transform our `CLLocation` to
something more useful.