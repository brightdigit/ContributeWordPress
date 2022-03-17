---
title: flatMap, Double Optionals, and Functional Programming
date: 2020-04-07 10:20
description: It seems there's some confusion when it comes to flatMap and Optionals.
  In the end, using flatMap correctly will make your code easier to read.
tags: functional programming, optionals
featuredImage: /media/wp-images/learningswift/2020/04/Untitled.png
---
A while ago [I did an article on the basics of
**Optionals**](https://learningswift.brightdigit.com/understanding-optionals-in-swift/)
and how they work in Swift. However, it seems there's some confusion as
to how one particular method works in Swift when it comes to a
collection of **Optionals**: *flatMap*.

With all the talk regarding *flattening the curve*, today I want to
explain exactly what it means to flatten in the context of functional
programming. Additionally, it not only can be used on **Arrays** but
single **Optionals** as well. In the end, using them correctly will make
your code easier to read.

## flatMap vs map and Generic

Before we dive into what ***flatMap*** does, let's talk about **what
flatten actually means**. Most importantly, *flatMap* is typically a
*map* coupled with a *flatten* operation. The flatten operation
typically is used in the context of **Generics**, such as **Arrays**,
**Promises**, **Publishers**, and even **Optionals** (*remember
Optionals are Generic enums*).

Let's create our own Generic to show how this would work:
```
struct Foo<Value> {
  let value : Value
}
```

Here's a simple Generic `Foo` which contains a value. Therefore, let's
add a simple map function in case the developer wants to convert the
value into something else:
```
extension Foo {
  func map<Output>( _ callback: (Value) -> (Output) ) -> Foo<Output> {
let output = callback(self.value)
return Foo<Output>(value : output)
  }
}
```

Now we have simple map method which works similar to others, where the
developer can convert the `Foo` into some other type. For instance:
```
let firstItem = Foo(value: 3.0)
let secondItem = firstItem.map{ $0.description }
```

In this case, we have a `Foo<Double>` which is converted into a
`Foo<String>` using our new map function.

However there are instances where this can cause issues.

### Arrays of Arrays

The simplest case where map doesn't quite do what you want would be when
you need a flat list. For instance, let's say you want to get a flat
list of books from their authors:
```
struct Author {
  ...
  let name : String
  let books : [String]
}
```

Then you have a list of authors and their books in JSON:
```
[
  {
"Franz Kafka": [
  "Stories",
  "The Trial",
  "The Castle"
]
  },
  {
"Fyodor Dostoevsky": [
  "Crime and Punishment",
  "The Idiot",
  "The Possessed",
  "The Brothers Karamazov"
]
  },
  {
"Leo Tolstoy": [
  "War and Peace",
  "Anna Karenina",
  "The Death of Ivan Ilyich"
]
  },
  {
"William Shakespeare": [
  "Hamlet",
  "King Lear",
  "Othello"
]
  }
]
```

Unfortunately, map would only return an **Array of an Array** or
**Jagged Array** of books (i.e. `[[String]]`):
```
let authors : [Author] = ...
let books : [[String]] = authors.map {
  $0.books
}
```

As a result, we get:
```
[
  [
"Stories",
"The Trial",
"The Castle"
  ],
  [
  "Crime and Punishment",
  "The Idiot",
  "The Possessed",
  "The Brothers Karamazov"
   ],...
```

However, this is where a ***flatMap*** would be useful:
```
let authors : [Author] = ...
let books : [String] = authors.flatMap {
  $0.books
}
```

Now, rather than returning an Array of Arrays, *flatMap* automatically
flattens the result. Not only does this work with Arrays but other
**Generics** as well. A great example of this is in use with
asynchronous methods.

If you are interested in learning more about how SwiftNIO and Google
Futures does this with Promises and Futures, check out my [article on
asynchronous programming
here.](https://learningswift.brightdigit.com/asynchronous-multi-threaded-parallel-world-of-swift/)
Additionally Combine, which is frequently used with SwiftUI, contains a
[map](https://developer.apple.com/documentation/combine/publisher/3204718-map)
and
[flatMap](https://developer.apple.com/documentation/combine/publisher/3204712-flatmap)
for its Publishers as well.

Besides Arrays, Promises, and Combine Publishers, there was one other
Generic we are forgetting to cover which often can cause issues. If you
have run into the elusive `Type??` value then you have probably run into
an instance where ***flatMap*** should be used on **Optionals**.

## flatMap and the elusive Double Optional??

So let's say we have a generic function which returns an optional:
```
func maybe<T>(_ value: T) -> T? {
  Bool.random() ? value : nil
}
```

Then you've created a optional value:
```
let optionalValue : Int? = Int.random(in: 0...10)
```

Next, you decide to call that function which returns an optional on the
option value and you end up with something that makes very little sense:
```
let optionalOptional : Int?? = maybe(optionalValue)
```

What is an `Int??`...?

As stated earlier **an Optional is really another Generic type.** Here's
a small snippet of the Generic Enumeration behind the scenes:
```
public enum Optional<Wrapped> {
case none
case some(Wrapped)
}
```

As you can see the '?' is simply syntactic sugar. So for instance an
`Int?` is really an `Optional<Int>`. Therefore, we can surmise that an
`Int??` is really a `Optional<Optional<Int>>`.

Therefore, we need to make sure that our result is flattened in order to
use it. Luckily, **Optional** provides a ***flatMap*** function as well.
For this reason, we can use
[`Optional.flatMap`](https://developer.apple.com/documentation/swift/optional/1540500-flatmap)
to fix our result:
```
let betterOptionalValue : Int? = optionalValue.flatMap(maybe(_:))
```

By using ***flatMap***, it flattens the result to return a *single*
**Optional**. It's important to note, that `optionalValue` does not
contain the `?` suffix since we want to call ***flatMap*** on
`Optional<Int>` as opposed to Int. Likewise, **Optional** also contains
a map function for when your method will return a non-optional value and
does not require flattening.

### flatMap, parsing, and conversion

There are a few use cases where ***flatMap*** on an **Optional** are
useful. For instance, when you are parsing a value, there are cases
where you wish to throw an error depending whether the value is invalid
or missing (i.e. `nil`). However in some instances, you don't care
whether the value is invalid or `nil` and want to just return `nil` if
it fails. In this case, ***flatMap*** fits perfectly well:
```
func parse (_ rawValue : RawType) -> ParsedType?

let parsedValue = optionalRawValue.flatMap(parse)
```

For instance, parsing UUID from a String, rather than:
```
let uuid : UUID?

if let uuidString = dictionary["VCS_UUID"] {
  uuid = UUID(uuidString: uuidString)
} else {
  uuid = nil
}
```

... we can use:
```
let uuid = dictionary["VCS_UUID"].flatMap(UUID.init(uuidString:))
```

Besides parsing, I've used ***flatMap*** in instances where I need to
convert a successful `Result` or value to a SwiftUI `View` as well:
```
  var iconImage: some View {
return self.icon.flatMap { icon in
  guard case let .image(name) = icon else {
    return nil
  }
  return name
}.map {
  Image($0).renderingMode(.template)
}
  }
```

In this case if the `self` `View` contains an `icon` with the case
`image` then use the `name` and create templated `Image` for the `View`.

While there are instances where ***flatMap*** is useful, more often than
not you may just wish to filter the **Optional** results from a map
operation. This is where ***compactMap*** comes in.

## flatMap vs compactMap

In many instances, you probably want simply remove Optionals from your
Array or having a map return only non-Optional values. Before Swift 4.1,
there was only one method for doing this as well as the traditional
***flatMap*** mentioned previously. Unfortunately as stated in [the
implemented
proposal,](https://github.com/apple/swift-evolution/blob/master/proposals/0187-introduce-filtermap.md)
this caused much confusion. Therefore ***compactMap*** was added in
Swift 4.1.

While ***flatMap*** concerns the returning of a flat Array of values,
***compactMap*** is specifically for instances where you need to make
sure the Array returned contains no Optional values. In effect, **if the
closure for each item can return multiple items then a flatMap is right;
otherwise if the closure can return either no items (i.e. nil) or one
then compactMap makes the most sense.**

So for example, if we have `Node` struct and an Array of optional Nodes:
```
struct Node<Value> {
  let value : Value
  let children : [Node<Value>]
}

let items : [Node<Int>?]
```

Therefore, let's see what happens when we use a combination of
***flatMap*** and ***compactMap*** in various ways:
```
// returns an array with no Optionals
let array : [Node<Int>] = items.compactMap{ $0 }

// returns and array of array of Nodes
let arrayArray : [[Node<Int>]] = items.compactMap{ $0?.children }

// assumes same as previous compactMap and issues a warning
let arrayArrayWithWarning : [[Node<Int>]] = items.flatMap{ $0?.children }

// returns flat array of Nodes from children
let flatArray = items.flatMap{ $0?.children ?? [Node]() }

// returns flat array of Nodes from children as well
let flatCompactArray = items.compactMap{ $0 }.flatMap{ $0.children }
```

Most importantly, ***flatMap*** is not supposed to return a `nil`
(otherwise the compiler assumes it's ***compactMap*** and issues a
warning). Therefore, you can either use [the nil-coalesce
operator](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID72)
to return an empty Array or use ***compactMap*** beforehand to ensure
there will never be `nil`.

## flatMap and flattening the Optionals and Generics

In this article, you've learned a few key points with regards to
***flatMap*** and its relationship to **Generics** and specifically
**Optionals**:

-   The term ***flatten*** in functional programming means to remove a
secondary generic into a one-dimensional result such as returning a
`Value?` rather than `Value??` or `[Value]` rather than \[`[Value]]`
-   ***flatMap*** is to be used when you have an Array of Arrays and
wish to flatten those Collections into a simple one-dimensional
Array
-   Use ***flatMap*** when you are returning a result of the same
**Generic** type as opposed to map when you are just returning a
value such as a **Promise**, **Future**, or **Combine**
**Publisher**
-   ***flatMap*** is important for **Optionals** in removing **Double
Optionals** (i.e. `Type??`) from your code
-   **flatMap** is also useful for **Optional** when you are mapping an
**Optional** value and **don't need to distinguish between a nil or
invalid input value**
-   ***compactMap*** is specifically for the removing nil results from
an one-dimensional array
-   If a ***flatMap*** closure can return nil, return an empty Array
instead

Feel free to reach out if you have any additional questions [on Twitter
**@leogdion**](https://twitter.com/leogdion) or signup for the
newsletter below to get the latest tutorials and guides on Swift
development.