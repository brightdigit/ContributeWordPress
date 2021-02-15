---
date: 2017-11-27 13:38
---
# Understanding Optionals in Swift


Optionals are a fairly unique concept in Swift. While Objective-C used pointers which could be nil and C# had a Nullable generics type for value types, Swift has an inherent syntax for optionals as well as wrapping and unwrapping them.





## What is an Null?


---


_

_


---


## What is Optional?

**how can you signify null while still containing that information and not using pointers. **

** Swift assumes all objects are not nil and if anything could be it would contained in its own Optional (enumeration) container.**

## Optional Chaining

```swift
let x: Foo?
```

```swift
x
```

**wrapping**

```swift


struct Device {

  let model: String

  let storage: Int

  let color: UIColor

}


```

```swift

extension struct Device {

static var current : Device? {

/// code here

/// could return nil if the device is not iOS

}

}

```

_

_

**By using the question mark suffix on a variable, we can safely pull properties from the optional.**

```swift

let model : String? = Device.current?.model


```

```swift

struct Model {

let frontCameraResolution : CGSize?

//...

}


```

```swift

let frontCameraResolution : CGSize? = Device.current?.model?.frontCameraResolution


```

**This is where if let and guard let … else statements take over. These provide a safe way to convert your optional to an ordinary value and take care of cases where the optional is nil. This is called conditional unwrapping**

## Forcibly Unwrapping

**Most of the time, it is best to catch instances of nil values and through a better error rather than the default unexpectedly found nil error.**

```swift

let model : Model = Device.current!.model


```

**This is typically not recommend. And even if you want it to crash, you may want to do something with that info and create a custom error for to display to the user.**

## Implicitly Unwrapped Optionals

** Implicitly Unwrapped Optional.**

```swift

let model : Model! = Device.current?.model // no crash here

let frontCameraResolution : CGSize = model.frontCameraResolution // will crash here if nil model


```

**the model variable will be treated as not optional and will not crash here but rather if model is nil and you access a property on it, it will crash.**

```swift

@IBOutlet weak var subview: UIView!


```

```swift
.viewDidLoad()
```

```swift
.viewDidLoad()
```

```swift
self.subview?.property
```

```swift
self.subview.property
```

## Conclusion