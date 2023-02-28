---
title: How to automate iOS development
date: 2023-02-28 00:00
description: Learn about 5 automation tools you can use right now to automate your iOS development, saving time and make your code more efficient and less repetitive.
featuredImage: /media/articles/ios-automation/automation.webp
---

## Because even developers deserve to have fun.

Streamlining your day-to-day workflow with automation can reduce friction within and between development teams. It also removes the most tedious and repetitive parts of app development.

But it can also be one of the most difficult things to do as an iOS developer.

[We've chatted before on the importance of Continuous Integration](/articles/ios-continuous-integration-avoid-merge-hell/) but in this article we will explore this fun, sometimes complicated, but overall stress-reducing aspect of making iOS and Swift apps with a list of automation tools we’ve enjoyed using in the last year or that we’ve seen work well for others. 

> transistor https://share.transistor.fm/s/a14f868f

## 5 Automation Tools You Could Start Using Right Now

<figure>
    <img class="icon" src="/media/articles/ios-automation/sourcery.png" />
</figure>

### [Sourcery](https://github.com/krzysztofzablocki/Sourcery)


Sourcery is a tool for generating code using templates. Because coding can get tedious when you need to reuse the same code over and over, some developers have taken it upon themselves to create tools that effectively generate generic Swift code blocks for you. This is really useful when creating mocks or writing tests


Sourcery is also useful because it helps you eliminate repetitive code, improves your app’s overall architecture, and generally helps you be a much more efficient developer.


A paid app, Sourcery Pro, is also available, extending Xcode and giving the ability to create your own templates that can ‘understand’ your own code.

<figure>
    <img  class="icon" src="/media/articles/ios-automation/xcodegen.webp" />
</figure>

### [XcodeGen](https://github.com/yonaskolb/XcodeGen)

XcodeGen is a Swift-based command line tool that creates your Xcode projects using file structures and project specs in YAML. These specs contain all the information in the project: targets, settings, dependencies… everything.

It’s probably one of the best automation tools you could be using.

 It minimizes or outright eliminates the possibility of merge conflicts. This can be an enormous source of pain relief, as .xcodeproj files aren’t much to work with, as they are not in any way designed to be human-readable.

It not only saves time from not having to manually set up your own projects, it gives you a lot of flexibility in how you create the project while being easier to find things because you have control over the entire file structure rather than having to work within the structure that Xcode uses by default.

If XcodeGen is too simple for your team there’s always…

<figure>
    <img  class="icon" src="/media/articles/ios-automation/tuist.png" />
</figure>

### [Tuist](https://tuist.io)


Similar to XcodeGen, Tuist is also a Swift-based command line tool for creating and maintaining Xcode projects. Tuist is a little more complex than XcodeGen, for when you’re dealing with larger apps or you need more fine control over your project.


Where XcodeGen uses YAML, Tuist writes your configuration files in Swift. Tuist also comes with a range of caching features that XcodeGen lacks, including [the ability to remotely cache using a cloud service](https://cloud.tuist.io) Tuist offers. This means that with Tuist, you might expect to find shortened build times. If you want to learn more about [automating Xcode project generation, check out this Runway article from former guest Jared Sorge](https://www.runway.team/blog/Xcode-project-generation).

> transistor https://share.transistor.fm/s/bab83e8a

<figure>
    <img  class="icon" src="/media/articles/ios-automation/fastlane.png" />
</figure>

### [Fastlane](https://fastlane.tools)

[Fastlane is a well-established platform](https://www.empowerapps.show/91) for automating your iOS app’s deployments and releases. The platform's tools handle signing, certificate management, screenshot creation and help save you loads of time when releasing your app.

Fastlane is also designed to support CI practices, integrating with other CI systems (including[ Gitlab CI](https://about.gitlab.com) and Github Actions), and is easy to customize and extend for what you need. 


### [Xcode Cloud](https://developer.apple.com/xcode-cloud/)

Xcode Cloud is Apple’s own (paid) service. As we’ve come to expect from Apple, the service brings together a range of different tools iOS developers were already using or familiar with so that you can do more without having to rely on anything third party or even without leaving Xcode.

This includes tools for running tests, reviewing user feedback, as well as deploying your latest builds directly from desktop. It is also fully encrypted, making it a secure place to create and store source code.


## Can You Have Too Much of a Good Thing?

As much as we like automating away the boring, tedious and painful aspects of our work, it’s easy to fall into the trap of over-automating things. It could wind you up where you spend hours automating things that honestly would have been faster or more cost-effective if you’d done it manually.

As a guard against this, always try to answer the question, “Should I really be trying to automate this?” Does it make sense in terms of time and the amount of tedium avoided? But most importantly, does it make good financial sense? [Automation can become very expensive](https://www.rainforestqa.com/blog/2018-09-25-why-test-automation-is-more-expensive) if you’re not vigilant about what is needed to support it, or how it might complicate an otherwise efficient tech stack. 

Additionally, overreliance on automation can make your code very brittle, causing things to fail when it comes time to upgrade or there’s a need to deal with something unusual that wasn’t previously identified as an edge case.


## What are your favorite automation tools and platforms?

If you enjoyed this article, and especially if you found a tool you didn’t know about before, we’d love to hear from you – what are your favorite automation tools? Do you have any automation best practices that you think need to become more popular? Email us, or tag us on [Twitter!](https://twitter.com/brightdigit)
