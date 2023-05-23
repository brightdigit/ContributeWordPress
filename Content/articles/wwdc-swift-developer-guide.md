---
title: A Swift Developer’s Guide To Getting The Most Out Of WWDC
date: 2023-05-23 00:00
description: This is a roundup of the best tips to get the most out of WWDC, Apple’s annual software conference, for both new and experienced Swift and iOS developers.
featuredImage: /media/articles/wwdc-swift-developer-guide/wwdc-swift-developer-guide.webp
---

[The Worldwide Developers Conference, better known as WWDC,](https://developer.apple.com/wwdc23/) is the annual event where Apple announces its major releases and software changes that affect how we, as Swift developers, work within its ecosystem.

In a way, it’s like Christmas for Swift development – WWDC sets the tone for the following 12 months, what it wants us to focus on, and let us know what Apple thinks is most valuable for the billion or so users of its products.

Apple tends to run the conference with the assumption that everyone attending is up to date on where its software is right now. Watching the WWDC talks is often the only way to understand how the newest things work or even how to make them work.

If you’re new to Apple and Swift development, it can be overwhelming with the enormous amount of information delivered over a week.

> transistor https://share.transistor.fm/s/42fea5da

This year, 2023, for example, we are looking forward to the release of iOS/iPadOS 17, tvOS 17, macOS 14, and watchOS 10, with the expectation that we’ll see some major usability and quality-of-life improvements. Additionally, we’re expecting an announcement of an [augmented/virtual reality headset](https://www.macrumors.com/roundup/ar-vr/) – a treat for WWDC, which is rarely used to showcase hardware (that doesn’t usually happen until the fall).

I recently enjoyed chatting with [Peter Witham](https://peterwitham.com), a fellow developer and the mind behind the Swift-learning site, [CompileSwift](https://www.compileswift.com), on [EmpowerApps](/episodes/149-how-to-wwdc-with-peter-witham/). We discussed WWDC and how to get the most out of the conference. This is a roundup of some of the best tips he and I talked about on the podcast.

![Backup Your Data](/media/articles/wwdc-swift-developer-guide/holding-a-backup-external-hdd-with-archive-and-con-2022-11-09-03-51-59-utc.webp)

## Back Up Everything

If you plan to try out beta OS versions or anything new with Xcode on your Mac, it is worth going to the trouble of cloning your drives to an external and ensuring you can boot from it before trying anything.

The approach of WWDC each year should signal all Swift developers to back up everything on all their machines if they haven’t already.

There will be interesting and potentially exciting things you can try out that are still in some kind of pre-release state. On the one hand, it’s an opportunity for developers to help Apple identify and fix quality and usability issues. But they historically also contain errors that can render other software on your machine unusable – or it might outright delete all your data.

Use TimeMachine or another cloud service back up to a local drive, but don’t skip this.

Then, if you have the time, create an additional partition on your internal drive with another backup. You may end up thanking yourself later.

Apple explicitly recommends this on its [beta software support page](https://developer.apple.com/support/install-beta/), saying to only install “ on devices and systems that you’re prepared to erase if necessary.”

![Stack of iPhones](/media/articles/wwdc-swift-developer-guide/iphones-stacked-on-each-other-2022-11-16-15-05-04-utc.webp)

## Don’t Install Betas On Your iPhone or Apple Watch (if you don’t have a spare device)

Related to the above, if you plan on installing a beta OS on any machine, especially iPhones and Watches, be prepared for that device to become useless.

During WWDC, iOS betas are likely to be very unstable, with major bugs. While it’s possible to opt out and roll back a particularly buggy beta, it is time-consuming to go through the process. And If you made the mistake of only backing up after running the beta, you won’t be able to restore it.

The same applies to the Apple Watch, although, given the pairing requirement, this is complicated (and expensive). The good news is it’s believed [this will be improved with WatchOS 10, making it possible to pair the Watch with multiple and any Apple devices](https://www.macrumors.com/2023/04/27/apple-watch-pairing-multiple-apple-devices/) in the future.

![Woman Setting at a Desk taking notes from hey labtop](/media/articles/wwdc-swift-developer-guide/woman-sitting-at-a-desk-in-an-office-in-front-of-a-2022-11-14-05-56-17-utc.webp)

## Make a Viewing List

There’s usually so much that comes out during WWDC that it’s unrealistic to dive deep into everything. Instead, it is time to clear [your WWDC bookmarks](https://c.im/users/leogdion/statuses/110242698447385023) in the [Apple Developer app](https://apps.apple.com/us/app/apple-developer/id640199958) and decide what is most important or exciting for you. It is worth it to be picky about what you watch or listen to.

Peter Witham suggests making notes for yourself for topics and sessions that grab your attention. He further suggests that the first time you watch a session, don’t worry about taking exhaustive notes – watch it all the way through and enjoy it. Then, if you’re still engaged by the time you get to the end, he recommends going back through it again and only then taking down the details.

As a general rule, when it comes to deciding what talks you should listen to, use the following criteria, which should ensure your time is spent efficiently:

* What you’re interested in
* Things that your current apps could use
* Features that you think you can build on top of

Additionally, the business and design talks during WWDC are often full of insights into what Apple is looking for when they think about what makes a successful app in the App Store.

Take note of any patterns you see in the talks. For example, if you see a lot of talks on a specific API. That’s usually a sign to pay attention and consider using it in your apps if it makes good business sense and you’re interested in being featured in the Store when the new API is fully released. 


### …and a list of questions

If you are fortunate enough to either attend one of the sessions to meet one of Apple’s engineers, or get to book a 1-on-1 lab session with one of them, be sure to come prepared with questions on their Developer app, as you have will have precious little time to come up with questions on the spot.

> youtube https://youtu.be/BXCzAzSQMO4

## Resources to keep up to date and connect with the Swift development community

There are a ton of good resources available for Swift and iOS developers looking to prepare themselves for WWDC – content and news you can check out that studies what Apple is likely to come out with, as well as a number of online communities where you can chat with developers in our community to analyze what Apple releases and share ideas.


### [Hacking With Swift](https://www.hackingwithswift.com)

Paul Hudson does a stellar job covering topics and news at the forefront of Swift app development. He recently published [an article covering the release of Swift 5.8](https://www.hackingwithswift.com/articles/256/whats-new-in-swift-5-8) with excellent breakdowns, code examples, and insights into what it could mean for the future of development.


### [WWDC 2023 Discord](https://discord.gg/wMYQx3jy)

[A Discord server has already been set up for this year’s WWDC](https://discord.gg/wMYQx3jy), and hundreds of Swift developers are already connecting and planning out what activities and talks they’re attending (both in person and online). WWDC is probably the biggest event of the year for bringing us developers together, so if your goal is to connect with people just like you, this is a great place to start.


### [Dub Dub Together](https://wwdctogether.com/#)

A live-streaming service where you can watch the keynote and other talks live online, with a live chat so you can talk to other viewers while things are happening.


### [WWDC Notes](https://www.wwdcnotes.com)

[WWDC Notes](https://www.wwdcnotes.com) is a community initiative that collects notes for all of Apple’s WWDC videos. You can use this fantastic resource to check recaps of different talks, compressing what is usually hundreds of hours of recording into something manageable.

Additionally, Apple itself keeps its WWDC videos published for only about three years. WWDC Notes keeps everything as a repository if you ever want to go back and watch older talks.

It should be pointed out that WWDC Notes is only as good as its contributors. If you find yourself motivated to take thorough notes of a talk, you can publish them here for the benefit of other developers.


### [iOS Dev Happy Hour](https://www.iosdevhappyhour.com)

If you can’t make it to WWDC or any other conferences to share experiences, hang out, and have a drink with other developers, iOS Dev Happy Hour gives you a chance to do it virtually instead.


### [MacRumors](https://www.macrumors.com)

MacRumors is usually a great resource for keeping up with the latest Swift developments, plus regular articles that explore and speculate what is coming next from Apple. At the time of writing, [they’ve just published a thorough roundup ahead of WWDC](https://www.macrumors.com/roundup/wwdc/), with a breakdown of what we can expect Apple will announce during this year’s conference.

![Pace Yourself](/media/articles/wwdc-swift-developer-guide/pace-yourself-this-is-your-journey-closeup-shot-2023-01-11-22-11-58-utc.webp)

## Lastly, Pace Yourself

WWDC is a week-long conference that marks the beginning of the next year of development in the Apple development community. You don’t have to be completely prepared, even on the day the conference starts. And pacing yourself applies equally if you are lucky to attend WWDC live or watch it all remotely.

What’s more, everything is recorded, so everything will be around for a while. The best advice is to take in the conference in a way that is best for the way you like to learn, whether that’s to sit and watch or immediately crack open Xcode and start playing around with things. 
