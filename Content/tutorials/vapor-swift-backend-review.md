---
date: 2019-03-19 07:44
---
# Vapor - Swift Choice For the Back End


Back in February, I did an episode of my podcast where I gave an overview of different backend options when developing a mobile application. In short, when looking for the right option, there is a plethora of choices. For instance, for Swift developers, Vapor has become an increasingly apt choice. Therefore, I decided to deep dive into Vapor and whether it is really a viable choice.


## A Plethora Of Choices


Looking at the landscape of back end choices can be rather confusing. In the end, it really depends on team’s skillset. For instance, if you’re using JavaScript to build your web and mobile applications, Node.JS makes sense. On the other hand, if you are .Net developer team, Web API makes sense. Moreover, if you are particularly skilled with PHP, Python, Ruby, Go, etc..., you should stay within your comfort zone. 



However for single developers and developer teams (such as me) which focus on Apple products, there isn’t a dedicated framework for server-side applications. Therefore, the closest option is CloudKit, which is good for data storage but lacks options such as:


-   No support outside of web and Apple devices
-   No support for complete backups
-   Locked into the CloudKit data model for relationships
-   No Cron Jobs 


However there are other options to remain developing in Swift on server.


## Vapor - Swift for the Server


Since Swift was open sourced in late 2015, compatibility for other operating system has been added. One of the first teams to move Swift to the server was the Vapor team. Since the release of version 3.0 in May 2018, interest has grown.



In this article, I will review Vapor and cover:


-   Ease of Installation and Deployment
-   Developing For Vapor
-   Database Support
-   Event-Driven Async API


Therefore, let’s begin by talking about how easy it is to get started.


## Getting Started with Vapor


In this article I recently published, I showed how to get started by installing Vapor on your Mac and Ubuntu as well as services like Heroku. In short, I found the process to be pretty simple and effective. That is to say, it is no more complex then any other web framework. 



For instance, on the Mac, developers can use Homebrew, which is fairly common, to tap the Vapor repo and install. After you have access to the Vapor CLI tool which includes a subcommand for setting up your Heroku application with the Vapor buildpack. 



Likewise on Ubuntu, you add the apt repo for Vapor and install via the apt command. Having done that, you can easily use a combination of a process monitor and an http server to proxy the server. 



If you are interested in more details on this process, check out this article which deep dives into Vapor and setting up for macOS, Heroku, and Ubuntu.


## Developing with Vapor


Having installed Vapor, the next part of the procedure is developing the app. As a result, the IDE is very important. 


### Developer Tools with Vapor


In spite of its issues, we can still develop in Swift with Xcode. However, since there are command line tools to build a Swift application and a developer could choose their own tool. At the present time, the real limitation is that Swift in general is only supported on macOS and Ubuntu. That is to say there is no support for other Linux or Unix operating systems as well as no support for Windows. However, the community is certainly moving forward with extending support in those areas. Similarly, the community has provided plenty of packages.


### Third Party Support for Vapor


Node.js has npm, Ruby has gems, C# has Nuget, Python has pip and Swift has the Swift Package Manager. Generally speaking, the Swift Package Manager or SPM has been slowly adapted as the premier dependency manager. In the long run while Cocoapods and Carthage still reign in the area of iOS development, it is inevitable that SPM will dominate in the future. Having discussed outside support for Vapor, let’s discuss what Vapor (and its package support currently).


### Database Support and Fluent ORM


My experience working with various ORMs are varied. Being that I’ve worked with Entity Framework in C# and Sequelize for Node.Js, I have some experience. Having said that, what makes these work so well is the ability to use lambdas and implement many functional programming paradigms. As a result, since Swift has that ability, using the Fluent ORM is fairly easy to learn.



Equally important is its support of various database software. As of now, there is support for:


-   MySQL
-   MariaDB
-   MongoDB
-   PostgreSQL
-   SQLite


As can be seen, there is sufficient database support. Not to mention, but its support for those databases is fairly deep. 


### Deep Database Support


For instance, I ran into an issue where I was searching for objects by title - a fairly simple keyword search for a REST API list operation. However, what I didn’t realize was that many titles have diacritcs, specifically accents. In other words if a user searches for something with an e if a title has an é, that result won’t show up. In spite of this, there is code in PostgreSQL to unaccent a string, such as there is a way to do lower or upper case transformation. Having adding the necessary functions, I am able to call the function with Fluent’s API:


```swift
let columnId = PostgreSQLColumnIdentifier.column("Game", "title")
let column = PostgreSQLExpression.column(columnId)
let arg = GenericSQLFunctionArgument<PostgreSQLExpression>.expression(column)
let args : [GenericSQLFunctionArgument<PostgreSQLExpression>] = [arg]
let expression = PostgreSQLExpression.function("unaccent", args)
```


As shown above, this may not be ideal, but it works. In addition, you always have access to lower level, direct SQL code using the Database Kit API. However what truly makes Fluent ORM so robust is the use of SwiftNIO async API. 


### The Future of Programming


In short, SwiftNIO, the event-driven network application framework started by Apple, provides a set of types for handling callback-based asynchronous APIs such as database queries. 





In addition, Vapor provides a set of functionality which make complex queries accessible in code. That is to say SwiftNIO and Vapor provides futures and promises as well as and API for dealing with multiple objects such as transformations. Despite this, the most significant friction I have found was the combination of Xcode and Swift compiler delivering misleading error message. At present, this is very common complaint with Swift and Xcode in general but it is certainly an issue worth mentioning. Likewise, I used the same async API when making various HTTP calls and found it very reliable. 


### The REST of the API


As opposed to URLRequest, the HTTP API is promise/future friendly which is nice improvement. However, any async call in Swift can easily be made friendly. In addition to the Fluent ORM, HTTP, and Async APIs, I did make use of the Auth, Crypto, and Routing APIs. In short, all worked flawlessly. 



For instance, serialization from JSON or Multipart encoded data works without much needed implementation. That is to say, if you are implementing a type which correctly implements Codable then there should not be much extra effort in creating a robust REST API. However, if you do need to customize your type to use Codable, I highly recommend my post on improving how you decode JSON. 


## Vaporware or Swift-ly Switch?


To sum up, Vapor is already a healthy framework to start any new server-side application. However, I would never recommend anyone rewrite their whole application in this. 



Overall, if you are already Swift team and you are looking to move some if not all your code to a new framework, I’d highly recommend taking a look Vapor as your first choice. Not to mention, if you are using a web framework that is becoming a burden and enjoy the versatility of Swift, going with Vapor would be good fit. (Besides that, the only caveat I’d make is that if you are building for the enterprise I would look into Kitura, the IBM team has plenty of experience in that space and Kitura seems more focused in those regards.)



On the other hand, if you are using a web framework which has performed well for your team and most of your development is not in Swift, then switching to Vapor does not make sense. Lastly, I just wanted to point out, that Vapor works well outside of an Apple client application. For example, I successfully built a web application using VueJs and Axios and had no difficulty when it came to server-client communication. If you are interested in getting started, subscribe to this newsletter, to get started guide as well as updates on how to develop a robust application with Vapor.