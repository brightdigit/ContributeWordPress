---
title: What you need to know before you enable in-app purchases in your Swift app
date: 2022-06-02 00:00
description: Learn about Apple’s in app purchases and how to best monetize your Swift app. Know purchase types are right for your app and how to market and test them.
featuredImage: /media/articles/in-app-purchases/close-up-woman-paying-for-online-purchases-by-cred.jpg
subscriptionCTA: Sign up for our newsletter if you want to keep up-to-date on other significant aspects of building apps for the Apple ecosystem. We share tips, advice, and insights, both on our own and from other development professionals.
---

Your Swift app is coming together nicely. A well-built backend, polished UI, clear market differentiation and knowing your app will help many of your customers.

You're now turning to ways to monetize and decide to use **in-app purchases**. And you didn’t realize how many decisions you would need to make around this small but often overlooked part of app development.

**You need to be careful when working with in-app purchases.** They can be incredibly effective, but **they will hobble your user experience if poorly executed.**

Like many things in development, they might seem simple but will create headaches for both your developers and your business if they're not well-aligned.

This article covers three main areas of in-app purchases:

* **Purchase types**
* **Marketing and copywriting**
* **Purchase testing**

The goal is to show you how to avoid these pitfalls and point you toward success.


> youtube https://youtu.be/_3sIBHZPhx8

## Which Purchases Type Is Best For You

In almost all instances, adding in-app purchases to a Swift app will involve using the StoreKit API).

Apple has good documentation explaining the different types of in-app purchases available on their platforms – the following is meant as a simple summary to help you consider which type of in-app purchase may be best for your app.

![Mobile Gaming](/media/articles/in-app-purchases/mobile-game.png "Mobile Gaming Example")

### Consumable

This is the go-to purchase type for games or apps which use any credit-based system. First, you sell a consumable to the user. Then, the user spends the consumable to get a bonus, boost, credit, content or digital good. Once they've depleted your consumables, repeat.

Examples of apps that might use this purchase type:

* Games
* Dating apps (that temporarily boost your visibility on the platform
* Social media apps
* Content library apps (where individual pieces of content are sold as consumables)

![Premium Upgrade](/media/articles/in-app-purchases/premium-upgrade.png "Premium Upgrade")

### Non-consumable

These purchases permanently unlock premium features in your app. **We recommend this if you have an app that is free to use but offers "pro" functionality or additional bonus content.** This is also the recommended purchase type if you're offering a product or tool that you don't plan to further develop once released.

You might also use this if you're offering a so-called "paymium" app: The app costs something upfront to download and use, who then can pay a little more to get additional features or content.

This can be an excellent strategy to keep the initial download price of your app low and the buyer friction this creates while still being able to monetize the full range of your app's capabilities.

Examples of apps that might use this purchase type:

* Photo/Illustration apps (to unlock additional features or filters)
* Dating apps (that over an improved experience for a cost)
* Games (for permanently unlocking cosmetic items)
* Any apps that use ads to monetize but offer a paid version that removes ads

![Family Watching Movie Subscription](/media/articles/in-app-purchases/family-watching-movie.png "Family Watching Movie Subscription")

### Auto-Renewing Subs

Apps using this in-app purchase provide ongoing access to content or features. Users are charged recurringly - commonly monthly - and must manually cancel their subscription if they wish to stop.

You'll most likely want to consider this if you're app offers a lot of multimedia or provides ongoing services to your user, commonly Software-As-A-Service (SaaS). This method fits well with a remarkably high number of apps on the market and gives your business the stability of recurring revenue.

The main pitfall you want to keep in mind is that by going down this path, **you set user expectations and behold yourself to Apple's own requirements to add to and increase the value of your app continually.**

Examples of apps that might use this purchase type:

* Streaming services
* SaaS platforms
* Learning/Educational Apps
* Finance apps
* Fitness/Meditation Apps

![Limited Time Offer](/media/articles/in-app-purchases/limited-time.svg "Limited Time Offer")

### Non-Renewing Subs

As the name implies, this purchase type allows users to access features for a limited time, and users will need to buy new subscriptions each time to keep continued access.

These purchase types are also useful with apps that do limited sales or offerings, allowing your users to subscribe, but only when it is relevant.

Examples of apps that might use this purchase type:

* News apps
* Games (offering season passes)
* Seasonally-relevant apps, where you can reasonably expect users will only use it for part of the calendar year
* Patronage apps, where you can subscribe to support content creators (think Patreon or Twitch)

> youtube https://youtu.be/LaCj_Oaw1uo

## Marketing

When it comes to marketing a Swift app, it pays to spend lots of time understanding your users, maybe even before releasing your app. This might include:

### Visiting forums

A good place to start is [Apple's Support Community](https://discussions.apple.com/welcome). **You're looking for feedback from users of your app, but if your app serves a specific need, look for related questions that users are asking.** If you're working in an established niche, look for users' queries and complaints about your competitors' apps. This is a simple, low-cost way of learning about your users, especially when you have user numbers in the thousands or less and analytics data will likely be less helpful.

### Start a Mailing List

**Before you have an app in the App Store, you can start a simple mailing list and build relationships with prospective users.** You can also attach this to a waiting list for your unreleased app, making it helpful in gauging early interest in your offering.

Additionally, you can get early feedback by showing your list tastes of your app: what it does, what it might look like

### Interview Your Users

**Talk to your users through forums and mailing lists suggested above or directly if you have that kind of relationship with your user base.** Ask them about their values and what features they like the most and least.

This is super important if you plan to put parts of your app behind a paywall. You will want to get a good balance of features that users get straight away and understand well enough to convey the value of paying to gain access to the rest of your app. Getting it wrong could make or break your app.

### Apple's Internal Marketing Tools

Additionally, Apple provides several tools to assist in marketing your app. Apple's documentation is good, so we're linking them here.

* [In-app events](https://developer.apple.com/app-store/in-app-events/)
* [Family sharing](https://help.apple.com/app-store-connect/#/dev45b03fab9)
* [Promoted in-app purchases](https://developer.apple.com/app-store/promoting-in-app-purchases/)
* [Subscription offers](https://developer.apple.com/app-store/subscriptions/#providing-subscription-offers)
* [Localized Pricing](https://help.apple.com/app-store-connect/#/devc9870599e)
* [Bundling](https://developer.apple.com/app-store/app-bundles/)
* [Promo Codes](https://help.apple.com/app-store-connect/#/dev50869de4a)

> transistor https://share.transistor.fm/s/b35be3a4

## Testing

One of the biggest challenges of monetizing an app is where you want to put up a paywall.

On one side, you might require the user to pay for the entire app upfront in the App Store, but potentially make it difficult for users to fully understand your app's value. On the other hand, you might choose to put only very specialist or niche functionality behind the paywall, which most users will never want.

While talking to your users can give you strong direction for where your users find value in your app, there is no substitute for [good testing.](https://www.revenuecat.com/blog/price-testing-for-mobile-apps/)

It's easy to into certain traps when testing different kinds of in-app purchases. One of the most common is relying too much on analytics and A/B testing during the early days. If your user base is small and you don't have a long history of established user behaviour, it's doubtful that your data will have statistical significance.

### Avoiding _too many_ platforms

Another common mistake is testing and deploying on too many platforms on release. This is particularly common with apps made to be cross-platform between iOS and Android. [As I've written about before](https://brightdigit.com/articles/native-app-development-advantages/), this strategy often leads to a worse UX experience and more costly maintenance. Native app development generally will deliver a better experience and performance.

But this point can lead beyond that: for a Swift app, **it could be better to focus on delivering a creative user experience** on, say, iOS and watchOS, and only later, invest in deployment to macOS.

One tool for getting early feedback when useful user data isn't available is [TestFlight](https://testflight.apple.com/). It allows you to experiment with in-app purchases and get all-important early insights shaping your messaging, design, and user experience.

In this way, you can see rapid results from testers when trying different purchase types. You can also test adjusting your paywall and get feedback on various marketing and sales messages, including localized messaging.

---

We hope this gives you a good starting point for discovering the optimal way to monetize your app and make the best use of in-app purchases with your Swift app.

If you'd like to learn more specifically about using in-app purchases, we also invite you to visit [our friends at RevenueCat](https://www.revenuecat.com), whose advice helped us put together this article. [RevenueCat](https://www.revenuecat.com) are skilled professionals at growing app revenue for their customers and masters of getting the most of in-app purchases and subscriptions.
