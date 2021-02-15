---
date: 2020-02-04 10:00
tags: apple-development, swift, swiftui, UI
---
# SwiftUI: Everything is possible if you think like Apple


SwiftUI is Apple’s new framework for building user interfaces (UI). It promises simplicity and consistency that's been difficult to find before now. I’ve been using it for several months now, and want to explain how businesses with an app, or want one in 2020, can benefit. 



I’ll be covering:


-   What makes SwiftUI different.
-   When you should use it.
-   When you shouldn't.

## What makes SwiftUI different?


Before now, building a UI for an application for an Apple operating system (OS) has been a bit complicated. You often have to use various tools and frameworks. Most likely Interface Builder (for apps on iOS and MacOS) as well as UIKit (for iOS and tvOS), to build the interface you want. While these are not bad tools, they do have issues and limitations. Apple has clearly developed SwiftUI to overcome or do away these challenges altogether. 


### No more need for Storyboards or Imperative Programming


Interface Builder is well-known for using storyboards: visual representations of the UI.  Unfortunately, storyboards don’t always accurately show what the code is doing. Storyboards do not structure information so it can be mastered or edited in one place. As a result, there is potential for misunderstanding because there’s no Single Source of Truth, a practice developers use to prevent confusion. Typically, the storyboard might not show what’s wrong if it’s not aligned with the code. For this reason, bug fixing becomes especially difficult








Interested in learning more about App Architecture on iOS? Check out Episode 14 with with René Cacheaux and Josh Berlin




This worked fine in the early years of Interface Builder and UIKit, but the UIs of our apps have now become more complex. This is a problem because UIKit relies on a style of programming called imperative programming. In this style, the code describes exactly how the app must achieve a specific result.



With SwiftUI, we do away with storyboards altogether. Rather than using imperative programming, SwiftUI uses a different style: declarative programming. Declarative programming expresses what the result the software must achieve, but doesn’t describe how this must be done. 



As a result, SwiftUI minimizes unintended results. Additionally, the code is more flexible because it's not limited to a specific procedure.


### SwiftUI Works for all Apple Platforms


Tools for building Apple apps have often been limited to some, but not all, Apple platforms. Previously, it has been common to use a different Application Programming Interface (API) for each device. However, with SwiftUI, everything is in Swift and shared across all devices. As a result, it is possible to create an interface with a single API that works on all Apple platforms, from the Mac to the Apple Watch.



SwiftUI has a big advantage over other frameworks because you can build a complete UI with just SwiftUI using only one programming language. This is possible because SwiftUI works in Apple’s latest development environment, XCode 11.








How does Functional Reactive Programming work? Check out Episode 19 with Jason Anderson



## What SwiftUI is good for?


As a result of the above, there are some clearly good uses for SwiftUI:


### Apps with simple or cross-platform interfaces


As part Xcode 11, you can use a lot of design tools with SwiftUI, including being able to drag-and-drop visual elements. If you need a simple UI and don’t need custom functions, SwiftUI will probably work perfectly for you.



SwiftUI is really great for the Apple Watch, which is coming into its own now. Since the Watch requires a simple UI, SwiftUI is an excellent choice because it will not only work natively but will work with any other Apple OS too.


### New Apps


If you’re going to build an app on for any Apple platform, you might as well start using SwiftUI. You will have all the functionality that Apple is able to provide within a single framework. This also goes for anyone with an app who wants to migrate it to other Apple systems.


### For Tech-Savvy Users Using the Latest Apple Products


SwiftUI is a good choice for apps designed for tech-savvy users who are using the latest Apple OS's, like iOS 13. The reason is Apple has developed SwiftUI to take advantage of the latest functionality. This includes things like Apple’s improvements to UI design, UI transitions, animations, and how Dark Mode works.


## When is SwiftUI not a good choice?


That all said, SwiftUI is not always the right choice. There are a few instances where you’re either going to need something else, or you’re not going to see the benefits:


### Older Apps


If you’re using an app that’s more than a few years old and still supports older Apple OS's,  you’re not likely to see any real benefit. There’s nothing your users will really see or appreciate. You’re probably better off sticking with UIKit or whatever framework you’re using.



It’s worth mentioning a downside of using SwiftUI right now: there’s very little documentation. Because it's still so new, we’re still spending a lot of time figuring out how everything works and how to use it. For now, this means there is significant learning time if you want to develop with it. For an older app, you’re not likely to see a great return on investment.


### Users using Older Operating Systems or Devices


Related to the above, one of the limitations of SwiftUI is it will only work with the latest Apple operating systems. It has no legacy compatibility. If you have users with older Apple products or who take a long time to update things, they are either going to struggle or simply not be able to use your new UI.


### Apps that need to be Android-compatible


Finally, SwiftUI isn't going to help with apps that need to work on non-Apple systems. Swift is only used by Apple and SwiftUI only works in Swift. Therefore, you’ll need a different framework if you want your app to work on Android, Windows, or a website.



I generally recommend not building these kinds of apps anyway, as they rarely deliver the experience that a native app can. I’ve talked about this on my podcast and my blog if you’re interested in learning more.


## 2020 is going to be an interesting year for Apple apps


SwiftUI is likely going to make building apps for Apple products easier going forward. Especially if you’re comfortable working within the limits of Apple’s new framework. I think the people at Apple were thoughtful with this new framework and it will help create better interfaces for users.



If you're interested in learning more about SwiftUI, check out my Swift developer blog as well as:


-   Apple's SwiftUI Tutorials
-   Should you write your app in SwiftUI by Nick O'Neill
-   You can use SwiftUI today By Gui Rambo
-   Using Combine by Joseph Heck
-   100 Days of SwiftUI by Paul Hudson
-   Gosh Darn SwiftUI by Sarun Wongpatcharapakorn
-   Understanding Combine’s publishers and subscribers By Donny Wals
-   Combine and SwiftUI views by Majid Jabrayilov


If you’re interested in keeping up to date with what’s new for iOS and Apple development, I invite you to sign up for my newsletter. I will let you know when I put out new content and if there are important things you should know when it comes to creating or updating your apps.