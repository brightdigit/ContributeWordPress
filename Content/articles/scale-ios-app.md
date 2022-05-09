---
title: Outgrowing your app: how to scale iOS app development
date: 2022-05-09 00:00
description: This guide is for you if you’re looking to scale iOS app development smoothly. It is designed to help those with a large team and a lot of legacy code.
featuredImage: /media/articles/scale-ios-app/overgrown-green-staircase-in-the-forest.jpg
subscriptionCTA: If you found this helpful and would like to read more, join the BrightDigit newsletter. We share all kinds of tips, advice, and interviews about all things Swift and iOS to help you build better apps.
---
Scaling an iOS app is challenging.

It's a balance between needing the app to remain fast while also adding new features that help meet business goals. It's even more  challenging if you're trying to scale an older app with a lot of functionality, forcing you to disentangle legacy  code.

This guide will help **anyone looking to scale up their iOS app and what you can do to make the development process move quickly and smoothly.**

## Who is this for?

This is for organizations, especially their development managers, that are:

* **Starting to upgrade** an app running on an older codebase
* **Managing many people** working on the app over its lifecycle
* **Maintaining an app** where a significant amount of functionality has been added since initial development.

![Playing Around with Different Designs](/media/articles/scale-ios-app/playing-around-with-different-designs.jpg "Playing Around with Different Designs")

## Design your app around your people

If you're trying to scale a large app, one of the most effective ways is to break up your codebase into small, manageable parts. The same principle also works when you have a large team doing the development work.

It’s a lot more manageable to organize the work of scaling an app with small teams. Each team should be interconnected and coordinated, but they should be able to do their work independently of each other.

There are a few reasons why this is ideal:

* It **keeps code quality high** by limiting the number of people who need to interact with any specific part of the codebase.
* It's **faster and easier** for your developers and engineers to organize their work when you only have to coordinate with three people instead of thirty.
* They can **better adapt to change** – a small team with a high understanding of their part of the codebase can adjust to the evolving requirements.

My advice is to put your teams before your app and **redesign your app's architecture to support your team structure**. This strategy helps avoid time-consuming merge conflicts.

As for team size, **3-4 people per team** would be ideal but anything more will see a loss in agility and communication between team members.

> transistor https://share.transistor.fm/s/5c6e99e7

### How to do this when redesigning a Swift App

For the last few versions of iOS and with the widespread use of SwiftUI, it's become easy to structure your codebase into easily manageable components. This makes it easy for each team to develop a component as a framework or Swift package and then ship it with an app without waiting for another team.

Modularization, or a [microapps architecture][1], is a good strategy for developing a complex app while keeping merge conflicts and build time low. Swift Package Manager and Xcode allow you to divide even the most minor component of your app into discrete modules, effectively making each an independent codebase.

> transistor https://share.transistor.fm/s/c8f9aa41

Initially, this may be challenging, particularly if you have a lot of legacy code or poor documentation. But, the result is that each of your small teams can work on one module at a time and iterate quickly, as it's a tiny codebase that takes relatively little time to compile.

If done correctly, each team should work within the app architecture without running into issues because of another component.

![Selection of Tools](/media/articles/scale-ios-app/selection-of-tools.jpg "Selection of Tools")

## Limit Your Tools

While modularization is very effective when working on large, complex apps, many things can still go wrong. To avoid this, you will want to make sure **there is an agreement, across all your teams, on what tools and libraries they use** when working on your app.

This is especially important if you need anything third-party, which cannot always be relied upon to be properly documented or updated as often as you’ll need. It can also devolve into development relying on specific people knowing what's going on – the very thing this strategy is supposed to help you escape from.

Additionally, if a specific tool or library is needed, allow for extra time to educate your teams on anything they're unfamiliar with. Yes, it will slow things down, but it will save you massive headaches later.

## Security work is hard but worth it

On the subject of things that are difficult but worth it: _data security on your app._

Apple has a range of tools to keep things secure. But, unless security is their dedicated specialty, it's reasonable to assume that many developers may not know about all the choices they have.

For example, you can store a lot of secure information on the [iCloud Keychain][2]. However, this is sometimes not done. A developer may not check the security of their network connection.

A sign that is happening is if you're using a lot of [App Transport Security][3] (ATS) exceptions in your Property List (PList) File. This may be a possible sign of something going wrong, such as:

* Data is stored in a non-secure format. Few things could be worse than having sensitive user data stolen from your app because you're storing it in the phone's documents folder instead of the keychain.
* You're using a third-party Software Development Kit (SDK) which is not up to date.
* You're allowing an older encryption format or protocol – using anything that's not current when it comes to security increases the risk of someone intercepting or changing data on your app.

Apple has [a great piece of documentation that covers security on iOS][4]. While it's mostly a general overview, it is an excellent starting point for any iOS developer or development manager who wants to know what security features and mechanisms are available for iOS.

## Focus on good craftsmanship

If you're a manager of Swift developers and you've made it this far, it's probably quite obvious but worth making the point: **you will want to do everything you can to help your devs focus on good craftsmanship.** We talked about this in the article on _[What You Should Know About iOS Software Architecture](/articles/ios-software-architecture/)_

What does that mean? It means they have the knowledge and time available for thorough unit testing and running automated tests. It also means allowing your developers to do more exploratory work, both with the app and on their own projects, as an investment in their professional development.

> transistor https://share.transistor.fm/s/99f236b1

**Asking your teams for multiple ideas when dealing with big issues and giving them the time and resources to do so can pay huge dividends. **Talk to them about why they may want to code things a certain way – it will make it a lot easier when they or you have to explain to management or the customer why things are a certain way and the value that brings.

The result should be better goal alignment within your organization and between the organization and the user.

[1]:	https://swiftwithmajid.com/2022/01/12/microapps-architecture-in-swift-spm-basics/ "Microapps architecture in Swift. SPM basics. by Majid Jabrayilov"
[2]:	https://support.apple.com/en-ca/HT204085
[3]:	https://developers.google.com/admob/ios/app-transport-security
[4]:	https://support.apple.com/en-ca/guide/security/welcome/web
