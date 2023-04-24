---
title: What is Mobile System Design?
date: 2023-04-24 00:00
description: Mobile system design is about creating guidelines for considering the specs for an app. This is an intro to MSD and how it can help you deliver better code faster.
featuredImage: /media/articles/mobile-system-design/develop-app.webp
---

Mobile system design is about creating a set of guidelines for considering all the specifications for a mobile application. This includes the development and design for both the app’s front and backend elements.

[A quick search](https://duckduckgo.com/?q=mobile+system+design&t=h_&ia=web) shows that the term is often associated with questions in developer job interviews, seeing how a candidate considers the design and architecture of the apps they make.

This definition is meant to capture not only what you need to know in an interview but how to use it as a cornerstone of great software development.

I was inspired to write about this after recently chatting with [Tjeerd in 't Veen](https://twitter.com/tjeerdintveen?lang=en) on the [EmpowerApps podcast](https://brightdigit.com/episodes/142-mobile-system-design-with-tjeerd-in-t-veen/). Tjeerd is a fellow Swift developer and the author of Swift in Depth and an upcoming book called [Mobile System Design](https://tjeerdintveen.gumroad.com/l/mobile-system-design-tactical-engineering). Tjeerd generously gave me a peak at the book, and I think we should all be excited.

Tjeerd’s goal for his new book is to help developers and engineers make better mobile apps by using design-level techniques and changing how we think about the code we make.

In our chat, Tjeerd shared a few powerful ideas that can be hugely helpful for mobile developers of all kinds, especially those working with iOS and Swift. This is an introduction to mobile system design, some of those ideas – why it’s such a powerful concept and how it, and Tjeerd’s book, can help you deliver better code faster.


## System Design is about asking questions

When you think of the more general concept of [system design](https://en.wikipedia.org/wiki/Systems_design) in software development, it’s common to associate it with backend development – how the software’s architecture, components and data for an application are designed and work together to meet user requirements.

But this definition is incomplete. It glosses over the thousands of little decisions made by both developer and customer that go into making software features. As developers, we all create software, but how we approach this task can vary enormously.

So how do you capture all of those decisions in the system design of your app?

In our conversation, Tjeerd broke down the process of finding and defining these decisions using a few key concepts: one of which is **asking the right questions**.

> I think the real power… is to really dive deep because if you ask the right questions, you can maybe even skip a couple sprints of work…

You can see this kind of questioning with the concepts of known knowns, known unknowns and unknown unknowns.

These were popularized by [an infamous quote by former Secretary of Defense Donald Rumsfeld](https://www.youtube.com/watch?v=REWeBzGuzCc), but the idea is based on a much older psychology technique called a [Johari Window](https://thedecisionlab.com/reference-guide/psychology/johari-window). It is a useful idea for mapping out and becoming aware of the thousands of decisions and connections when building an app:



* Decisions you can figure out right at the start of development (Known Knowns);
* Decisions that you know will need to be made but don’t have the resources to resolve right now (Known Unknowns);
* And leaving space for the possibility that there will be decisions about the app that will need to be made that you aren’t aware of or can’t plan for (Unknown Unknowns).

As an example, it is common for mobile developers to get a feature request as part of a designer’s vision for a user interface. UI designs can be misleading – they can hide what should be happening underneath. However, customers often treat them this way, and [you often have to help customers understand that they are best used as tools to better understand user requirements.](https://brightdigit.com/articles/4-mistakes-design-ios-app-ui/)

**Asking the right questions helps clarify and resolve what the feature needs while leaving room for issues with the feature that will only become apparent later.**

You could go about this by asking questions looking for the boundaries of the user needs: what would cause the feature to fall outside of the designer’s or customer’s vision and fail to meet the user’s needs?

Additionally, you could focus on how unexpected errors are handled. This might include questions like:



* What happens if the feature simply stops working for no reason?
* How will the backend handle that error and let the user know?
* If the error is recoverable, how do you tell the user how to fix it?
* And what happens if a partial error occurs, where only most of a feature works correctly?


> youtube https://www.youtube.com/watch?v=FRMeny1gsqY


## How to get started with Mobile System Design

Below are some tips and tools you can use to integrate mobile system design more fully into your projects. This list is not exhaustive but includes some of the most valuable ideas you can read about in Tjeerd’s book when it comes out.


### Diagrams

Tjeerd says diagrams are best for helping everyone know what people are working on, especially if you’re part of a team of more than half a dozen mobile developers. They can be a powerful tool for **building alignment within a team and between the team and the customer**, even if they are not a good way of capturing the details of the work.

Like UI designs, diagrams can be misleading. They are an abstraction or simplification of the ‘truth’ of how your app will work and look. As with UI designs, it is best to make it clear to the customer that using them is a tool to find out what they want.


### Keep Your Backend Synced With Mobile

An effective strategy for ensuring the mobile version of your app keeps pace with overall product development is to focus on integration as early as possible in the development process.

This means focusing development early on making API calls from mobile to the backend, rather than the common tendency in mobile development to focus on integrating with a completed UI design. API calls are one element of app development that can be built in many different ways; by focusing on this element early, it’s easier to make changes and zoom in on making those small, critical decisions about how the app will work.

Not only is making an API call an effective way of sorting what is needed to meet user requirements, but the backend itself also doesn’t have to be fully developed to execute this strategy. 

The goal is to fix any problems between the backend and mobile as early as possible, even while later developing a UI design. This avoids the classic scenario in mobile development where you start making calls late in development, only to realize something isn’t working, then need additional weeks of development to get it mobile-ready.

For example, if you have a screen that needs several types of data. Is it best to be able to retrieve all as one API call? And if you can retrieve all this data in a single format, as you might expect if you’re using a REST API, [what does that mean for the scope and complexity of work for the backend development team](https://brightdigit.com/articles/server-driven-ui-ios/)?


### Demos

Regular weekly demos can be helpful for sharing what different teams are working on – especially if they’re working on the same feature in parallel – and having constructive discussions about the overall system design of the app. They also can be an effective way of sharing ideas.

Demos are also a great tool for [distributed teams](https://brightdigit.com/articles/working-remotely-ios-development). It’s easy enough to create a short video – even if it’s simply a screen recording with the developer talking their way through what’s happening – that makes it accessible for everyone and means you catch watch it later for team members in distant time zones.

For example, during a demo, the team responsible for Android development shows how a specific feature works for their version of the app. This is interesting to the iOS team because it was a way of delivering the feature that they hadn’t thought of. Meanwhile, the backend development team doesn’t like what the Android team has done because delivering it that way makes the API call taxing on the servers.

This has an advantage over traditional meetings or standups in multi-team environments, where it can be hard to understand what’s going on. It's difficult to envision how everyone’s work meshes together. Demos, on the other hand, make discussions more concrete and centered around what team members can easily see and understand.


## Get updated on Tjeerd’s upcoming book

Thank you again to Tjeerd in 't Veen for sharing his ideas and for the privilege of seeing the draft of his book. Tjeerd is still finishing his book at the time of writing, but you can[ sign up here to receive updates](https://tjeerdintveen.gumroad.com/l/mobile-system-design-tactical-engineering) when preorders become available. If you found this topic interesting, I recommend reading the book when it comes out.

Also, if you enjoyed this article and want to keep reading more about interesting ideas in Swift and iOS development, you can check out the latest content on our blog. You can also sign up for our newsletter, where, about once a month, I’ll send you updates on the latest news, tips, and tricks about all things Apple and Swift.
