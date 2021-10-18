---
date: 2018-11-14 05:23
description: Objective-C is still necessary for Swift development. With the introduction
  of C++ libraries in version 2.0 of Speculid, Objective-C became necessary.
---
There are times where Objective-C is still necessary for Swift
development. For instance, with one such app I\'ve built in Swift,
[Speculid](https://speculid.com/?utm_source=web&utm_medium=blog-post&utm_campaign=building-speculid),
I needed to bring Objective-C code in. With the introduction of C++
libraries in version 2.0, Objective-C became necessary. Luckily there
are ways to make both Objective-C and Swift work together in a friendly
fashion.

## Simplifying Installation with C++ Libraries

Speculid is a completely open source application built with the latest
version of Xcode. It [automates the process of converting PNG and SVG
files into complete Image Sets and App
Icons.](https://learningswift.brightdigit.com/app-icon-templates-graphics-xcode/)
In the first version, it required the installation of Inkscape and
ImageMagick to facilitate the conversion of images from SVG or PNG to
PDF or PNG. This became cumbersome both in the installation and usage.
With version 2.0, I wanted to make the process of installation and
integration as easy as possible by removing any prerequisites steps and
pre-existing dependencies. This meant packaging any required
dependencies within the application package. In this case, we are using
two C++ libraries, [*Cairo*](https://cairographics.org) and
*[libRSVG](https://wiki.gnome.org/Projects/LibRsvg)*. *Cairo* is the
leading 2D library used throughout the open source community and
*libRSVG* is used for reading SVG content. With these two libraries
available, the challenge then became integrating them into the Swift
code. As of now, Swift has no way to directly interface with C++.
Therefore, we need an intermediary and those intermediaries can either
be code in C or Objective-C. While C has some simplicity to it, in this
case, I went with Objective-C.

## Bridging the Gap with Objective-C

Not only do I have experience with Objective-C, but Objective-C has a
strong integration with the Apple ecosystem; despite the simplicity of
C. While I am using Objective-C, I want to keep the bulk of the code in
Swift. Objective-C will only serve to interface with the C++ libraries
as needed. Swift will interact with the user, manage jobs, etc\...
Objective-C will call the C++ libraries to build the actual graphics.
The Swift code will be completely unaware of the code actually used
to read, manipulate, and write the resulting files. Here is a brief
rundown of the process:

-   **Main** - instantiate and run NSApplication
-   **SpeculidApplication** - looks for the *speculid* file and parses
    the file using *Codable*
    -   Finds the source graphic file (PNG or SVG)
    -   Parses the [Asset
        Catalog](https://learningswift.brightdigit.com/asset-catalogs-image-sets-app-icons/)
        file
    -   Parses the specifications in the *speculid* file
    -   Creates the specifications to be passed to the Objective-C code
-   **In Objective-C**, use the specifications passed to call the C++
    functions to write out the target graphic files (PNG or PDF)

## Writing Swift-Friendly Code in Objective-C

There are a couple of ways to make our Objective-C and Swift code work
well together. One is making sure the API uses compatible types.

### Using Protocols to Facilitate Communication

Objective-C does not use Swift Structs. This leaves Classes as the only
way to pass complex data between the Swift and the Objective-C
framework. However, in order to keep the interfaces agnostic of each
other, we can create Protocols in the Objective-C API which can signify
to Swift what is required. In our Objective-C framework, there are two
methods available to Swift. The main method which calls
the *Cairo* library and takes an *ImageSpecificationProtocol* and an
*ImageHandle* object:

    @interface CairoInterface : NSObject
    +  (BOOL)exportImage:(id<ImageHandle>) sourceHandle withSpecification: (id<ImageSpecificationProtocol>) specification error: (NSError **) error;
    @end

#### Abstracting with Protocols

*ImageHandle* is another Protocol which the Objective-C framework will
use containing the painting surface needed by Cairo. However, the Swift
framework doesn't need to know anything about Cairo. So how does Swift
create an *ImageHandle* without having access to the Cairo surface
reference? That\'s where the other method comes in. We provide a
builder/factory class in the Objective-C class which takes parameters
available in Swift:

    @interface ImageHandleBuilder : NSObject
    @property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
    - (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
    @end

The *ImageFileProtocol* protocol looks this:

    @protocol ImageFileProtocol <NSObject>
    @property (readonly) NSURL * _Nonnull url;
    @property (readonly) ImageFileFormat format;
    @end

#### Protocols as Guidance

*ImageFileFormat* is an enum which is available in Swift and denotes a
file type (PNG, PDF, or SVG). *NSURL* is automatically taken care of and
will be a *URL* in Swift. As long as we implement *ImageFileProtocol *in
Swift with these properties and it subclasses *NSObject*, we can easily
pass that object to *ImageHandleBuilder*, we should be able to call the
ImageHandleBuilder easily. This goes the same
for *ImageSpecificationProtocol*
in`CairoInterace.exportImage:withSpecification:error:`.
ImageSpecificationProtocol contains the information needed to know what
and how the information is painted:

    @protocol ImageSpecificationProtocol <NSObject>
    @property (readonly) id<ImageFileProtocol> file;
    @property (readonly) GeometryDimension geometry;
    @property (readonly) BOOL removeAlphaChannel;
    @property (readonly) id<CairoColorProtocol> backgroundColor;
    @end

Let's look at each of these properties excluding ImageFileProtocol which
we already talked about\...

-   *removeAlphaChannel* which is a boolean value and that's transferred
    between languages easily.
-   *geometry is* *GeometryDimension,* a C struct which contains
    information about which dimension to scale based on (width, height
    or scale) and the size. ``
-   *backgroundColor is* *CairoColorProtocol* which contains information
    about the background color in case you need an image without a
    transparency and your source image has a transparency (i.e. App
    Icons).

With the *CairoColorProtocol,* we could simply create a new class
that contains the info that is needed. However, in Swift, we could
minimize new code by simply using an Extension on an existing class.

### Using Extensions to Add Functionality to Existing Classes

Here is how the protocol for *CairoColorProtocol* looks in Objective-C:

    @protocol CairoColorProtocol <NSObject>
    @property (readonly) double red;
    @property (readonly) double green;
    @property (readonly) double blue;
    @end

In this case rather [then]{.ul} creating a new class to implement this
in Swift we can extend existing class: NSColor. Here the [simple]{.ul}
implementation [as a Swift extension]{.ul}:

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

Now we can easily communicate between Swift and Objective-C. However,
there are a couple of improvements we could make to our Objective-C code
to make it even better for Swift.

## Writing Swift friendly code in Objective-C

Since day one of Swift, working with Objective-C has been a requirement
in some way. As the years have passed, Objective-C has added attributes
to make it friendly to paradigms in Swift. There are two main ways we'll
look at: **error handling** and **optionals**.

### Error Handling

Since the inclusion of try statements in Swift 2.0, we've replaced the
need for NSError pointers as parameters in Swift. However, if you follow
the standard NSError paradigms in Objective-C, Swift will see that
method as though it could throw an Error. Here's an example from the
CairoInterface class:

    @interface CairoInterface : NSObject
    +  (BOOL)exportImage:(id<ImageHandle>) sourceHandle withSpecification: (id<ImageSpecificationProtocol>) specification error: (NSError **) error;
    @end

Swift will see this as:

    class CairoInterface : NSObject {
        static func exportImage(_ sourceHandle: ImageHandle!, withSpecification specification: ImageSpecificationProtocol!) throws
    }

Two things are required for the translation to an error throwing
function:

-   the return is a boolean which indicates true for success, false for
    failure
-   an NSError pointer parameter specifically named error

Let's take a look again at the ImageHandleBuilder method:

    @interface ImageHandleBuilder : NSObject
    @property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
    - (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
    @end

The difference is that it returns an actual value possibly. Otherwise,
we still have an NSError pointer parameter named error.

    class ImageHandleBuilder : NSObject {
        func imageHandleFromFile(_ file: ImageFileProtocol!) throws -> ImageHandle!
    }

By following this standard, we've made error handling much cleaner and
easier between languages. However, we still have annoying implicit
optionals. Luckily there's a way to fix that as well.

### Optionals and Objective-C

One of the first features of Swift was the idea of Optionals. Optionals
remove the ambiguity of pointers used by Objective-C. Unfortunately, for
each of these pointers in Objective-C, Swift sees an implicitly
unwrapped optional. You can read more about [optionals and implicitly
unwrapped optionals
here.](https://learningswift.brightdigit.com/understanding-optionals-in-swift/)
Luckily, there are Objective-C attributes which can help clarify
optionals better. Objective-C has two attributes to signify to Swift
whether a parameter, property, or return value is optional or not:
`_Nonnull` and `_Nullable`. Let's look again at *ImageHandleBuilder*:

    @interface ImageHandleBuilder : NSObject
    @property (class, nonatomic, assign, readonly) ImageHandleBuilder*  shared;
    - (id<ImageHandle>) imageHandleFromFile: (id<ImageFileProtocol>) file error:(NSError**) error;
    @end

We have a singleton, `shared` which must exist and we have a function
`imageHandleFromFile:error:` which needs an ImageFileProtocol and may
return an ImageHandle. There, the property `shared `needs to
be  `_Nonnull``` and the `file` parameter in
`imageHandleFromFile:error:` needs to be `_Nonnull`. Since
`imageHandleFromFile:error:` can fail and throw an error, the return
type must be optional so we mark that we the `_Nullable` attribute. Here
is the result:

    @interface ImageHandleBuilder : NSObject
    @property (class, nonatomic, assign, readonly) ImageHandleBuilder* _Nonnull shared;
    - (id<ImageHandle> _Nullable) imageHandleFromFile: (id<ImageFileProtocol> _Nonnull) file error:(NSError**) error;
    @end

So now rather than Swift seeing:

    class ImageHandleBuilder : NSObject {
        class var shared : ImageHandleBuilder! { get }
        func imageHandleFromFile(_ file: ImageFileProtocol!) throws -> ImageHandle!
    }

We'll see:

    class ImageHandleBuilder : NSObject {
        class var shared : ImageHandleBuilder { get }
        func imageHandleFromFile(_ file: ImageFileProtocol) throws -> ImageHandle?
    }

This makes the API much more understandable in Swift and easier to
interface with.

## Making Code Friendly

When you need to write Objective-C code or perhaps you are in the
process of migrating Objective-C code over to Swift. There are a few
things you can do:

-   If you can to keep as much as code in Swift as possible, **write
    Protocols in Objective-C and implementation (i.e. Classes) in
    Swift**
-   **Use Protocol to guide the API for other frameworks and libraries**
-   **Use Extensions to avoid duplicating types** and reuse existing
    types.
-   In Objective-C, if your function can throw an Error, **use the
    standard paradigm in so Swift interprets your code correctly**
-   **Mark your Objective-C generously** with attributes to note whether
    a parameter, return type, etc\... is nullable or not.

Next, we\'ll be talking about using those C++ libraries in a framework.
If you want to stay up-to-date, [fill out the
form](http://eepurl.com/c5uqxP) so I can let you know when the article
is posted. In the meantime, feel free to checkout
[Speculid](https://speculid.com) or [the open-source
repo](https://github.com/brightdigit/Speculid), as well as [Apple\'s
documentation on migrating from Objective-C to
Swift](https://developer.apple.com/documentation/swift/migrating_your_objective-c_code_to_swift).