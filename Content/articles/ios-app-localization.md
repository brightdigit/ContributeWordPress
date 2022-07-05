---
title: App Localization: How to bring your iOS app to the world
date: 2022-07-05 10:00
description: iOS app localization is one of the most important to get right the first time. Learn how to send your app out into the world, how to succeed with localization.
featuredImage: /media/articles/ios-app-localization/select-language-learning-translate-languages-or-2021-08-26-16-56-59-utc.jpg
subscriptionCTA: The BrightDigit newsletter gives you advice about what we think you should know to stay on the leading edge of iOS and Apple development straight to your inbox. I try to help people better understand how to succeed with iOS apps, work with Apple developers, and how to best support your development team.
---

If your vision for an iOS app is to have it used by people all over the world, app localization is probably one of the first things you’re going to do.

**Localization is one of those things that needs to be done well, the first time.** It is extremely expensive to fix poor localization, often winding up as a giant bug made up of lots and lots of small bugs, proportional to the number of localized [strings](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/LoadingResources/Strings/Strings.html) you have for your app.

This article is for any developer or business that requires localization as part of breaking their iOS app out of a single market.

Below, we’re going to cover:

* How to **get started** with localizing an iOS app
* Apple’s **localization features and API** that can help streamline localizing
* What you need to do when it comes to **testing**

> transistor https://share.transistor.fm/s/395aa04c

## What is Localization, and Why Does it Matter?

**Localization** is *adapting software to be usable and relatable for other languages, countries, and regions.* Not to be confused with translation, which only covers the conversion from one language to another, localization seeks to make everything about an app contextually appropriate.

This may include:

* Altering of **images and icons**
* Creating **documentation**
* Creating **new audio**
* Altering or **removing part of the app** in response to cultural preferences or legal requirements
* **Redesigning user interfaces** so that things like space between objects, navigation
* **Rebuilding parts of the app** if there are different technical requirements in the target locale

<img alt="Global Audience" class="full-size" src="/media/articles/ios-app-localization/GlobalPeopleDiversityByBarsrsind.png" width="300" height="105" />

There are two related terms you should know:

**Internationalization** is the preparation of something for localization.

In this context, it generally refers to the strategy and design of an app so that localization work is possible and relatively easy. The other is:

**Culturalization**, which can be considered to be a step beyond localization – not just making something contextually appropriate, but *culturally meaningful* to users in your target market

Finally, all of this should be seen as a similar mindset to that of **[accessibility](https://www.apple.com/accessibility/)**. **You ideally want your app to be accessible by people everywhere**, or at least, all people likely to use your app in your given market.

**Only 17% of the world’s people speak English**, and a little more than 4% of the world could say to be part of the United States' cultural context. Therefore, most of the world’s market opportunities become available for a U.S.-made app that can be localized.

> youtube https://youtu.be/2Lj21NQ3CXI

## How to get started localizing your app

Getting started localizing an iOS app is really simple – all you really need to do is to create a new Xcode project and add a localizable.strings file. What you need to make sure here is that this is separate from your executable code. This way each localized version of your app’s content and assets can be developed independently from the work of developing the app’s codebase.

**Having all of your strings stored in one place apart from the rest of your code should be seen as best practice.** It also makes it easy for non-technical professionals and technical writers to easily find what’s in the app and review the content without having to search everywhere for a specific string.

![Xcode Screenshot](/media/articles/ios-app-localization/xcode-screenshot.jpg "Xcode Screenshot")

## Apple’s Localization Features

In general, **it’s a good idea to let Apple’s own systems do as much of the heavy lifting as possible.** Apple has gone to fairly significant lengths to make its products usable in every significant global market. For instance, Foundation APIs allow you to express dynamically-generated values across locales – things like dates, weights, measures, and currencies.

As an example, a new Formatter API has been introduced with iOS 15. Unlike previous APIs, you don’t have actually have to create new formatters and can convert data directly to a localized string. This makes the new API substantially easier to use than its predecessors.

You don’t have to initialize the formatter either. You simply code in `.formatted()` and then specify the format you need for your output. This is particularly useful for locales that don’t have universal measurement styles, for example, Canada, which uses a mix of metric and imperial measures. Apple’s formatter has already accounted for this, and will correctly output the right measurement for that locale without you having to calculate it yourself.

A new feature that can be particularly helpful is the [AttributedStrings](https://developer.apple.com/documentation/foundation/attributedstring) structure. It allows for easy localized attributed strings using Markdown (previously you could only do this using complex HTML). This way, there isn’t any HTML in your `.stringsdict` file that a translator or marketer won’t be able to read. One particularly cool feature is that this structure can read inflection marks, especially useful for doing language localization, especially for languages that use gendered words, like French and Spanish.

<img alt="Testing" class="full-size" src="/media/articles/ios-app-localization/tseting.png" width="300" height="105" />

## As always, remember to test

Like all things related to accessibility, **localization should always be seen as an ongoing process**, not a one-and-done. You will make mistakes – if you’re fortunate, you might even have your users constructively tell you if something is not correct or appropriate for them.

**Build a good relationship with your translators and transcreation writers:**

You don’t just send your assets off to them, get them back and just submit them to the app store. A good process might first include integrating them with the app, then sending revisions back for anything that doesn’t work, and do a limited beta test in a target language.

**Always try to get a second opinion:** mistakes might only be grammar or syntax errors, or they could also be something that’s culturally or contextually problematic. In either case, there’s always the chance that something is missed because one translator or writer doesn’t know a specific cultural reference, or they’ve worked for long on a piece of text they can’t see simple errors.

<iframe src="https://player.vimeo.com/video/596753695?h=ed5a3d6536" width="640" height="360" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
<p><a href="https://vimeo.com/596753695">Zach Brass - Localization for Beginnermediates</a> from <a href="https://vimeo.com/360conferences">360|Conferences</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
