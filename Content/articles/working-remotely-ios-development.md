---
title: 'Working Remotely: Best Practices for Distributed iOS development'
date: 2021-02-25 04:17
description: Working remotely on iOS development can be very successful. To make it
  a powerful tool for building great apps, you should consider these best practices...
featuredImage: /media/wp-images/brightdigit/2021/02/dan-gold-kARZuSYMfrA-unsplash.jpg
---
2020 was the year so many businesses were pushed into remote work to
survive. **The number of Americans working remotely more than a day a
week has exploded from less than 25% to more than 67%.** And, for many,
it has been popular. Working remotely will be more common, even after
the global pandemic has passed.

Remote work in software development isn’t anything new. Just ask those
with experience in **[*distributed software
development*](https://www.smartsheet.com/content/distributed-software-development).**

There are some important lessons we’ve learned over the years on how to
do work remotely well. There are benefits that help both employees and
employers. I’ll go through the most important best practices you’re
going to want to put in place. This will ensure remote work supports
your capacity to build great iOS apps without slowing everything down.

<figure>
<img src="/media/wp-images/brightdigit/2021/02/dan-gold-kARZuSYMfrA-unsplash-1024x576.jpg" class="wp-image-2270" />
</figure>

## The Benefits of Remote Working

As an independent developer, I have a bias for remote work – I’ve been
working remotely for almost 10 years. I’ve noticed major benefits:

-   **Dealing with Home Life** - It makes it easier to adapt to changing
    circumstances in your work and home life. If a project you’re
    working on needs your attention unexpectedly, or one of your
    children is home from school sick, it's much easier to adapt with
    everything you need within easy reach.

<!-- -->

-   **Saving Time and Money** - Working from home saves an enormous
    amount of time and money that you may not be aware of until you try
    it. It is estimated that, before COVID-19, the [average American was
    spending 225 hours a
    year](https://www.washingtonpost.com/business/2019/10/07/nine-days-road-average-commute-time-reached-new-record-last-year/)
    – more than nine calendar days – commuting.  As well, the cost of
    car maintenance and/or public transit adds up to thousands of
    dollars each year. And that’s to say nothing of what other things
    you could be doing for your work or life with that time.

<!-- -->

-    **Reducing Overhead** - It reduces overhead and productivity loss
    from commuting and needing an office to accommodate all your staff
    all the time. There is data that shows that, if management has a
    positive, trusting relationship with their staff, [remote work can
    give employees a significant productivity
    boost](https://www.inc.com/scott-mautz/a-2-year-stanford-study-shows-astonishing-productivity-boost-of-working-from-home.html).

<!-- -->

-   **Improved Flexibility** - Remote working can also make the business
    more competitive. First, the flexibility of remote work makes it
    easier for employees to deliver their best work and for employers to
    retain them. As well, remote working usually forces a shift toward
    focusing on whether goals are being met, and away from performance
    being judged by mere presence in the office.

Some of these benefits are hampered by the fact that remote working
needed to be implemented quickly. This is further compounded by
complications like healthcare, loss of business, and having kids remote
learning from home. However, we can reasonably expect it to get easier.

## Working Remotely Best Practices for iOS Development

### Get Buy-in

This should be obvious to most people, but with [the regular failure of
*workplace
transformations*](https://www.linkedin.com/pulse/73-business-transformations-fail-biggest-failure-factor-lowgren/),
the realization that [the much-vaunted open-plan office did the opposite
of what it was sold to
do](https://hbr.org/2019/11/the-truth-about-open-offices), and the
additional analysis that shows [such offices are excellent vectors of
disease](https://www.nationalgeographic.com/science/article/will-coronavirus-end-the-open-office-floor-plan),
it bears repeating. If you’re a manager, keen to implement remote work
for your team, you need to make the change collaborative. If you want
your developers to be effective with a remote work policy, **have them
be a part in creating it. **

The pandemic imposed this way of work on millions in a way that they
never got to have a say in, let alone prepare for.

### iOS App Provisioning

**App Provisioning is probably the single most important Apple-specific
consideration when it comes to remote work.** Apple has a chain of
authority between itself and your app. This chain is designed to make
sure your app is trustworthy and stable before being downloadable from
the App Store. Apple doesn’t make it especially easy to understand how
it works.

#### A Brief (as possible) explanation of iOS App Provisioning

First, there is the Apple Certificate Authority. It serves as the
gatekeeper to the App Store.

When you start building an iOS app, you create a Signing Certificate.
This identifies you as a developer recognized by Apple. Creating a
Signing Certificate generates a key on your computer (and only your
computer) that connects you to the Apple Certificate Authority.

With that done, the iOS app you’re creating is assigned an App ID,
linking your app to your Signing Certificate.

**Next, you must create Provisioning Profiles.** These profiles declare
connections between a specific build of your app and the App ID. Each
profile specifies what that build is for (i.e. internal development,
adhoc distribution, release to the App Store). It may also contain a
list of devices where the app can be tested and distributed.

Now, why does this all matter if you want to work remotely? Because to
make this work, you’re going to need to determine, for every member of
your development team, who has what access to a specific provision
profile, and on which machines (both in the work office and the remote
office). You'll also need to decide who handles the computer with the
Signing Certificate key.

It’s not especially difficult to manage once it’s done, but expect it to
be a time-consuming task to set up.

I highly recommend taking a look at the Fastlane suite and their [Match
command](https://docs.fastlane.tools/actions/match/) to help streamline
this. Also here's a great list of tech articles to help with this:

-   [DEMYSTIFYING IOS PROVISIONING By Cory
    Bohon](https://martiancraft.com/blog/2017/05/demystifying-ios-provisioning-part1/)
-   [What is a provisioning profile & code signing in iOS? by
    Abhimuralidharan](https://martiancraft.com/blog/2017/05/demystifying-ios-provisioning-part1/)

<figure>
<img src="/media/wp-images/brightdigit/2021/02/chris-montgomery-smgTvepind4-unsplash-1024x768.jpg" class="wp-image-2271" />
</figure>

### Communication

Successful remote work is almost entirely about communication.
Critically, the style of communication needed for effective remote work
is different from those that are successful when everyone is together.
You need a different set of rules and tools for remote work
communication:

#### Choose your tools

For many teams, there is likely already an answer to the question of
what tool they want to use for communication because they’re already
using one. [Slack](https://slack.com/intl/en-us/) is far and away the
most popular. [MS
Teams](https://www.microsoft.com/en-us/microsoft-teams/group-chat-software)
and [Chanty](https://www.chanty.com) are also proven and effective
platforms. There are many different tools and platforms available
depending on how many people are involved and the details of what they
need.

#### Choose your communication rules

In an office, people pick up on what are usually unwritten rules of
communication through context and observation. This is obviously much
more difficult when your colleagues only appear as names on a screen.

To keep things running smoothly, make rules written and explicit.

-   How often should you reasonably wait for a response during work
    hours?
-   And work hours in which timezone?
-   With many channels, what information do you put in which channel?
-   If there are important announcements, how are those delivered?

These are just some questions for which the answers should rules or
guidelines.

With asynchronous communication, you need to be open to learning new
communication habits. You will need a different attitude than you do at
the office. People will not always message you back right away. If you
need to talk to someone about something important, schedule a meeting.

For more details on how to communicate remotely, [we did a podcast
episode on this very topic.](https://share.transistor.fm/s/2445da70) We
talked with Jacob Gorban who has been leading remote work for over 10
years at his company [**Apparent
Software.**](https://www.apparentsoft.com) Not only do we talk about
communication, but also keeping teams productive, managing iOS
development and more.



### Training/Code Review Planning

You will want a remote work-specific process for code review and
feedback, especially for junior developers who need mentoring. How you
handle this up to you: you might schedule meetings between senior
developers and juniors, or even (when conditions allow) having them meet
at the office.

### Working Remotely Doesn’t Work For Everyone

There are some conditions where remote work probably isn’t an optimal
policy. Much like getting buy-in, involving everyone and discussing how
remote work might work should reveal if it’s a good idea. That said,
there are cases where it can often be unhelpful:

-   Unstable or rapidly changing workflow  
    Remote work usually succeeds when the workflow is stable and
    consistent (even if there are rapid changes within the project
    itself). If the workflow is constantly shifting, remote work can
    work, but you’re probably going to discover you will need to bring
    everyone together often to ensure they’re all on the same page.

<!-- -->

-   Inexperienced teams or very old teams  
    Remote work tends to work best with teams that already know and
    understand each other well. If team members are working with each
    other for the first time, there is no reason they shouldn’t be able
    to work remotely, but they should have opportunities to work
    together to build better rapport.

On the other hand, teams that have been together for a long time, and
have up until this point only worked together in the same space, might
find remote work challenging if it goes against the grain of how they’ve
always worked together before.

None of this should be considered a universal rule, only that it
shouldn’t be surprising if teams like these find remote work to be
difficult.

## Getting started with working remotely

To make remote work iOS development a successful practice, you do need
to put in the work up front. A lot of it is communication-related, with
some technical. Done effectively, it can be a powerful tool for your
organization. It can help you develop better apps faster, and with less
overhead and friction than when working together in an office.

## Was this useful to you? You can get more helpful advice like with the BrightDigit newsletter

I put together a newsletter twice a month, where I deliver iOS and
iOS-related content and news. I aim to make sure that my subscribers are
always on the leading edge of knowing what’s going on in the rapidly
changing world of iOS and Apple. If you want to join them, [click here
to subscribe, and enjoy!](https://brightdigit.com/subscribe/)