---
date: 2018-06-04 22:07
---
# WWDC 2018 - Swift 4.2 and  "Random" Changes


With WWDC 2018, Swift 4.2 has introduced new ways to generate and access random values from a collection. Often times, app developers will do this when building games or creating test data. Let's take a look at the old way and the new way to access random items.





## Random Access and Legacy APIs

```swift
arc4random_uniform
```

```swift
UInt32
```

```swift
let minimum = -7.9
```

```swift
let maximum = 12.8
```

```swift
let doubleValue = (Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)) * (maximum - minimum) + minimum
```

## RandomKit and Simplifying Random Generation

[RandomKit is one library](https://github.com/nvzqz/RandomKit)

```swift
let value = Int.random(using: &Xoroshiro.default)
```

```swift
RandomGenerator
```

-   picking random values from an Array
-   shuffling Arrays
-   generating other types like Date, (NS/UI)Color, CGPoint and more

## Swift 4.2 and WWDC 2018

[SE-0202](https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md)

```swift
Double.random(in: -7.9...12.8)
```

[RandomNumberGenerator](https://developer.apple.com/documentation/swift/randomnumbergenerator)

[Array.randomElement](https://developer.apple.com/documentation/swift/array/2994747-randomelement)

## Conclusion