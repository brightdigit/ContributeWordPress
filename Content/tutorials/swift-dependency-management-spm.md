---
title: Swift Packages - Dependency Management of the Future
date: 2021-05-03 06:46
description: Package Management has been around for decades. However since the introduction
  of Swift, the Apple team has given us a new package manager.
tags: swift-package-manager
featuredImage: /media/wp-images/learningswift/2021/04/029-delivery-17051.png
---
Package Management has been around for decades. There’s everything from
APT to Maven to chocolatey. For those who work in the Apple space we are
probably more familiar with Cocoapods and Homebrew. However since the
introduction of Swift, the Apple team has given us a new package
manager: **Swift Package Manager**.

In this article, I'll cover:

-   what iOS and other Swift developers can use
-   the advantages of SPM (Swift Package Manager) from its predecessors

First, let's get into **why you'd want to use any package manager in the
first place**.

<figure>
<img src="/media/wp-images/learningswift/2021/04/030-puzzle-17054.png" class="wp-image-1146" />
</figure>

<figure>
<img src="/media/wp-images/learningswift/2021/04/029-delivery-17051.png" class="wp-image-1145" />
</figure>

## Modularity and Reuse - Benefits of Package Management

**One key component of package management is the ability to share code
or an executable** - whether that's publicly or just within your
internal dev team.

Part of doing that is breaking your code into separate pieces. This is
where package managers encourage **modularization**. In other words
components can be separated out, tested properly, and used by others.



Once you’ve separated that piece of functionality, you can include
support across a variety of devices and operating systems. **In the
Apple ecosystem, this could mean supporting not only the iPhones but
anything from Linux servers to the Apple Watch.**

Another nice feature of package management is that you can lock onto
specific versions. Usually you can specify a
*[semver](https://semver.org)* compatible version number related to a
version tag or even a branch name. Let's get into the different package
managers for developers in the Apple ecosystem.

<figure>
<img src="/media/wp-images/learningswift/2021/04/colored-14344.png" class="wp-image-1148" />
</figure>

<figure>
<img src="/media/wp-images/learningswift/2021/04/pasted-image-small-14348.png" class="wp-image-1149" />
</figure>

## What Came Before... and is Still Around

Swift Package Manager is fairly a new addition for Swift developers let
alone iOS and macOS developers. Let's talk about what what has come
before for developers.

**Carthage** has been around since the advent of Swift. Carthage really
specializes in building the binary frameworks and sharing those within
your project. Before Carthage, there was **CocoaPods** which has been
around since the early days of Objective-C.

One drawback is that Cocoapods is built in Ruby and is therefore
dependent on having the correct versions of Ruby installed while
Carthage is built in Swift. Another drawback for Cocoapods is that **it
requires modification of your Xcode projects and workspaces**. Carthage
gets around this by having the user **add the built frameworks the
manually the first time they integrate it.** If you are interested in
some of the choices where Carthage differs from Cocoapods, check out
[this piece the Carthage
README.](https://github.com/Carthage/Carthage#differences-between-carthage-and-cocoapods)

Lastly, if neither works for your project, there's **[git
submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)**. Git
Submodules are the most difficult to deal with, but perhaps the most
versatile. They simply require an available git repo to link to a
subdirectory. If you plan editing your dependency, git submodules may be
required.

**If you are going to use a package manager, choose one at best and
stick with it.** However your best bet is migrating to Swift Package
Manager.

<figure>
<img src="/media/wp-images/learningswift/2021/04/Xcode_Icon-small-15043.png" class="wp-image-1151" />
</figure>

## Why Swift Package Manager?

Swift Package Manager brings plenty of benefits along with it. Along
with it's versatile handing of versioning, SPM (Swift Package Manager)
is natively supported in Swift. While tools like CocoaPods require Ruby
and other Gem dependencies, there's no need with SPM. SPM simply
requires either Swift or Xcode be installed on your macOS or Linux
machine.

**SPM is also open-source while also being supported by Apple. This
means you get the benefits of seeing how something works and being open
to the community as well as in Apple's best interest to support it.**

Really it comes down to whether your current line of dependencies
support SPM. At this point, the list of Cocoapods and Carthage packages
which also support SPM continues to grow as SPM expands its support for
features like binary packages (i.e. XCFrameworks).

> youtube https://www.youtube.com/watch?v=2ZhvfGvd5Y

Not only does SPM provide benefits in your Xcode projects but also in
the way you modularize and share your code.

## Why Publish with Swift Package Manager?

There are plenty of reasons to break apart your application or even
publish your library or executable via Swift Package Manager. For one
thing, i**t becomes easier to build your application completely in Swift
- from server to device.**

### Full Stack Swift

For instance, you can build your supporting server application in Swift
whether that’s Vapor, Lambda, Smoke, or Hummingbird. By doing that,
**you can share code between client (iOS application) and server.**
Specifically Codable models can be shared on both iOS and the server.
Even if you have an existing server, you can build a mock server in
Swift for testing.
```
// an example of sharing server-side and client-side code via SPM

// HeartwitchKit/WorkoutData.swift
public struct WorkoutData {
  public let heartRate: Double?

  public init(heartRate: Double? = nil) {
    self.heartRate = heartRate
  }

  public func updated(with new: WorkoutData) -> WorkoutData {
    let heartRate = new.heartRate ?? self.heartRate
    return WorkoutData(heartRate: heartRate)
  }
}

extension WorkoutData: Codable {}

// HeartwitchKitServer/WorkoutData
import Vapor
extension WorkoutData: Content {}
```

If you are going the route of building both ends of your application in
Swift, SPM is the only way to go. In fact for parts of your code that
can be abstracted away from the device, SPM has advantages over Xcode
when it comes to testing.

### Testability

The ease of testing through SPM is really nice as well. Especially when
it’s difficult and slow to do in simulator. For instance before Xcode
12.5 supported watchOS testing, it was nearly impossible to run unit
tests for watchOS.

> youtube https://youtu.be/fzLkHAku1mc?t=1723

Interested in learning more about developing a Full Stack Swift
application?  
Check out my talk from iOSDevCampDC2020

However by having most of your Apple Watch application code in a Swift
package, I can easily test code which doesn't require watchOS
specifically. **This circumvents the issue but also makes it easier
without needing an actual device or via simulator.**

In spots where code is only applicable and available on the watch, such
as SwiftUI or HealthKit code I can use a combination of preprocessor
directives to mark availability:
```
// using canImport and os to disable applicable code

#if canImport(HealthKit)
  import HealthKit

  extension HKHealthStore: HealthInterface {
    public func workout(withConfiguration configuration: WorkoutConfiguration) throws -> Workout {
      let hkConfig = HKWorkoutConfiguration()
      hkConfig.activityType = configuration.activityType.healthKitType
      #if os(watchOS)
        return try HealthKitLiveWorkout(fromHealthStore: self, withConfiguration: hkConfig)
      #else
        return try HealthKitWorkout(fromHealthStore: self, withConfiguration: hkConfig)
      #endif
    }
  }
#endif
```

Not only that but as I develop a server-side application I may not want
to run the watchOS application every time to test capabilities on the
server. This is where refactoring into a Swift package is also useful.
By having a library which contains most of my watchOS code, I can
simulate the heart rate in the Apple Watch application by creating a
simple command line application.

### Command Line Tools

**SPM allows me to duplicate the functionality of Heartwitch, my watchOS
app, into a command line tool** which replicates the heart rate sensor
feature. This makes it easier to test the server application without
having to run the Heartwitch app on my Apple Watch or via simulator.

<figure>
<img src="/media/wp-images/learningswift/2021/05/hwmonitor.gif" class="wp-image-1165" width="1732" height="838" alt="Faking a Watch App with a Command Line Tool" /><figcaption aria-hidden="true">Faking a Watch App with a Command Line Tool</figcaption>
</figure>

One of my favorite tools out there is [the Swift Argument Parser by the
Swift team](https://github.com/apple/swift-argument-parser).

**Swift Argument Parser builds on the great ideas from Swift UI (i.e.
Property Wrappers) and Codable and brings that to the command line.**
You can do things like subcommands, helpful feedback, options, and
flags. In my case, I use it to enable faster server-side development.
Specifically I built a command line tool to replicate the heart rate
monitoring feature of the Apple Watch app and feed my server simulated
heart rates.



## Power of SPM

In this article we covered package management and the advantages of SPM
over other managers. Consider using SPM and learning the ins and outs of
integrating Swift Packages into your projects. If you are using
Cocoapods or Carthage, consider migrating your applications over. In the
next article, I'll talk about creating a Swift Package from scratch as
well as the most important part - Package.swift - the Swift Package
Manifest file.
