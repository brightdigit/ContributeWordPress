---
title: WWDC 2018 - Swift 4.2 and  "Random" Changes
date: 2018-06-04 22:07
description: With WWDC 2018, Swift 4.2 has introduced new ways to generate random
  values and access random values from a collection. Included with Xcode 10, there
  is access to generating random numbers of various types and accessing items from
  collections.
---
With WWDC 2018, Swift 4.2 [has
introduced](https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md) new
ways to generate and access random values from a collection. Often
times, app developers will do this when building games or creating test
data. Let's take a look at the old way and the new way to access random
items.

## Random Access and Legacy APIs

In the beginning, Swift was dependent on old system-level C libraries to
generate random numbers. On Apple devices, this is done through the
Darwin function `arc4random_uniform`. While it does do what you want, it
requires a lot of work for types besides `UInt32`. For instance if you
need to build a floating-point number, you would need to:

    let minimum = -7.9

    let maximum = 12.8

    let doubleValue = (Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)) * (maximum - minimum) + minimum

This has led several developers to build packages to simplify this
process.

## RandomKit and Simplifying Random Generation

[RandomKit is one library](https://github.com/nvzqz/RandomKit) which has
done a great job simplifying that. Each simple type has a static
function for generating a value based on a type of generator supplied:

    let value = Int.random(using: &Xoroshiro.default)

A generator implements the `RandomGenerator` protocol which provides the
implementation needed to generate a value. RandomKit also supplies
methods for:

-   picking random values from an Array
-   shuffling Arrays
-   generating other types like Date, (NS/UI)Color, CGPoint and more

## Swift 4.2 and WWDC 2018

Proposal [SE-0202](https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md) seems
to be fixing a lot of the inconsistencies which come with random
generation and access across operating system (Linux vs macOS) as well
as simplifying the API. It also seems to be taking an approach similar
to RandomKit. For instance to generate a random Double within a range,
all that needs to be done is:

    Double.random(in: -7.9...12.8)

No more conversions or calculations need to take place. Like RandomKit,
a
[`RandomNumberGenerator`](https://developer.apple.com/documentation/swift/randomnumbergenerator)
can be supplied as an argument which customizes the way the number is
generated. Also like RandomKit, a random element can be selected with
[`Array.randomElement`](https://developer.apple.com/documentation/swift/array/2994747-randomelement).

## Conclusion

It seems like a majority of the improvements which were needed for
random generation and access have been implemented. There is still room
for more complex libraries like RandomKit and the hope is that they
implement these new APIs in the future. In the future it's best to use
the new APIs and avoid needed the legacy APIs for random number
generation in your app or tests.