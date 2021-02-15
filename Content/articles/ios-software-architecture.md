---
date: 2020-03-31 06:37
tags: apple-development, iOS development, ios software architecture, software design,
  swiftui
---
# What You Should Know About iOS Software Architecture


You’ve made the decision to build your own iOS app. Therefore, you’ve started out with an idea based on a customer need. Also how the app will meet that need and what it will look like. It’s at this point you should think about iOS software architecture.



Software architecture is the term we use to describe how major components of an app work together. The structure and design of modern software are usually too complex to consider. Therefore, we use the term ‘architecture’ as an abstraction. In practice, ‘software architecture’ means “the parts of the app we need to get right.”



The reason well-planned architecture for your app is critical is that by investing time in planning, it pays off over time. In the end, you create a shared understanding between you and your developers. This includes how they structure and design the app. As a result, you are saving you time and money.



In this post, I cover three essential concepts for good iOS software architecture:


-   Patterns & Practices
-   Code Modularization
-   Code Quality


I’ll be explaining a bit about each, how you can put them in place for your app.


## iOS Software Architecture Patterns


Choosing a certain architecture for your iOS app determines the design of different aspects of your software. Within that, it also determines what kind of design patterns you will want to use. A Pattern in the context of software is a common response to a recurring problem. It uses a common language to outline the elements needed to solve a software challenge.



Patterns are particularly useful when working with a large team of developers. They can make your developers substantially more efficient by using a refined approach to solving problems. Patterns ensure changes to the code are consistent and reduce risk for major changes.



Good use of Architecture Patterns makes it easy for developers to understand the software. In the end that makes it easy to change it. This means new features can be delivered faster, with fewer bugs, and therefore easier fixes.



There are a few architectural patterns that are very useful when making iOS apps:


### Delegation and MVC with iOS Software Architecture


Delegation is a pattern we use in iOS user interface (UI) development for displaying tables of information in an app. The Model-View-Controller (MVC) pattern uses Delegation. Additionally, MVC is the most popular iOS Software architectural pattern for developing Apple apps. This is how it works:


-   A user performs an action within the user interface (ie View).
-   View passes it to the Controller to deal with.
-   The Controller makes decisions about what to do with the action it's been given. If needed, it makes changes to the state of the Model, which will change its data values in response.
-   The Controller then sees these new values and sets them for View.


Delegation allows you to control how the Controller provides both the data and the way that data needs to be displayed to View in the final step. This makes it easy to break apart the functionality of the code to display table information to your user the way you want.


### Protocol-Oriented Programming


This is fundamental to developing any app written in Swift (ie all native apps for iOS). Protocols allow you to group together and separate functionality. Additionally it shows how data and their objects work together.



Protocols are useful tools for creating functionality for your app. Instead of building a whole new object (which you might with other kinds of architecture), you add different protocols until your objects can do what you want. Protocol-oriented programming means using an architecture where you design your app around protocols. This makes it easy to test the different parts of your app and use Test-Driven Development.


### Functional Programming


Functional programming is the idea of having your app work based around information supplied to it and rules it must follow. What this means is you want the app to react to what your user is doing. In contrast other kinds of programming styles, such as Imperative which follow a set of instructions, this can be a challenge. For instance, if there are multiple data sources and multiple views. The result is an app that can adapt to your user’s behavior, which is always a desirable trait in a well-designed app.


### Reactive Programming in iOS Software Architecture


This pattern has become popular with the introduction of SwiftUI, which encourages developers to use functional reactive programming. For this reason, Apple introduced the Combine framework and the Subscriber-Publisher model. Specifically, this allows you to sort and filter values into your UI.  Additionally, it's also used with Model-View-ViewModel, which removes the Controller in the MVC pattern mentioned above. With Model-View-Model, the Controller is replaced with a ViewModel. Conversely, the ViewModel automates how the Model can be rendered directly into the View by making changes to the Model data and reacting accordingly. This is useful for iOS apps that need to use a resource library that isn’t written in Swift. It allows you to bridge from another programming language into Swift.


## Why Code Modularity Matters in iOS Software Architecture


Another key component of great architecture is modularity.



Modularity is the idea that different parts of your app should be able to work independently of each other. As a result, this makes it easier to both test and reuse pieces of code in different parts of your app. Additionally, makes it easy to use the same piece of code for different platforms, so your iOS code could work on macOS too.



There are three ways I recommend for creating modularity in iOS app development:


### Framework Targets


In Xcode (the development environment for macOS), Framework Targets are a way to easily move your app’s code from the testing environment where it was built to the production environment your users can see. Ordinarily, you have to swap out all the URLs and APIs from the testing version of your app to the production one. With Framework Targets, this is done automatically.


### Projects and Workspaces


You have a specific piece of code that doesn’t fit into an existing framework but might be used in many apps. A way to deal with this is to have more than one project and workspace. This allows you to organize pieces of code like this and show how they are related to different development projects.


### Swift Packages


The newest and simplest way to achieve modularity. Although limited to Swift and not compatible with older apps, Apple is encouraging a shift toward using only Swift for new apps. As a result, this means Packages will likely become the default to create modularity for iOS apps. If you are interested in learning how to use Continuous Integration with your Swift Packages, check out our developer article here.


## Why Maintaining Code Quality Matters


This isn’t so much about app architecture as it is the ability of other to maintain your code. If you have high-quality code, it will make development faster, easier, and cheaper.



There are a few are great ways to ensure high-quality code:


### Test-Driven Development


I recently did a piece about Test-Driven Development (TDD), which you can find here. Committing to doing good testing and setting up a good testing environment is one of the most powerful things you can do to make your code top-notch.


### Ensure Good Code Coverage


Code coverage, measured as a percentage, refers to how much of your app’s code is executed during testing. A high degree of code coverage indicates a low number of possible undetected bugs in your app. This is a great measurement for determining code quality, although you shouldn't be too strict about it. While it’s obviously great if you reach 100% coverage, it might come at a cost when there are more important things you could be doing to serve your users.


### Complexity


In software development, there are two kinds of complexity we want to observe and measure:



Cyclomatic Complexity – this metric looks at the number of linear paths it is possible for data to take through your app’s source code. While there are going to be times when it's necessary to have many paths, you generally want to limit this kind of complexity. The reason is that more paths mean needing more test cases to make sure they all work, and more paths mean more opportunities for bugs.



Cognitive Complexity – this metric simply refers to how easy it is for people to understand your code. Easy-to-understand code is always going to be easier to maintain. This is especially true if the person who wrote the code and the person maintaining it are different people.



Overall, keeping your complexity low by limiting file and function length means adding features and fixing bugs takes less effort.


### Code Reviews


A code review is when someone other than the code’s creator reads the code, looking for errors or anything unclear. While simple to do, this often gets missed because it takes time to sit down and review code someone else has written —time you might feel you don't have. Having someone review what you’ve written is a great way of spotting mistakes and ensuring better-quality code.


### Continuous Integration


This is something I’ve written about recently, explaining what Continuous Integration (CI) is and why it’s important.  If you are able to deploy the code frequently, it means you can deliver features more rapidly. Additionally, if there are problems or bugs, you will discover them faster and will be easier to fix. Therefore, using CI is a great way to shorten the time it takes to get feedback from your users.


## The Components of Good iOS Software Architecture


By thoughtfully choosing an architecture for your app, using effective patterns and modularity, as well following good code quality practices, you will find:


-   bug fixes become easier;
-   adding new features becomes straightforward;
-   your app becomes easier to test and maintain; and,
-   your developers will have an easier time understanding the code.


I believe these are things we should all try to observe. You’ll find it not only improves the morale of your developers, but it will also save you a lot of time and money in the long term.


## Want more about iOS software architecture on how to create better iOS apps?


If you want to learn ways to save time and money and make smart decisions about developing an iOS app for your business, I invite you to sign up for my newsletter. I will let you know when I put out new content like this and if there are important things you should know.