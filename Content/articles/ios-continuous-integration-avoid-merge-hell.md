---
title: 'iOS Continuous Integration: How To Avoid Merge Hell'
date: 2020-03-02 05:00
description: Continuous integration is the practice where small code changes are tested
  to ensure nothing breaks. Learn how it makes deploying your iOS app easy!
featuredImage: /media/wp-images/brightdigit/2020/02/ci-appstore-iphone-1.png
---
Continuous integration is the software practice where small code changes
are frequently tested with the rest of the code to ensure nothing breaks
as changes. It makes building and deploying an app easy.

The practice is a response to teams of developers making big changes to
the code. Often times, teams are working on the code without testing it.
As a result, this breaks lots of functionality, making development slow
and painful. 

This post is a brief introduction to Continuous Integration and how that
works when building apps for iOS. I will also cover how you and your
team can get started. Additionally, this includes building or
maintaining your iOS app cheaper and faster.

------------------------------------------------------------------------

> transistor https://share.transistor.fm/s/a14f868f

*Listen to our episode with Kyle Newsome on Continuous Integration to
learn more*

------------------------------------------------------------------------

## Continuous Integration Is About Reducing The Cost of Change

Continuous Integration (CI) is designed to help you and your developers.
For instance, CI helps avoid that painful moment after everyone has
written changes or fixes to your app. As a result, everything needs to b
integrated back into the code. In particular, this is known as a
***merge***. Eventually, you discover there are now bugs, errors and
conflicts created between the different changes.

As you might imagine, it is messy and unpleasant to untangle the code
causing problems and fix them. For developers, this is known as ***merge
hell***.  For a business that needs the app, it makes any changes very
expensive, both in money and time.

**CI avoids this problem by requiring developers to write, test, and
merge lines of code as rapidly as possible.** The original proponents of
CI suggested developers merge their code at least once a week. However,
daily integration is the most common practice, with some companies,
[like Netflix, integrating many times a
day](https://netflixtechblog.com/how-we-build-code-at-netflix-c5d9bd727f15).
The result is that changes happen quickly and if any problems are found,
they are small and easy to fix.

There are also a number of additional benefits that CI can bring:

### **Reduce over-reliance on specific tools, services or individuals**

Because CI forces you to make sure everything works constantly on a
single source of code, it will quickly expose any ways that prevent you
from doing this. This ensures that your app will run on your customers’
machines. As a result. this prevents issues where things will only work
with specific tools.

### **If it can be automated, it will be automated**

Core to practicing CI is being able to fully automate all the tests
needed to ensure a piece of code will work and automate the deployment
process itself. It isn’t possible to merge code on a daily basis without
this level of automation. The results should be your developers spending
as little time as possible testing and merging their code.

### **Faster feedback**

By integrating code often, you get feedback in the smallest amount of
time possible. As a result, this allows you to quickly discover if
something works or not.

### **Helps improve your business**

The above doesn’t just apply to writing code; it also allows you to
rapidly test how your app works on a business-use level:

-   Do your customers like a new feature or not?
-   Are they having any difficulties purchasing your products?
-   Are they using the app in any unexpected ways?

CI can help you answer these questions quickly and help you create a
better experience for them.

<figure>
<img src="/media/wp-images/brightdigit/2020/02/ci-appstore-iphone-1.png?fit=640%2C360&amp;ssl=1" class="wp-image-1966" />
</figure>

## Continuous Integration & iOS

Practicing with CI when building iOS apps is the same as with any other
platform, but Apple does make things a little more difficult. These are
relatively easy to overcome but are worth identifying.

The primary obstacle to practicing CI is Apple’s review process. For
instance, if you want to deploy code multiple times a day. With Apple's
review process, it ends up being difficult to get your app into the App
Store that often. However, if the code change is in a test phase as
opposed to production, the review times can be negligible. That is to
say, if you use a service like Apple's TestFlight, then the deploy meant
can be immediate.

Often, when you have conflicts in an iOS app, they are small but
important. For example, you can forget to update a build number (easily
forgettable), or not have the right certificates or profiles set up.

Ultimately, Apple simply requires you to deploy apps in a very specific
way. Some of it can be automated, but some can’t. This will mean you may
need more time than developing apps for other platforms.

<figure>
<img src="/media/wp-images/brightdigit/2020/02/people-doing-marathon-618612.jpg?fit=640%2C427&amp;ssl=1" class="wp-image-1968" />
</figure>

## How to get started using Continuous Integration

One of the best parts of CI is that it is straightforward to get started
with it. You only really need a few things to get started: 

### Make Sure Your Developers Have All The Same Things

What I mean here is if one developer has a tool or something that is
needed to build and test code for your app, ALL the developers should
have it. Part of being able to practice CI is being able to reproduce
everything your app does on any of your machines. Otherwise, it produces
a dependency and will slow everything down.

### One Source Of Code Only

In order for CI to work, developers must be working off a single source
of code for your app, known as a repository. All code merges are made to
this single source. This avoids any confusion and ensures any changes
made are only to the most version of your app.

### Fully Automate Your Tests

This is absolutely essential for CI. That is to say, an automated
testing environment can run thousands of tests in a matter of minutes.
(In contrast, it would take hours or days for a human to do manually).
As a result of automating your environment, you quickly find out if
there are any problems with any change. A point often overlooked but if
you don’t have this already, it may take some effort to set up. However,
it will easily pay for itself in the time and money it will save you. 

There are some excellent services available to help you automate all
your testing in the cloud. Some of the most popular ones are
[BitRise](https://www.bitrise.io/), [Travis CI](https://travis-ci.org/),
and [Circle CI](https://circleci.com/). Additionally, there’s
[Fastlane](https://fastlane.tools/), a software tool for automating the
iOS deployment process.

### Get A Code Review Process

Along with developing a process for all your testing, there should be a
process for ensuring code has been reviewed before it is merged. This
ensures that someone is checking for mistakes and also giving feedback
to the developers. It is a simple way of catching problems early so you
don’t have to deal with them later. Online services like
[GitHub](https://github.com/) have mechanisms for this built in, known
as a pull request process, which requires someone to approve any changes
a developer has submitted.

### Know Who’s Responsible

Related to the above, you often won’t want everyone involved to have the
same level of authority or access – you shouldn’t have a developer that
can make changes without anyone else having to approve them. This is
less about the technology involved and more about the people. Who is
responsible for what, and if a mistake is made, who finds out and
delivers the feedback necessary to fix it? Ideally, you should figure
out everyone’s roles and responsibilities before you start.

------------------------------------------------------------------------

> transistor https://share.transistor.fm/s/a14f868f

*Listen to our episode with Kyle Newsome on Continuous Integration to
learn more*

------------------------------------------------------------------------

## CI Makes Having An App Cheaper, Faster, & Easier

Continuous Integration is a very useful practice for making building,
updating and maintaining an app relatively painless. While it won’t
solve problems for you, it makes problems visible so you can solve them
for yourself. In the end, CI prevents future issues in the long term.

It is normal to experience friction between the people and tools
involved in developing your app, but with a little patience, the gains
in productivity can be huge. As a result, your team has created an app
and a process with faster builds, easier management, and fewer costs. 

If you'd like to learn more about setting up CI for Swift and iOS
development, check out [our article on Swift package continuous
integration](https://learningswift.brightdigit.com/swift-package-continuous-integration-guide/).
Also if you'd like to keep up to date with what’s new for iOS and Apple
development, I invite you to [sign up for my
newsletter](https://brightdigit.com/subscribe/). I will let you know
when I put out new content and if there are important things you should
know when it comes to creating or updating your apps.

------------------------------------------------------------------------

### Learn more about iOS development, management, and optimizing your process.

Subscribe to the email list to get the latest tips on patterns and
practices in iOS and Swift development.

------------------------------------------------------------------------