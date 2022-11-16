---
title: Server-Driven UI with iOS - What You Need to Know
date: 2022-11-08 00:00
description: Learn what Server-Driven UI (SDUI) is, it's advantages for app development, when it's not a good choice, and important things to know to if want to deply to iOS with it. 
featuredImage: /media/articles/server-driven-ui-ios/cloud-computing.webp
subscriptionCTA: We put out the BrightDigit newsletter a couple of times a month to give you helpful tips and advice on app development right to your inbox!
---

Server-Driven UI (SDUI) gives app developers the advantages of speed and flexibility that are difficult or impossible with more conventional ways of managing user interfaces.

SDUI isn't a new idea, but it is uncommon. And some apps definitely benefit from this technique more than others.

We'll be covering:
* what Server-Driven UI is
* its advantages when it comes to multiple platforms
* when it's not a good choice
* critical pieces of advice to remember if you implement it

> youtube https://youtu.be/z5JTfzBX4WM

## What is Server-Driven UI?

The current popular interest in SDUI seems [driven mainly by several so-called "disruptor" apps](https://medium.com/airbnb-engineering/a-deep-dive-into-airbnbs-server-driven-ui-system-842244c5f5). Airbnb, Lyft, Spotify, and DoorDash, to name some of the largest - all use SDUI techniques to varying degrees.

All these apps placed a high priority on consistent user experience across all platforms – if you use Airbnb, you can reasonably expect that it looks and works the same way whether you're on iOS, Android, or the web.

**Server-Driven UI is the [software architecture pattern](https://brightdigit.com/articles/ios-software-architecture/) of integrating the UI components with the data sent to your users' devices.**

This is in contrast to the conventional way of building apps where only the data you want to display through the UI is sent by the API or server and design is setup only in the app's codebase.

**The central idea of SDUI is that your server manages not only your app's data but also all the components, views and layouts you want to display.**


![App Development](/media/articles/server-driven-ui-ios/appdev.webp)



## When is Server-Driven UI a good choice?

Server-Driven UI has a few advantages over more conventional ways of making apps:


### It makes the app "platform agnostic."

Let's say you have an app that you need to work on iOS, Android and in a web browser, you have a problem where each platform has fundamentally different ways of changing and rendering data. As a result, the same UI will work differently across all devices. So you have to develop ways for your app to display data correctly on each platform. 

Traditionally, you might solve this problem by developing separate versions of your app for each platform – a cumbersome and expensive route. Or you might choose to code your app using a cross-platform programming language, such as [Flutter](https://flutter.dev), [Ruby](https://www.ruby-lang.org/en/), or [React Native](https://reactnative.dev). This can work, but it can be extremely challenging to deliver a consistent user experience across platforms because each will need tweaks or exceptions to be usable by each app client.

With SDUI, you overcome this problem by having the server send the data as well as the information about how that needs to be displayed. The app client (iOS, Android or web) can use that in a way that's native to its platform. 

![Cross Platform](/media/articles/server-driven-ui-ios/cross-platform.webp)

### You can deploy changes faster and without relying on the user.

Versioning slows you down. Whenever you want to add or change features to something you have in the App Store, you must go through the time-consuming process of submitting it for App Review and make updates to your product page before deploying.

After having gone through the gauntlet of Apple or Google's App Review, you are at the mercy of the user, whom you must wait for. They will need update your app before you receive any feedback or data. This limits the speed you can iterate, test, and experiment.

SDUI gets around this time-consuming process by keeping UI configuration data on the server (with limitations. We address this further down). You can make changes to the UI without waiting for a version release, and the user gets the update immediately.

This makes SDUI an excellent choice for apps with dynamic interfaces. If your interface needs to be updated quickly, just like Airbnb this becomes a necessity. It also makes a great choice if you want to do lots of A/B testing. All you need to do is change your UI view and URL, and all your apps get the new look and feel you want to test.


### You can build your app almost any way you like

As we've covered previously, [we almost always recommend developing your apps natively for the platform](https://brightdigit.com/articles/native-app-development-advantages/). Cross-platform development is often rife with compatibility issues, code smells that arise from trying to get features to work on platforms they weren't originally designed for, and significant limitations on what you can do while maintaining a consistent user experience across devices.

SDUI might be the one instance where it's possible to have _honest cross-platform development._ If done well, you should be able to update your apps at the same time without needing separate version deployments for iOS, Android, the web, etc.

Instead of being forced to code your app in React Native, Flutter, or another _cross-platform friendly_ language, you can use any server platform you want. You can use Swift, Ruby on Rails, NodeJS or whatever suits your needs and knowledge base best.

## When is Server-Driven UI not a good choice?

There are a few use cases where you'll probably find SDUI is not a good choice, is ineffective or at least unnecessary:


### You're only releasing for a single platform.

If you're only releasing your app for iOS or just Apple platforms, then many of the advantages of SDUI aren't going to matter. While it might still prove helpful for rapid A/B testing of your UI, there are limits to this, and in the long run, it likely won't show an enormous benefit over simply deploying to the App Store.


### Your development teams are significantly siloed

One of the most important things about using SDUI is that, to be effective, [**you need to have all of your development teams working very closely together**](https://brightdigit.com/articles/scale-ios-app/), as changes to the app UI will affect all of them directly at the same time. **It takes time to build the initial framework and sometimes it can get quite complicated.** 

If your already spending the extra time with your server team setting up the SDUI and they have been operating completely apart from teams for iOS, Android, and web development teams, implementing will require all of them to have team meetings together. They will all need to create and agree on one shared template that the server will be returning. And generally, coming up with a generic page template appropriate for cross-platform development takes a lot of time and effort.


### You've already set expectations from your user base about how your app updates

This is more of a warning for established apps about moving to SDUI - before you make such a big change, be sure to listen carefully to your user base.

SDUI does have its advantages, but abusing it with frequent changes could just as easily aggravate your users. **How many times have you logged onto a web platform you use often (think Google apps or social media platforms) only to find the UI has unexpectedly changed, and now you have to spend time looking for that button or tool you need?** While SDUI is great for making rapid changes, there comes a point where it might begin to negatively impact your users if they were already happy with how things were.


![Cloud Development](/media/articles/server-driven-ui-ios/cloudhybrid.webp)

## Important tips when using Server-Driven UI

To round things out, if you decide that using SDUI might be a good choice for your app, there are a few useful things to consider, especially if you're deploying to iOS:


### There are different levels of SDUI

Not everything about your app's UI needs to be server-driven. Some apps are good to be 100%, but you may find your app only needs specific components to be server-driven. The rest can be integrated into the current app version.

![Collaborating on Dev Ops](/media/articles/server-driven-ui-ios/devops.webp)

### All your UI components need to already be in the binary

For iOS and Android, any component or widget you want to render from the server must already be in the binary files of the app. This is the limitation we mentioned before on how much and how quickly you can make changes to your app's UI.

For example, if you have an iOS app view in which you want to do A/B testing between displaying a drop-down menu and a set of buttons, both the menu and buttons (whether SwiftUI or UIKit) need to already be in the binary currently deployed to the App Store. All you're doing is changing the order and appearance of components - all of which can be easily handled server-side.

**This is where versioning is very important,** as well as having your development teams decide how the app will handle anything from the server it doesn't recognize. For most development teams, logging the error and having the app ignore anything it doesn't recognize, but there should be a discussion and agreement around this issue.

Additionally, there also needs to be an agreement about what happens when a resource is unavailable – most frequently, when there's no Wi-Fi or network connection. You could use a local template that informs the user that a connection isn't possible but continues to support limited use of the app. But, because the kinds of apps that benefit from SDUI often use rapidly-changing information (think Airbnb or Lyft), you should have a strategy in place.


### All teams need to use the same template language

Your API is mostly likely a JSON file that needs to be read by all clients – iOS, Android, web, or any other platform you're deploying to. Because of this, the template needs to be written in a language all your teams know and use. This ensures that all clients can parse the template and data correctly.


### It doesn't have to be difficult to start using Server-Driven UI

The SDUI approach doesn't require you to go full ahead right out of the gate. You can start by thinking about what parts of your app's UI you want controlled server side. This can be small and simple, like widgets for displaying read-only data. By bringing it server-side, you can easily update and test the order, format, and appearance of your data.

It helps if you start with designing a very generic template – which might also be the most challenging part of the process, depending on how many development teams need to approve it. Once you're past that and are versioning your app correctly, it should be easy to start implementing SDUI into different parts of your app.

![App Design](/media/articles/server-driven-ui-ios/appdesign.webp)


## A Special Thanks to Mohammad Azam

We want to make a special thanks to [Mohammad Azam](https://azamsharp.com), whose thoughts and ideas in our interview with him on the EmpowerApps podcast inspired this guide.

If you're really interested in learning how to get started with Server-Driven UI, we recommend you check out [Mohammad's course on the subject over at Udemy](https://www.udemy.com/course/introduction-to-server-driven-ui-in-ios-swift-swiftui/).
