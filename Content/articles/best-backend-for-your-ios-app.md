---
title: Choosing the Best Backend for your iOS App
date: 2022-09-01 00:00
description: There are many options for backend services for your iOS app? Which one is best for your app? Learn which is the right choice for your needs.
featuredImage: /media/wp-images/brightdigit/2019/07/Untitled-design-3-1.png
subscriptionCTA: While we’ve included a lot above, iOS development is constantly changing, and there will always be something new. The good news is this often means more choices that can fit your needs perfectly. The bad news is it’s tough to keep up with everything.
---

Choosing the best backend for your iOS App can be a challenge. There are many options, and which one is best suited for your needs depends on a number of factors, such as:

* Do you need a **cloud service**?
* Should you **run your own server**?
* Should you use CloudKit, Firebase, or another option?

We are going to dig into these questions and more to **help you choose the best backend and cloud services for your iOS app.**

## Is the Best Backend Actually No Backend At All?

First, it's important to know that cloud services aren't needed in every case when it comes to an iOS app. What can you do without them - A lot, actually.

A thing to know about iOS apps is, that in a lot of cases, people don’t need the cloud to store their data. It can just be stored on their phone.

> transistor https://share.transistor.fm/s/67771090

When you're building an app, you should consider whether you really need something stored in the cloud. **In the end, you could save a lot of time and money, if everything can be saved as a file, keep the data on the phone, and maybe only back that data up into cloud storage.**

In cases where you are dealing with private or sensitive data, it's a good idea to stick with keeping it on the phone. This is especially true when dealing with third-party apps like Twitter, YouTube or another API where you're not really storing data but storing it in the third party's structure. You can use that API as your database.

As an example, in an app we built, all the data was essentially stored using [Core Data](https://developer.apple.com/documentation/coredata). The data was all local because their time and budget didn't allow for anything else. There was a manual backup process put in place that would run and create a zip file of the data that they could store on the cloud. If they needed to restore it, it was easy to retrieve it and restore the data to their phones.

![Servers](/media/wp-images/brightdigit/2019/07/taylor-vick-M5tzZtFCOfs-unsplash-1-1024x574.jpg)

## Choosing Cloud Services for Your Best Backend

Using cloud services for your iOS app backend can be helpful if you're storing data or syncing across multiple devices. For example, note-taking apps that are available on all Apple devices can use a combination of [iCloud](https://www.icloud.com) and [CloudKit](https://developer.apple.com/icloud/cloudkit/) to store information on the backend. When a user opens their notes on their Mac or their iPhone, they are always available and accessible because they are stored in the cloud.

If you've decided that you do need backend storage, there are a few things you should consider before making that choice.

## The Purpose of Your App: MVP Vs. Enterprise

The first thing to consider is your timeline, budget and being clear about the purpose of your app : **Is it a simple Minimum Viable Product (MVP) or an Enterprise app you mean to support over the long-term, meaning it needs to be well designed from the start?**

An MVP is a simple app for proving it's something your customers will actually want. It's something you need to get out quickly and is most likely a bare-bones version of the features you think your customers will want.

On the other end of the spectrum, there are enterprise apps that need to be well-architected right from the beginning. If you're going this route, you're going to want something that is more robust and customizable than the MVP. Whereas with an MVP, the best backend is something that's simple, easy, cheap, and will get the job done quickly.

 When you are writing your Swift app, **you'll want to make sure you have some healthy abstraction with your backend communication.** That way, you will be able to pivot easily if you decide to use a different service at a later date and your users won't see anything different on the front end.

<figure>
 <img src="/media/articles/best-backend-ios/different-devices.png" />
 </figure>


## What devices will your app support?

There's a variety of devices you may need to support:

* Are you only supporting Apple devices? 
* Or are you going cross-platform and supporting Android? 
* Will you have a desktop, and will it be browser-based or an application? 
* And if you’re doing a desktop application, will it support Windows and/or Linux? 
* Does your app need to support connectivity with the Internet of Things? 

These are all questions to consider when deciding what backend services to use.

If you're only supporting Apple devices, you may want to consider [CloudKit](https://developer.apple.com/icloud/cloudkit/). If you're supporting Windows or Android, [Firebase](https://firebase.google.com) might be a better option. In either case if you have the expertise, budget and time, running your own server in the cloud might be an option too. We'll discuss these options in detail later in the article.

## Complex Vs. Simple Queries

Many tasks use relational data, which are best performed using some sort of SQL database. Unfortunately these can be pricey. Conversely, **many simple document-based cloud storage options are cheaper. The drawback with these services is that relational data becomes complex to query.**

Therefore, if you're willing to offload a lot of the complexity of a good query over to the device and want to save some money document-based services such as [Firebase](https://firebase.google.com) might be a good option. In these cases, you could consider caching your complex data for later rather than querying the data each time. Remember, a simple query would need to lookup data with a particular ID only.

**You need to ask yourself if you're willing to offload a lot of the complexity of a good query over to the device, or if it is more important to have that information on the server.** The best backend for your iOS app might not be the easiest to query but the cheapest and easiest to maintain, depending on your priorities in this regard.


## The Expertise of Your Team

This is a big factor because if their expertise is [.NET](https://dotnet.microsoft.com/en-us/), you're probably better off using a Microsoft backend with an SQL Server and C#. If you're already getting a decent price on Microsoft Azure, for instance, use it because that's what your team has expertise using. 

If your team is well versed in Swift, you may want to consider [Vapor](https://vapor.codes) for your backend. [You can check out our review of Vapor](https://brightdigit.com/tutorials/vapor-swift-backend-review/?utm_medium=web&utm_source=learning-swift), but you should know that since we wrote that review, Vapor has improved significantly as a framework since its Version 4 release.


## User Interface (UI)

We also recommend doing some user-focused design to come up with the kind of data that your users will need. Afterward, work your way back towards how you would need to store that. For instance, you can start by building out the UI of the app and essentially fake the data to make sure that data is what the customers want and then go back from there. Get your UI taken care of because that's the thing the users are going to see.

SwiftUI has now become the first tool you should be looking at if you’re building an app natively to iOS (or any other Apple device). While you’re likely already familiar with it, in case you’re learning this for the first time, do check out [Apple’s introduction to SwiftUI](https://developer.apple.com/xcode/swiftui/). As well, we have [a short article that goes through how SwiftUI changed UI creation from what we had before](https://brightdigit.com/articles/swiftui-everything-is-possible-if-you-think-like-apple/).

SwiftUI uses a declarative way along with observing changes to data similar to HTML and many Web frameworks. As opposed to  UIKit which was based on an imperative method (i.e. using commands) and a delegation pattern.

These factors, plus the budget you're working with and the time you have to spend are all factors to consider when thinking about back-end storage.

> youtube https://www.youtube.com/watch?v=_-k97s1ZPzE

## So, what are your options?

Once you've asked yourself all these necessary questions, you'll want to start looking at the options that fit your needs and budget. If you feel you need backend support, you'll need to decide the best option for your app and your user. Here are some options to consider.

**The advantages of hosting your own is the fact that you can customize everything down to the minutiae, but the burden is on you to make sure everything is set up correctly.** Along with cost and maintenance, services such as CloudKit or Firebase pretty much can take care of everything are much cheaper. All you need to do is write your app code and get your database set up.


### Hosting a Server For Your Backend

The most customizable and robust option is just to host your own server. You can buy your own server and host it at a site with a virtual machine like [Amazon Elastic Compute Cloud ](https://aws.amazon.com/ec2/)(EC2), [Linode](https://www.linode.com) or [DigitalOcean](https://www.digitalocean.com). However, you may not want a complete server both due to the cost but also the need for maintenance.

If you want some of the control of setting up your own server with minimal cost and maintenance of it, [Heroku](https://www.heroku.com) is a great option. If you're starting from scratch and want something to play with, their free tier is pretty decent and includes a [PostgreSQL](https://www.postgresql.org) database.

Speaking of PostgreSQL, you’ll need to set up your own database, as well as other server software. Here are some specific options to consider:


#### Databases



* [PostgreSQL](https://www.postgresql.org)
* [MySQL](https://www.mysql.com)
* [MariaDB](https://mariadb.org)
* [MongoDB](https://www.mongodb.com)
* [SQL Server](https://www.microsoft.com/en-gb/sql-server/sql-server-downloads)

You’ll also need something to serve content whether it’s images, JSON, or HTML:


#### Server Software



* [IIS](https://www.iis.net)
* [Nginx](https://www.nginx.com)
* [Apache](https://httpd.apache.org)

Also, consider some other services such as:



* [Cloudflare](https://www.cloudflare.com) – for monitoring, caching and serving as your content delivery network
* [New Relic](https://newrelic.com) – for monitoring and security
* [Supervisor](http://supervisord.org) – for services
* [GraphQL](https://graphql.org) – a powerful open-source query language you can use with multiple architectures and API configurations

If you're working with a simple MVP or releasing only for Apple, I would not recommend hosting your own. If you have simple needs, go with the simplest solution and then plan on scaling out from there according to the growth of your own needs.


### CloudKit as Your Backend

One really affordable option worth exploring in more detail is Apple's back-end storage system, [CloudKit](https://developer.apple.com/icloud/cloudkit/). CloudKit is fairly simple to use if you're sticking with iOS. It comes with push notifications and is completely native to Apple. It also enables you to transfer ownership of your apps, which is a big help if you are building apps for clients.

**If you're running a Mac app or an iPad app or using an Apple Watch or Apple TV, CloudKit really easy to use.** It also includes a JavaScript component for the web. When using CloudKit, you would be fine offloading some stuff onto the iPhone itself if the data isn't too complex.


### Firebase as Your Backend

[Firebase](https://firebase.google.com) is the most popular mobile backend as a service not only because of its price but also because it's available on a plethora of devices. Specifically, its Cloud Firestore is a NoSQL cloud database for both client and server-side development. Firebase incorporates features from both Firestore and Google Cloud (GCP) On the surface, it seems really appealing but you should think carefully before using it for certain projects. If you want to learn how to do real-time database integration in a web browser and you don't want to introduce apps where you have to create a lot of extra code in order to access data, Firebase is a great way to go about it.

**We recommend using Firebase and specifically Firestore for when you don't need to do lots of complex queries;** this depends of course on how your app’s data is organized. It’s worth noting that while Firestore, and Firebase products generally, are popularly believed to only be best for developing really basic app products, this isn’t really true. using Firestore as a backend also comes with live support for critical components like app security and authentication. All this to say, it’s important to study it before you jump in to make sure it’s a good fit for your needs.

If you want to learn more about Firebase and Google Cloud Platform, I highly recommend checking out [this video from their team.](https://www.youtube.com/watch?v=xbmYmgBEj4o) or [our episode we did with Peter Friese, who's Developer Advocate at Google on Firebase](/episodes/108-what-is-firebase-with-peter-friese):

> youtube https://www.youtube.com/watch?v=8m8oppa-Los

## Final Tips

We know we're leaving you with a lot of information, so as a final tip: **When considering any solution, check to see if there are any big companies using them.** The best backend for your iOS app needs to be something that's rock-solid and stable and gets a lot of support, so it’s worth checking out what the big players are doing. **You can be sure companies with a lot of money to spend will have taken the time to research and vet these solutions, so as a general rule their choices will be a little bit safer than an under-researched option.**

Typically, large companies will go with one of the big cloud service providers: [AWS](https://aws.amazon.com) or [Microsoft Azure](https://azure.microsoft.com); Smaller companies will go with [Firebase](https://firebase.google.com), [CloudKit](https://developer.apple.com/icloud/cloudkit/) or host on [Linode](https://www.linode.com) or [DigitalOcean](https://www.digitalocean.com). 

Whatever you choose, **remember, if you need to pivot, do it early. Don't do it when it's too late.** If you feel like your data isn't a good fit for what you’re using, make the change as quickly as you can to avoid burning out constantly trying to get your data to fit.
