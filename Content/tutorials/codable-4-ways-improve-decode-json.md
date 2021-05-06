---
date: 2019-02-21 03:17
---
Codable, introduced in Swift 4, provides a convenient and easy way to
encode and decode JSON. **However, not everything works out of the
box.**

For instance, let\'s look at this [JSON
file from Twitter](https://github.com/brightdigit/advanced-swift-codable/blob/master/advanced-swift-codable.playground/Resources/twitter.json).
As a result of the way the JSON decoder works, we see:

-   **Quoted and Standard Tweets use similar but not exactly the same
    fields.**
-   **Keys which get translated to property names don\'t follow Swift
    conventions.**
-   **Dates are not in the standard accepted format.**
-   **Colors are not in a format accepted by any Color class** (UIColor,
    NSColor, etc\...)

As a result of this, we are going to learn how to setup your Codable
types for some of those special cases. Specifically, we are going to
look at:

-   [**Using Protocols with Codable types**](#protocols-with-codable)
-   [**Different Property Names and Keys**](#custom-property-names)
-   [**Dates in Property Values**](#custom-property-values)
-   [**Property Values for Custom Types**](#custom-decoding)

To follow along you can look at [the Xcode playground for this article
here at GitHub.](https://github.com/brightdigit/advanced-swift-codable)

## How JSONDecoder works

These are basic rules for how the JSONDecoder converts JSON into a
structured type:

1.  Property names are converted as is.
2.  Simple property values by default are converted to `String`, `Int`,
    or `Double`
3.  Property values which follow the correct format may be decoded into
    `URL`, `Data`, or `Date`.
4.  Any property value may be assumed to be `Optional`
5.  Square bracket `[]` values are converted to `Array`
6.  Curly brackets `{}` values are convert to `Dictionary` or a custom
    type.
7.  All types which need to be decoded need to implement the Decodable
    protocol. Likewise, types which need to be encoded need to implement
    the Encodable protocol. If the type needs to be both decoded and
    encoded can simply implement Codable.

In this case, we'll be looking at the [Twitter JSON
data](https://github.com/brightdigit/advanced-swift-codable/blob/master/advanced-swift-codable.playground/Resources/twitter.json)
returned for a tweet. Therefore, **the first thing we are going to do is
simply create some basic structures for each type of data returned**. As
a result, you can look at [the first step of working decoding here on
this branch of the
repo](https://github.com/brightdigit/advanced-swift-codable/tree/step-1).

Even if the data is similar, we create separate structs in order to
allow more flexibility. However, that does not mean we can't use
protocols in order simplify the consumption of those types in functions.

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/02/401od83ke6o-1024x680.jpg){.wp-image-458
width="512" height="340"}
:::

## Using Protocols with Codable {#protocols-with-codable}

For instance, in the Twitter API, the notion of a tweet is used
throughout. As an example, their JSON has a main tweet as well as
*quoted tweets*. Therefore, one might be inclined to use the same
structure for both. However, a better approach is two separate
structures:

``` {.wp-block-code}
public struct Tweet : Codable {
  public let created_at : Date
  public let id : Int
  public let full_text : String
  public let display_text_range : [Int]
  public let entities : TweetEntities
  public let source : String
  public let in_reply_to_status_id : Int?
  public let in_reply_to_user_id : Int?
  public let in_reply_to_screen_name : String
  public let user : TweetUser
  public let quoted_status : QuotedTweet?
  public let is_quote_status : Bool
  public let retweet_count : Int
  public let favorite_count : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possibly_sensitive : Bool
  public let possibly_sensitive_appealable : Bool
  public let lang : String
}

public struct QuotedTweet : Codable {
  public let created_at : Date
  public let id : Int
  public let full_text : String
  public let display_text_range : [Int]
  public let entities : TweetEntities
  public let user : TweetUser
  public let source : String
  public let extended_entities : TweetEntities
  public let is_quote_status : Bool
  public let retweet_count : Int
  public let favorite_count : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possibly_sensitive : Bool
  public let possibly_sensitive_appealable : Bool
  public let lang : String
}
```

**Therefore, this means duplicated fields. However, it also allows for
better flexibility and easier JSON decoding**. On the other hand, we can
simplify these types when used as parameters in functions. For instance,
let's say we need to print the tweet out:

``` {.wp-block-code}
func printTweet (_ tweet: Tweet) {
  print(tweet.full_text)
  if let quoted_status = tweet.quoted_status {
    printTweet(quoted_status)
  }
}

func printTweet (_ tweet: QuotedTweet) {
  print(">",tweet.full_text)
}
```

However, using some basic *Protocol-Oriented Programming*, we can in
fact be optimize this. Firstly, we stub a function which prints out the
tweet based on a protocol regardless of whether it is a *quoted tweet*
or not.

``` {.wp-block-code}
func printTweet(_ tweet: TweetProtocol, withQuoteLevel level: Int = 0) {
  print(String(repeating: ">", count: level),tweet.full_text)
  if let quotedTweet = tweet.quotedTweet {
    printTweet(quotedTweet, withQuoteLevel: level+1)
  }
}
```

Consequently, we create the protocol which has the properties we need
for the function above.

``` {.wp-block-code}
public protocol TweetProtocol {
  var full_text : String { get }
  var quotedTweet : TweetProtocol? { get }
}
```

Lastly, we implement the protocol for the two types we'll use it for -
`Tweet` and `QuotedTweet`:

``` {.wp-block-code}
extension Tweet : TweetProtocol {
  public var quotedTweet: TweetProtocol? {
    return self.quoted_status
  }
}

extension QuotedTweet : TweetProtocol {
  public var quotedTweet: TweetProtocol? {
    return nil
  }
}
```

Now **we have better flexibility to work with Codable while at the same
time adding similar functionality using *Protocols*.** Next, let\'s
cleanup the property names.

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/02/hrtdxy5urbu.jpg){width="400"
height="267"}
:::

## Custom Property Names

One thing you notice about Twitter's JSON is that **they use what's
called** [**snake-case**](https://en.wikipedia.org/wiki/Snake_case)
**for combining words in property names. As a result, underscores** `_`
**are used for combining words in JSON keys.** For instance, the
property for the full text of a tweet is called `full_text`. However,
**the** [**Swift API design
guidelines**](https://swift.org/documentation/api-design-guidelines/#general-conventions)
**recommend using** [**camel
case.**](https://en.wikipedia.org/wiki/Camel_case) **Camel case
capitalizes each new word.** Consequently, our property name would be in
this case would be `fullText`. Therefore, we have two ways of fixing
this: **custom CodingKeys or using a KeyEncodingStrategy.**

Custom CodingKeys allows us the most flexibility by allowing us to
provide a map from JSON keys to property names. However, in this case
**there is a consistent strategy for mapping all keys to property
names.** Therefore, in this case, we\'ll use `KeyDecodingStrategy`
specifically
[`KeyDecodingStrategy.convertFromSnakeCase`](https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy/convertfromsnakecase):

``` {.wp-block-code}
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
```

In addition, if
[`KeyDecodingStrategy.convertFromSnakeCase`](https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy/convertfromsnakecase)
doesn't quite fit with your JSON keys, Swift does allow the use of
[custom
strategies.](https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy/custom)
In other words, you can supply a closure for converting a CodingKey
array to single CodingKey result.\
Last but not least, if none of this strategies work for converting a key
to a property name you can always supply a custom CodingKeys
enumeration. **In short, you want to use the simplest and most
consistent strategy for mapping property names or JSON keys.**

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/02/zmmxsrmsoi8.jpg){width="400"
height="281"}
:::

## Custom Property Values

Another quirk with Twitter's JSON data is how they format some of the
property values. Let's take a look at the easiest to deal with which is
dates.

### How to deal with Date

By default, dates are serialized as a floating decimal specifically
[TimeInterval](https://developer.apple.com/documentation/foundation/timeinterval)
(number of seconds) since the *reference date* of [January 1st,
2001](https://developer.apple.com/documentation/foundation/nsdate/1417376-timeintervalsincereferencedate).
However, if the format from the JSON property value is different, you
can use [one of the strategies
available](https://developer.apple.com/documentation/foundation/jsondecoder/datedecodingstrategy):

-   **iso8601** - [a standard
    format](https://www.iso.org/iso-8601-date-and-time-format.html) used
    throughout the web
-   **secondsSince1970** - [unix
    time](https://en.wikipedia.org/wiki/Unix_time) in seconds
-   **millisecondsSince1970** - [unix
    time](https://en.wikipedia.org/wiki/Unix_time) in milliseconds

Consequently, **if the date format does not follow any of these you need
to provide either a closure to convert it or a**
[**DateFormatter**](https://developer.apple.com/documentation/foundation/dateformatter)**.**
The main way to specify the format in
[DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter)
is with the [dateFormat String
property](https://developer.apple.com/documentation/foundation/dateformatter/1413514-dateformat).
In other words, by using the [Unicode provided
codes](http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns),
we can create a *dateFormat* string to represent the format of dates and
times provided by Twitter. As a result, from the date
`Mon Mar 28 14:39:13 +0000 2016` in our JSON, we can infer the format to
be: `eee MMM dd HH:mm:ss ZZZZ yyyy`. Therefore, we can create a
[DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter)
and set the strategy accordingly:

``` {.wp-block-code}
let dateFormat = "eee MMM dd HH:mm:ss ZZZZ yyyy"

let dateFormatter = DateFormatter ()
dateFormatter.dateFormat = dateFormat

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(dateFormatter)
decoder.keyDecodingStrategy = .convertFromSnakeCase
return decoder
```

In conclusion, by customizing the DateFormatter, dates can be decoded as
Date property values. However, colors will be slightly more challenging.

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/02/f6xv0xs9jwg.jpg){width="400"
height="300"}
:::

### Custom Decoding of Property Values {#custom-decoding}

For colors such as the profile background color, we need to create a
separate struct and implement the encoding and decoding ourselves to
convert the hexidecimal string to a usable color structure:

``` {.wp-block-code}
import Foundation
import CoreGraphics

public struct Color : Codable {
  public let red : CGFloat
  public let green : CGFloat
  public let blue : CGFloat
  public let alpha : CGFloat

  public init(from decoder: Decoder) throws {
    let hexCode = try decoder.singleValueContainer().decode(String.self)
    let scanner = Scanner(string: hexCode)
    var hexint : UInt32 = 0
    scanner.scanHexInt32(&hexint)

    self.red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
    self.green = CGFloat((hexint & 0xff00) >> 8) / 255.0
    self.blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    self.alpha = 1
  }

  public func encode(to encoder: Encoder) throws {
    let string = String(format: "%02lX%02lX%02lX", lroundf(Float(red * 255.0)), lroundf(Float(green * 255.0)), lroundf(Float(blue * 255.0)))
    var container = encoder.singleValueContainer()
    try container.encode(string)
  }
}
```

In this case, we override the init method and grab the string from the
`singleValueContainer`. After that, we use a
[Scanner](https://developer.apple.com/documentation/foundation/scanner)
to convert the color hexcode into a hexidecimal number. Then use a
combination of bitwise and logical operations to grab each component
value in between 0 and 255. Lastly, we use decimal division to calculate
the value in between 0 and 1. (I have also included the encode method
for completion sake.) As a result, we can easily convert a hexcode
String to a Color struct.

Since we can\'t use the existing system color types, here is the code to
convert from our custom Color struct to whatever the system\'s default
UI color type is:

``` {.wp-block-code}
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
public typealias SystemColor = UIColor
#elseif os(macOS)
public typealias SystemColor = NSColor
#endif

extension Color {  
  public var systemColor : SystemColor {
    return SystemColor(red: self.red, green: self.green, blue: self.blue, alpha: self.alpha)
  }
}
```

::: {.wp-block-image}
![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/02/xde_p0expc8.jpg){width="400"
height="267"}
:::

## Make Codable Work For Us

Codable offers many layers of customability. However, in more case we
want to use the least amount of customization with the most amount of
consistency.

-   For data used in similar ways **use separate types but implement the
    same protocol**
-   If property names with a consistent strategy, **use a
    KeyEncodingStrategy rather than custom CodingKeys**
-   For dates **use dateDecodingStrategy, DateFormatter, or a closure**.
-   For other custom types, **create a separate type and customize the
    decoding** (and encoding) there.

If you have other issues you\'d like me to look into, [reach me at
twitter](http://twitter.com/leogdion). In addition, if you are
interested in learning more about complex JSON decoding or encoding and
other Swift topic, subscribe to my newsletter to stay up to date.

::: {#mc_embed_signup}
::: {#mc_embed_signup_scroll}
::: {.indicates-required}
[\*]{.asterisk} indicates required
:::

::: {.mc-field-group}
Email Address [\*]{.asterisk}
:::

::: {.mc-field-group}
First Name
:::

::: {.mc-field-group}
Last Name
:::

::: {#mce-responses .clear}
::: {#mce-error-response .response style="display:none"}
:::

::: {#mce-success-response .response style="display:none"}
:::
:::

::: {style="position: absolute; left: -5000px;" aria-hidden="true"}
:::

::: {.clear}
:::
:::
:::