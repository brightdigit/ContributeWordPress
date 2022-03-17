---
title: 'Upgrading Old Apps: The Dirty Job of iOS Development'
date: 2021-03-26 06:27
description: This is an introductory guide to upgrading old iOS apps, including where
  to start, what refactoring strategy to use, and other useful tips.
featuredImage: /media/wp-images/brightdigit/2021/03/tim-gouw-1K9T5YiZ2WU-unsplash.jpg
---
Upgrading an iOS app can be time-consuming. It involves the process of
refactoring, rewriting, and replacing some or all of the app’s code.

This can introduce risk and uncertainty. However, **it’s an opportunity
to ensure your users are getting the best experience** possible from
your app. Over a long enough time, every app needs to be upgraded,
whether to support the newer versions of iOS or take advantage of the
latest features., Unfortunately, because the process is so often
difficult, headache-inducing, and complicated, it is rarely looked
forward to, and often avoided. 

It is true that app upgrades aren’t easy. But they don't need to be
painful if you plan ahead and make some key decisions of how to approach
the process.

> transistor https://share.transistor.fm/s/de8caf60

To help people who maintain iOS apps, particularly product managers,
I’ve put together this small introductory guide to this dirty job of iOS
development.

This will cover the factors you’ll want to weigh when deciding:

-   **Whether to upgrade** your app or build a new one
-   **Where to start** the upgrade process 
-   What **refactoring strategy** to use
-   …as well as other useful tips to keep in mind

## Should you upgrade your iOS app?

The most common benefit of refactoring code, as opposed to tossing it
all out, is cost. **Unless your app is ancient, so badly written the
code makes your eyes bleed, or your business needs for the app have
fundamentally changed, it’s likely going to be more cost-effective to
refactor than to start from scratch.**

<figure>
<img src="/media/wp-images/brightdigit/2021/03/tim-gouw-1K9T5YiZ2WU-unsplash-1024x685.jpg" class="wp-image-2280" width="512" height="343" alt="Not everybody wants to do but sometimes you need to." /><figcaption aria-hidden="true">Not everybody wants to do but sometimes you need to.</figcaption>
</figure>

On the other hand, the one significant downside to refactoring is how
time-intensive it can be. If the old code was well-written,
appropriately documented, and has a minimal number of pre-existing bugs,
there’s a risk rewriting it will introduce new bugs. Therefore
refactoring would be a better option - at least for now.  

## Start with Unit Tests

So you’re committed to upgrading your old iOS app, where do you start?

To make it as easy as possible to maintain and avoid a massive headache
for yourself later on, **you’re going to want to start by writing the
unit tests you need.**

This is the core principle of [Test-Driven Development
(TDD)](https://brightdigit.com/blog/2020/01/06/avoid-ios-app-failure-with-tdd/).
The idea is, by writing tests first, you create a strong foundation for
the code that you can build on as you progress. Here are the basics for
unit testing, in case you are unsure:

-   You **write a unit test** describing one piece of functionality of
    the app
-   You will **run the test**, which should fail because the refactored
    code to make it work hasn’t been written yet.
-   You **write and refactor** the least amount of code possible to pass
    the unit test
-   **Repeat** until you have enough test coverage for what you need

The biggest benefits of this approach:

-   Practically guarantees **you’re always working in the right
    direction** when refactoring code
-   **Reduces the possibility of there being any bugs** or errors in the
    refactored app
-   Over the long term, it can drastically **reduce the amount of time
    and effort** needed as the project progresses
-   This approach also encourages developers to have **healthy,
    effective habits of building good software** architecture.

> transisitor https://share.transistor.fm/s/eddb8632

## Refactoring Strategies for Upgrading iOS Apps

Broadly speaking, there are two effective strategies for refactoring
code as part of an upgrade: 

The first strategy is to incrementally write and implement new code
alongside old code, effectively working side-by-side until the new code
is developed enough to manage all the functionality the old code did.
For example, when refactoring an app originally built using UIKit to use
SwiftUI, you can use
[UIViewRepresentable](https://developer.apple.com/documentation/swiftui/uiviewrepresentable)
and
[UIViewControllerRepresentable](https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable)
or
[UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller)
to interface between new and old code.

-   For using a **SwiftUI View inside a UIKit View** use:
    -   ***UIHostingController***
-   For using a **UIView from UIKit inside a SwiftUI View** use:
    -   ***UIViewRepresentable***
-   For using a **UIViewController from UIKit inside a SwiftUI View**
    use
    -   ***UIViewControllerRepresentable***

If you are upgrading an older app written in Objective-C – that you are
upgrading to use code written in Swift – you can use [Swift
bridging](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift),
which will keep the Objective-C code working as you implement the new
code structure necessary for Swift. If you still need to write
Objective-C to bridge that gap, **I'd recommend [our article on writing
Swift-friendly Objective-C
code.](https://learningswift.brightdigit.com/objective-c-and-swift-being-friendly/)**
If your app falls into this category, this is something you probably
should be considering, as Apple has made it pretty clear that it
everything new [in its software ecosystem will be exclusively
Swift.](https://brightdigit.com/blog/2020/02/04/swiftui-everything-is-possible-if-you-think-like-apple/)

The second strategy uses failure as an active tool to both discover and
implement new code.  Rather than trying to sustain the old code while
creating the new, you start by aiming to have the new code immediately
replace the old as the project progresses

This should result in code regularly failing to compile. However, by
actively failing, you are able to rapidly discover what is and is not
working, and focus on writing code for what is broken.

### Which strategy should you use?

Now, you might ask yourself, which technique should I use? The simple
answer, as is often the case with software, is *it depends*. Both are
perfectly valid, at depending on the nature of the code, there may come
a point where you end up using both.

**The side-by-side bridging strategy has the advantage of being able to
seamlessly integrate new code** with the old over time on a live app.
The reason being that your users might not even notice a difference in
functionality. The result is a stable, consistent process that allows
you to control when big changes are needed

On the other hand, **the break and replace strategy will quickly reveal
the most important parts** of the code you need to refactor, getting
right down to the root of any dirty code or *code smells* that might
exist.

However, if your app has a lot of complicated code, you might find a
break and replace strategy is even more time-consuming. It will
potentially force you to pull out very large sections of code that will
need to be entirely rebuilt before they can be deployed. That said, if
your developers retain a history of the code, this could be done
relatively quickly. Having been working with the code for a long time,
they can then be very focused on what they are looking for and what will
need to be refactored. 

## More Tips For Upgrading Your App

**Have rules, be consistent with them**

Having rules when coding is important – this goes doubly when
refactoring. If you’re going to have a lot of people working on your
code, make sure everyone has a shared understanding of how things are to
be done, recorded, and tracked throughout the project.

As an example, I like to ask other developers whether they use tabs vs.
spaces in their code. Every developer of any significant experience will
prefer one or the other. It’s a small, but important rule that you want
to make sure all the developers working on your app are aligned with, as
it can affect [the code quality of the app’s software architecture
overall](https://brightdigit.com/blog/2020/03/31/ios-software-architecture/).
Other things you’ll want to establish rules for include how new code is
integrated into the app, for which [I recommend using continuous
integration
techniques.](https://brightdigit.com/blog/2020/03/02/ios-continuous-integration-avoid-merge-hell/)

**Have a Clear, Consistent System for Bug Tracking**

Like any good software project, but particularly important when
upgrading an iOS app is having a clear process for bug tracking. I’ve
previously [written about tracking bugs and error handling in Swift
here](https://brightdigit.com/blog/2020/12/08/swift-error-handling/).
There are many tools and services available, including a few online
services that are great for tracking bugs and log statements, such as:

-   [Bugsnag](https://www.bugsnag.com)
-   [Firebase
    Crashlytics](https://firebase.google.com/products/crashlytics)
-   [Instabug](https://instabug.com)

As a small side note: there is a good case to be made, for apps running
on iOS 14 and later, to make use of OSLog. [If you’re not familiar, it’s
a handy library for logging messages to the
console.](https://www.avanderlee.com/workflow/oslog-unified-logging/)
It’s particularly useful for being able to filter out categories of app
logs within the console app when compiling code as well. 

**Avoid 3rd Party Dependencies**

While bug trackers can be a valid 3rd party dependency, there are many
which you should avoid if you can. Every time you use a new dependency
in your app, you’re exposing it to the risk of bugs or outright failure
if the 3rd party ever decides to shut down or has not been properly
upgraded and maintained themselves.

> youtube https://www.youtube.com/watch?v=BXePggcWpuE

If you are going to use a 3rd-party library or tool, make sure you spend
time weighing the costs to your app should it fail against the benefits
it gives.  



In this second part of our interview with Antoine van der Lee, we talk
about how to upgrade older apps piecemeal, supporting older OSes, as
well as bug tracking and logging.

## Upgrading can be a great way to give an old app a new life

Upgrading an older app through refactoring and rewriting code can be a
cost-effective way of ensuring continued, stable performance and for
your users. Like restoring anything though, it’s important to be
patient, as you’re likely to encounter obstacles that are difficult to
anticipate.

Begin by deciding how much value the app offers and how much time you
have to undertake the upgrade. If you’re sure this is right for your
app, begin with a test-driven development strategy that ensures your
progress will be consistent, and easy to maintain after the upgrade is
complete. 

Decide whether slow bridging refactor or a break and replace strategy is
most appropriate for you. You can figure this out by considering:

-   what is needed from the app
-   how much time you have available
-   how complicated your app is
-   and most importantly, how much knowledge your development team has
    of the history of the code

Finally, make sure to always have clear, consistent rules for coding and
refactoring, especially for complex apps and where you have many people
working on the app. Be sure to have a reliable way to log and track
bugs, and, within reason, avoid relying on 3rd party dependencies.

## Tell me more about your iOS app

Do you have an iOS app that you are upgrading, or planning to upgrade?
Do you want to learn more about the process? I’d like to know and answer
any questions you might have. **I offer some free consulting time each
month for companies that are serious about moving their iOS app projects
forward and are looking for help or guidance.** To book a free
consultation call with me, [go here and book an
appointment](https://zcal.co/leogdion/consultation). I look forward
to hearing from you and learning more about your app!