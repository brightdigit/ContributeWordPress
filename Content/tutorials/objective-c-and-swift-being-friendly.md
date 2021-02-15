---
date: 2018-11-14 10:23
---
# Objective-C and Swift - Being Friendly


There are times where Objective-C is still necessary for Swift development. For instance, with one such app I've built in Swift, Speculid, I needed to bring Objective-C code in. With the introduction of C++ libraries in version 2.0, Objective-C became necessary. Luckily there are ways to make both Objective-C and Swift work together in a friendly fashion.






## Simplifying Installation with C++ Libraries

[automates the process of converting PNG and SVG files into complete Image Sets and App Icons.](https://learningswift.brightdigit.com/app-icon-templates-graphics-xcode/)

[Cairo](https://cairographics.org)

_

[libRSVG](https://wiki.gnome.org/Projects/LibRsvg)

_

_

_

_

_

## Bridging the Gap with Objective-C

-   Main - instantiate and run NSApplication
-   SpeculidApplication - looks for the speculid file and parses the file using Codable

        Finds the source graphic file (PNG or SVG)
        Parses the Asset Catalog file
        Parses the specifications in the speculid file
        Creates the specifications to be passed to the Objective-C code



-   In Objective-C, use the specifications passed to call the C++ functions to write out the target graphic files (PNG or PDF)

## Writing Swift-Friendly Code in Objective-C

### Using Protocols to Facilitate Communication

_

_

_

_

_

_

```swift
@interface CairoInterface : NSObject
+  (BOOL)exportImage:(id<ImageHandle>) sourceHandle withSpecification: (id<ImageSpecificationProtocol>) specification error: (NSError **) error;
@end

```

### Abstracting with Protocols

_

_

_

_

```swift
@interface ImageHandleBuilder : NSObject
@property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
- (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
@end

```

_

_

```swift
@protocol ImageFileProtocol <NSObject>
@property (readonly) NSURL * _Nonnull url;
@property (readonly) ImageFileFormat format;
@end

```

### Protocols as Guidance

_

_

_

_

_

_

_

_

_

_

_

_

_

_

```swift
CairoInterace.exportImage:withSpecification:error:
```

```swift
@protocol ImageSpecificationProtocol <NSObject>
@property (readonly) id<ImageFileProtocol> file;
@property (readonly) GeometryDimension geometry;
@property (readonly) BOOL removeAlphaChannel;
@property (readonly) id<CairoColorProtocol> backgroundColor;
@end

```

-   removeAlphaChannel which is a boolean value and that’s transferred between languages easily.
-   geometry is GeometryDimension, a C struct which contains information about which dimension to scale based on (width, height or scale) and the size. 


-   backgroundColor is CairoColorProtocol which contains information about the background color in case you need an image without a transparency and your source image has a transparency (i.e. App Icons).

_

_

### Using Extensions to Add Functionality to Existing Classes

_

_

```swift
@protocol CairoColorProtocol <NSObject>
@property (readonly) double red;
@property (readonly) double green;
@property (readonly) double blue;
@end

```

```swift
extension NSColor: CairoColorProtocol {
  public var red: Double {
    return Double(redComponent)
  }

  public var green: Double {
    return Double(greenComponent)
  }

  public var blue: Double {
    return Double(blueComponent)
  }
}

```

## Writing Swift friendly code in Objective-C

**error handling**

**optionals**

### Error Handling

```swift
@interface CairoInterface : NSObject
+  (BOOL)exportImage:(id<ImageHandle>) sourceHandle withSpecification: (id<ImageSpecificationProtocol>) specification error: (NSError **) error;
@end

```

```swift
class CairoInterface : NSObject {
    static func exportImage(_ sourceHandle: ImageHandle!, withSpecification specification: ImageSpecificationProtocol!) throws
}

```

-   the return is a boolean which indicates true for success, false for failure
-   an NSError pointer parameter specifically named error

```swift
@interface ImageHandleBuilder : NSObject
@property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
- (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
@end

```

```swift
class ImageHandleBuilder : NSObject {
    func imageHandleFromFile(_ file: ImageFileProtocol!) throws -> ImageHandle!
}

```

### Optionals and Objective-C

[ optionals and implicitly unwrapped optionals here.](https://learningswift.brightdigit.com/understanding-optionals-in-swift/)

```swift
_Nonnull
```

```swift
_Nullable
```

_

_

```swift
@interface ImageHandleBuilder : NSObject
@property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
- (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
@end

```

```swift
shared
```

```swift
imageHandleFromFile:error:
```

```swift
shared 
```

```swift
_Nonnull
```

```swift

```

```swift
file
```

```swift
imageHandleFromFile:error:
```

```swift
_Nonnull
```

```swift
imageHandleFromFile:error:
```

```swift
_Nullable
```

```swift
@interface ImageHandleBuilder : NSObject
@property (class, nonatomic, assign, readonly) ImageHandleBuilder* _Nonnull shared;
- (id<ImageHandle> _Nullable) imageHandleFromFile: (id<ImageFileProtocol> _Nonnull) file error:(NSError**) error;
@end

```

```swift
class ImageHandleBuilder : NSObject {
    class var shared : ImageHandleBuilder! { get }
    func imageHandleFromFile(_ file: ImageFileProtocol!) throws -> ImageHandle!
}

```

```swift
class ImageHandleBuilder : NSObject {
    class var shared : ImageHandleBuilder { get }
    func imageHandleFromFile(_ file: ImageFileProtocol) throws -> ImageHandle?
}

```

## Making Code Friendly

-   If you can to keep as much as code in Swift as possible, write Protocols in Objective-C and implementation (i.e. Classes) in Swift
-   Use Protocol to guide the API for other frameworks and libraries
-   Use Extensions to avoid duplicating types and reuse existing types.
-   In Objective-C, if your function can throw an Error, use the standard paradigm in so Swift interprets your code correctly
-   Mark your Objective-C generously with attributes to note whether a parameter, return type, etc... is nullable or not.

[ fill out the form](http://eepurl.com/c5uqxP)

[Speculid](https://speculid.com)

[ the open-source repo](https://github.com/brightdigit/Speculid)

[Apple's documentation on migrating from Objective-C to Swift](https://developer.apple.com/documentation/swift/migrating_your_objective-c_code_to_swift)