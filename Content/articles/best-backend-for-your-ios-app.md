---
date: 2019-07-30 16:19
---
# Choosing the Best Backend for your iOS App


Choosing the best backend for your iOS App can be a challenge. The options are robust and depend on a number of questions like--do you need a cloud service? Should you run your own server? Should you use Cloudkit, Firebase, or another option? We dig into these questions and the other things you should consider when looking into back-end and cloud services for your iOS app. 







First, it's important to point out that cloud services aren't needed in every case when it comes to an iOS (or any mobile) app. So, what can you do without them? A lot, actually. 


> So one thing to consider is - there's a lot you can get away with without even doing cloud services. The thing with an iOS app is you can store your data in something like iCloud or in a lot of cases people really don't need the cloud to store their data. They can just store it on their phone itself.EmpowerApps.Show - Episode 8 - Cloud and Backend Services





## Best Backend is No Backend?


Is the best backend for your iOS app, no backend? In many cases, you don't need cloud services for storage as you can just use the phone itself. When you're building an app, you should consider whether you really need something stored in the cloud or are you able to use a manual mechanism to back up the data? If you can create a mechanism that saves the data into cloud storage as a file, it could save you a lot of time and money. 



In cases where you are dealing with private or sensitive data, it's a good idea to stick with your phone. This is especially true when dealing with third-party apps like Twitter or YouTube or another API where you're not really storing data but storing in the third party's structure. You can use that API as your database. 



As an example, in an app built for doctors and nurses to receive continuing education for their career, all the data was essentially stored using Core Data which is a SQLite database abstraction layer. It was all stored locally because their time and budget didn't allow for anything else. There was a manual backup process put in place that would run and create a zip file of the data and save it on the device. If they needed to restore it, they could sort it in the cloud and restore it back to their phones. 






## Choosing Cloud Services for Your Best Backend


The best backend for your iOS app can be really helpful if you're storing data or syncing across multiple devices. For example, note-taking apps that are available on all Apple devices (phones, iPads, computers) use a combination of iCloud and CloudKit to store information on the back-end. When a user opens their notes on their Mac or their iPhone, they are all available and accessible because they are stored in the cloud. 



If you've decided that you do need back-end storage--what are some things you should consider when choosing the right path? Let's take a look. 


> One thing to consider is timeline and budget and specifically what is the purpose of this app? Is this just a simple MVP or is it more of a long-term app that needs to be well architected when I first starts off? EmpowerApps.Show - Episode 8 - Cloud and Backend Services

### The Purpose of Your App: MVP Vs. Enterprise


Take a look at the app you're designing. Is it an MVP or a more robust Enterprise app?



An MVP (Most Viable Product) is a simple app that is just proving it's something your customers will actually want. It's something you need to get out quickly and is most likely a bare-bones version of the basic features you think your customers will want. 



Or, does the app need to be well-architected right from the beginning, like an Enterprise app for a Fortune 500 company? If you're going this route, you're going to want something that is more robust and customizable and it should be something you'll want to work with for the long-term.



If you're looking to get out an MVP, the best backend for your iOS app is something that's simple, easy, and cheap and will just get the job done. It should be something that can be easily tested by your audience so you can see if it works with the needs of your users.  



You'll also want to make sure you have some healthy abstraction with your API communication when you are writing your Swift of Objective-C code to talk to the back-end. That way, you will be able to pivot easily if you decide to use a different service at a later date and your users won't see anything different on the front end. 


### Supported Devices


Are you only supporting Apple devices? Are you also going to support the web? Are going to support Android? Are going to support Windows and Linux desktops? Are you going to support the internet of things? These are all questions to consider when deciding what back-end services to use. 



If you're only supporting Apple devices, you may want to consider CloudKit, an option we'll discuss in more detail below. 


### Complex Vs. Simple Queries


Some tasks, like relational data, are best performed through some sort of SQL database. However others might work better with a document storage type database. Most importantly, you should consider whether you need to aggregate your data or whether you need to create filters.  In other words, do you need to view your data in a lot of different ways to combine your data set. 



Conversely many simple document-based cloud storage options are cheaper.  Therefore, if you're willing to offload a lot of the complexity of a good query over to the device like your iPhone document-based storage like Firebase might be a good option. Additionaly, you could consider caching your complex data for later rather than querying the data each time. Remember, a simple query would need to lookup data with a particular ID only.



You need to ask yourself if you're willing to offload a lot of the complexity of a good query over to the device like your iPhone, or is it more important to have that information on the server. The best backend for your iOS app might not be the easiest to query but the cheapest and easiest to maintain.


### Outside Communication


Besides storage, you should also ask yourself if you will need any outside communication or outside scheduled jobs. This may occur if the user does something that creates data and then you need to be able to access that data even if they have their phone off such as email newsletter, shipping orders. 


### The Expertise of Your Team


This is a big factor because if their expertise is.net, you're probably better off using a Windows back end with an SQL Server and C#. If you're already getting a decent price on Azure, for instance, use it because that's what your team is an expert in. If your team is well versed in Swift, you may want to consider Vapor for your backend. Check out our review of Vapor here for more details.


### User Interface (UI)


We also recommend doing some user-focused design to come up with the kind of data that your users will need. Afterwards, work your way back towards how you would need to store that. For instance, you can start by building out the UI of the app and essentially fake the data to make sure that data is what the customers want and then go back from there. Get your UI taken care of because that's the thing the users are going to see. 



These factors, plus the budget you're working with and the time you have to spend are all factors to consider when thinking about back-end storage. 


## The Options


Once you've asked yourself all the necessary questions, you'll want to start looking at the options that fit your needs and budget. If you feel you need back-end support, you'll need to decide the best option for your app and your user. Here are some options to consider. 


> ...Some of the advantages of hosting your own is the fact that you can customize everything down to the minutiae, I mean you basically have a whole machine that you can work with that is also the disadvantage because the burden is on you to make sure everything is set up correctly wear as a lot of these other services. They pretty much can take care of everything. All you need to do is write your app code and get your database setup.EmpowerApps.Show - Episode 8 - Cloud and Backend Services

### Hosting a Server For Your Backend


The most customizable and robust option is just to host your own server. You can buy your own server and host it at a site with a virtual machine like AWS EC2, Linode or DigitalOcean. Linode is an affordable option at $5/month. However, you may not want a complete server both due to the cost but also the need for maintenance.



Kubernetes is owned by Google but is open source and even AWS, Linode and Digital Ocean also host Kubernetes instances. This is a popular option for good reason, especially in the dev-op space. 



If you're starting from scratch and want something to play with, Heroku is a great option. Their free tier which includes a PostgreSQL database is plenty to start with.



Speaking of PostgreSQL, you’ll need to set up your own database, as well as other server software. Here are some specific options to consider:


### Databases

-   PostgreSQL
-   MySQL  
-   MariaDB  
-   MongoDB  
-   SQL Server 


You’ll need something to server content whether it’s images, JSON, or HTML:


### Server Software

-   IIS  
-   Nginx  
-   Apache  


Also consider some other services such as: 


-   Cloudflare for monitoring, caching and CDN
-   New Relic for monitoring and security
-   Supervisor for services


If you're working with a simple MVP or releasing only for Apple,  we would not recommend hosting your own. If you have simple needs go with the simplest solution and then plan on scaling out from there according to the growth of your own needs. 


### CloudKit as Your Backend


One really affordable option worth exploring in more detail is Apple's back-end storage system, CloudKit. CloudKit is fairly simple to use if you're sticking with iOS. It comes with push notifications and is completely native to Apple. If you're running a Mac app or an iPad app or using an Apple Watch or Apple TV, it's really easy to use. It also includes a JavaScript component for the web. It is an easy yes is if you're just going to target Apple devices. When using CloudKit, you would be fine offloading some stuff onto the iPhone itself if the data isn't too complex. 



If you absolutely need to run outside backups or outside cron jobs and can't do it on an iPhone or an iPad, then you might want to consider another option. 


### Firebase as Your Backend


Another popular option is Firebase. Firebase is the most popular mobile back-end as a service not only because of price but also because it's available on a plethora of devices. But beware, on the surface, it seems really appealing but we would hesitate when recommending it for projects that might scale. If you want to learn how to do real-time database integration in a web browser and you don't want to introduce apps where you have to create a lot of extra code in order to access data, Firebase is a great way to go about it. 



But, while it is popular, after some research it appears that not a lot of enterprise-grade companies are relying on it. We recommend using it for very very simple situations where you have data that is not going to change in structure over time, data that's generally flat, and when you don't have to do lots of complex queries. Really study the limitations before you jump into it as it may not be a good fit for what you are looking for. 


## Final Tips


We know we're leaving you with a lot of information, so as a final tip, we wanted to add this piece of advice--when considering any storage solutions, check to see if there are any big companies using it. The best backend for your iOS app needs to be something that's rock solid and stable and gets a lot of support, just check out what the big guys are doing. You can be sure that the companies with a lot of money to spend will have taken the time to research and vet these solutions so you can consider anything they are using, a little bit safer than an under-researched option. 



Typically they'll go with one of the big three: AWS, Azure, IBM. Or, they'll decide to host their own. 



Whatever you choose, remember, if you need to pivot, do it early. Don't do it when it's too late. If you feel like your data isn't a good fit for whatever you end up, make the change as quickly as you can because you're not going to want to be burnt out by constantly trying to get your data to fit in particular space.



Want even MORE info? Check out the entire conversation here and subscribe to our newsletter to stay informed.