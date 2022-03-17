---
title: How to avoid iOS app failure with Test-Driven Development
date: 2020-01-06 07:57
description: Test-Driven Development or TDD is a way to ensure code is of good quality
  and will do its job. A guide to understanding and using TDD to make better apps
tags: tdd, test driven development, unit testing
featuredImage: /media/wp-images/brightdigit/2019/12/f16515a9-43da-44fe-862d-43ac3eafad23.png
---
It is surprisingly easy to build the wrong thing in iOS app development.
For instance we can easily build something that doesn’t meet client or
customer needs. On the other hand, It’s also fairly easy to build the
right thing, but have it not work properly. A simple, reliable way to
avoid this is by using **Test-Driven Development**.

<figure>
<img src="/media/wp-images/brightdigit/2019/12/freestocks-org-40k6ZqbsXuo-unsplash-1024x683.jpg" class="wp-image-1862" />
</figure>

Test-Driven Development, or TDD, is a way to try to ensure good quality
code which will do the job it’s supposed to. This post is for anyone
that employs or manages iOS developers and want to deliver better
software for their customers. 

We’ll be explaining what TDD is, how it works, the advantages are of
using TDD, and what you can do to empower your developers to meet
customer needs.

## What is Test-Driven Development?

Traditionally, requirements for a piece of software are given to the
developer. Next the developer then writes what they believe is effective
code to meet those requirements. Therefore with TDD, each component of
the software is tested to make sure they do what they were designed to
do. Specifically, this is known as **Unit Testing**. In this case, the
*unit* is the smallest testable part of any software. Such as in iOS
development, it's typically a *method* or *function* which contians a
set of instructions.

Here is a simple example of a function in Swift, adding two numbers
together:

    func add (firstNumber : Int, secondNumber: Int) {
    return a + b 
    }

In order to test this function, a typical unit test might look like
this:

    func testAdd () {
    // test that the result is as expected
    XCTAssertEqual(add(0,0), 0)
    XCTAssertEqual(add(1,-1), 0)
    XCTAssertEqual(add(100,200), 300)
    XCTAssertEqual(add(-10,-20), -300)
    }

Test-Driven Development inverts this process by using a *test-first*
approach. So long as the requirements are provided, the developer always
first writes the unit tests. Afterwards, the developer then writes the
code necessary to succeed at the tests. As a result, the code should
always meet the software requirements and generally be simpler and
‘cleaner’. Additionally, the developer only wrote code for what was
actually needed. Therefore, you end up with effective software that
meets your customers’ needs and has little that they don’t need.  

## What makes Test-Driven Development Great for iOS Development

There are a number of benefits to using *Test-Driven Development* when
building an iOS app. By and large, this broadly fits into two
categories: **Higher-Quality Software** and **Easier to Maintain**.

### Higher-Quality Software

One of the realities of software development is that the code for a
piece of software will likely change. Typically, as both the developer
and the business clarify and improve their understanding of the business
problem they are trying to solve, the application needs to update
accordingly.

When you have to write unit tests before you write the code, it forces
you to decide what features you really. In practice, this means that the
requirements need to have a high-degree of detail. As as result, so do
the tests can be written based off them. Therefore, it is also almost
guaranteed that problems will become clear very early forcing you to
solve them.

*TDD*, by its nature, focuses development on ensuring that the app works
the way it was designed to. Additionally it will give the same
experience regardless of which iPhone model you might be using.

The result of this is that final app will have far fewer bugs than other
testing approaches. Consequently, this means more flexibility and easier
maintainability of the code. As a result, this makes it easier to add
new functionality later.

### Easier to Maintain

So, you have an app that does exactly what it was designed to do, has
fewer bugs, and is more flexible. For this reason, it naturally makes
your app easier to maintain and update.

What this looks like on a technical level is that *TDD* forces
developers to simplify their code. For one thing, if the code needs to
pass a large number of unit tests, the developers would only write
enough code to pass each test. As a result, A good developer using TDD
will also structure their code in a way that’s easy to modify. In the
event a unit fails to pass a test, it’s as easy to go back and fix
whatever was causing the failure.

As a result, the developer will have to spend less time rewriting,
reorganizing (known as refactoring), and debugging your app’s code.



## How you can get started with Test-Driven Development?

How then, can you as a business leader or manager can enable the use
**Test-Driven Development** with your developers?

One of the most important things to start with is management that
supports the new practice. **TDD is not a panacea, and come with
costs.** To get the best results, a business should think about having
its developers learn TDD as an investment in its future. While it can
vary, allowing for a learning period of 2-4 months is a good start. 

First, for most developers, TDD is not easy to learn if they’ve used a
test-first approach to building software. The biggest challenge will
usually be a need to strengthen a developer’s ability to map out the
complex array of functionality for an app in the form of specific,
planned tests, and their ability to question and review these tests if
necessary. This is usually a steep learning curve.

<figure>
<img src="/media/wp-images/brightdigit/2019/12/alfons-morales-YLSwjSy7stw-unsplash.jpg?fit=640%2C376&amp;ssl=1" class="wp-image-1868" />
</figure>

### TDD Resources

A good start might be reading the seminal text of TDD: [Kent Beck’s Test
Driven Development: By
Example](https://www.amazon.com/exec/obidos/ASIN/0321146530/ambysoftinc),
the first authoritative text on the subject. Another good book,
specifically for iOS and developers using Swift is [iOS Test-Driven
Development by Tutorials, by Joshua Greene and Michael
Katz](https://store.raywenderlich.com/products/ios-test-driven-development),
which features a lot of examples and tutorials for you to master the
basics of TDD. On a more technical level, we cover a lot of TDD-based
scenarios and tutorials on [Bright Digit’s developer
blog](https://learningswift.brightdigit.com/).

Additionally, unit testing requires code to be written in order to carry
out the testing. In TDD, this test code is just as important as the code
of the app itself. Therefore, the code needs to be readable and with the
minimum amount of code possible. As a result, this will usually
translate into a lot of work, right at the start of a software project.
Additionally. your deadlines and budget ideally should be configured to
anticipate this reality. However, there will be less maintenance and
more flexibility in your code in the long run. And as a result, it will
result in more cost savings in the future.

> transistor https://share.transistor.fm/s/eddb8632

## Do you need an app that does what it is designed to do?

At Bright Digit, we have lots of experience using Test-Driven
Development and the range of tools and other practices you can use
building native apps for iOS. We work with you to make you end up with
an app that delights your customers,  while being sufficiently tested to
make sure you have as few problems as possible. If that sounds like the
experience you want to have in developing a successful app, email
info@brightdigit.com and tell us about your ideas!