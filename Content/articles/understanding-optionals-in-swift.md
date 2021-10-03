---
date: 2018-01-04 14:14
description: "Optionals are a fairly unique concept in Swift. While Objective-C used
  pointers, Swift has an inherent syntax for optionals\u2026"
---
Optionals are a fairly unique concept in Swift. While Objective-C used
pointers which could be nil and C\# had a Nullable generics type for
value types, Swift has an inherent syntax for optionals as well as
wrapping and unwrapping them.

## What is an Null?

In Objective-C and classic C-style languages, we had pointers for
complex data structures. A pointer is really a number pointing to a
virtual address in memory. Where is that Foo object? Well your Foo
pointer says its at 0x1A45612BE S. Main Street. Great! However sometimes
the pointer call be nil or null or zero. And when you call a function or
method, it is a way of answering a question and saying something does
not exist as opposed to saying does exist and here is its information.

------------------------------------------------------------------------

Hey could you tell me about my iPhone? Yes it is a iPhone 8 Plus Black
with 256 GB. *Or* You don't have one. Null!

------------------------------------------------------------------------

  Now the question is, how do we do null or nil while abstracting away
pointers in our programming language.

## What is Optional?

By now, many programming languages have shifted away from using pointers
and have simply abstracted them away. At this point, a programmer
doesn\'t really care about what specific address a piece of information
is stored at? Typically you want the actual info. The problem then is
**how can you signify null while still containing that information and
not using pointers. ** Most languages assume all objects can be null and
should be checked programmatically. However a language like C\# doesn't
do this with value types (Int, Float, Char, Structs, etc...). It assumes
all value type objects are in fact not null and later created Nullable
struct to contain value types as well as a boolean to tell whether the
object is null or not. In many ways Swift is doing something similar and
taking it to the next level. **Swift assumes all objects are not nil and
if anything could be it would contained in its own Optional
(enumeration) container.** This means any parameter, return value,
property, etc... needs to be noted as Optional if that value could ever
be nil. Just as C\# has a syntax short hand for the Nullable type, Swift
does as well using the question mark \'?\'. Additionally Swift also has
a syntax for wrapping and unwrapping these variables as well.

## Optional Chaining

In Swift, you can easily specify that a variable is optional by using
the question mark: `let x: Foo?` In this case, `x` could contain a Foo
or not. What this is called is **wrapping** your variable as optional.
So let's say we create a struct for an iOS device:


    struct Device {

      let model: String

      let storage: Int

      let color: UIColor

    }

Great! Now let's add a static property to get the device information.

    extension struct Device {

    static var current : Device? {

    /// code here

    /// could return nil if the device is not iOS

    }

    }

Notice this returns an *optional*. So if you run this code on your Mac
or perhaps on Linux, you will get nil. Now, what is nice about Swift is
that we have the ability to use optional chaining to get properties.
**By using the question mark suffix on a variable, we can safely pull
properties from the optional.** Since the variable is optional, that
optional gets carried to its properties:

    let model : String? = Device.current?.model

This optional chaining can be carried through as well. So if the model
property were something like this:

    struct Model {

    let frontCameraResolution : CGSize?

    //...

    }

Then you would do something like this:

    let frontCameraResolution : CGSize? = Device.current?.model?.frontCameraResolution

So whether you are on a Mac, using Linux, or on an old iPhone with not
front-facing camera, your value would be nil. Now it can get tedious
many times to use the question mark suffix and perhaps you just need the
value if it is there because another method does not take an optional
value. In this case you need to unwrap your optional value. **This is
where `if let` and `guard let … else` statements take over. These
provide a safe way to convert your optional to an ordinary value and
take care of cases where the optional is nil. This is called conditional
unwrapping** The other way and the less safe way is forcible unwrapping
and using the exclamation mark.

## Forcibly Unwrapping

**Most of the time, it is best to catch instances of nil values and
through a better error rather than the default `unexpectedly found nil`
error.** However when you must just force an optional to not be an
optional there is a way by using the exclamation mark.

    let model : Model = Device.current!.model

Now we are using an exclamation mark to force the optional value to be
just the value. So if we were to run this on a Mac or Linux, it will
crash. **This is typically not recommend. And even if you want it to
crash, you may want to do something with that info and create a custom
error for to display to the user.**

## Implicitly Unwrapped Optionals

Just as a question mark is used for optional chaining, that is chaining
an optional value to its properties, as well as declaring a variable to
be optional, you can declare a variable as an **Implicitly Unwrapped
Optional.** For instance:

    let model : Model! = Device.current?.model // no crash here

    let frontCameraResolution : CGSize = model.frontCameraResolution // will crash here if nil model

What this means is that **the `model` variable will be treated as not
optional and will not crash here but rather if `model` is nil and you
access a property on it, it will crash.** There is one main case where
you will see this: properties which can't be set at initialization but
will be set very soon after. The classic example for this is IBOutlets
and subviews.

    @IBOutlet weak var subview: UIView!

If you have a UIViewController which contains a subview property that
you've linked in a storyboard and that property cannot be set at
initialization but needs to be set afterwards in `.viewDidLoad()`. You
can safely assume that variable will be setup since most of your code
will be after `.viewDidLoad()`. So rather than accessing properties with
`self.subview?.property` you can access the property by simply typing
`self.subview.property`.

## Conclusion

Swift emphasizes type-safety and Optional are a great example. Getting
away from the pointers used in Objective-C, Swift uses optionals to
signify whether a value could be nil. The question mark is used for
optional chaining to ensure that an optional's properties remain
type-safe and returns optional for those properties. Rarely you may want
to assume that a optional is never nil, then you have the option to use
the exclamation mark to forcible unwrap optionals. You can also treat
optionals as unwrapped if they never be nil shortly after initialization
such as storyboard linked subview. To do this give the property or
variable a exclamation suffix on its type. Ultimately optionals provide
a convenient way to keep your code both clean and efficient while being
type-safe.