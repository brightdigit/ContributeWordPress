---
title: macOS Development for iOS Developers
date: 2018-02-16 05:00
description: There are good reasons to get into Mac development if you are already
  an iOS developer.
tags: apple-development
featuredImage: /media/wp-images/brightdigit/2018/02/list-394.png
---
There has been a recent rumor about Apple allowing developers to create
multi-platform apps for macOS and iOS. The hope is that iOS developers
will be able to bring their apps over to macOS. Of course this can
already be done. The question is whether you should migrate your iOS app
over, how you can do it, what the future may be for multi-platform iOS
macOS apps.

## Why Should You Get Into Mac Development

There are some very good reasons to get
into Mac development if you already are an iOS developer.

### <img src="/media/wp-images/brightdigit/2018/02/discount-383-150x150.png" class="thumbnail-inline" width="150" height="150" alt="price tag icon" /> Market Potential

Many app developers will tell you how difficult it is to get users to
find your app, use the app, and then give you money through some means.
macOS has a greater expectation that software is less frivolous and
therefore can be more expensive. There is some truth to this since if
you're already willing to put cash down on an iMac, iMac Pro, or Mac Pro
spending money on software would barely be an expense. With that though
comes that your software is more than just another social network app or
streaming app but a professional application for creating or building
something.

### <img src="/media/wp-images/brightdigit/2018/02/responsive-388-150x150.png" class="thumbnail-inline" width="150" height="150" alt="cross apple communication" />  Companion App


By building a macOS companion app for already existing iOS app, you can
reach a whole other market and perhaps earn some credit from the folks
at Apple. By having your app in macOS as well you offer more versatility
for more complex operations and a more open operating system.

## How To Get Into Mac Development

### Similarities

By already being an iOS developer, you already bring a lot to the table
when it comes to Mac development. For one thing you don’t need to learn
a whole new programming language. Whether you develop in Objective-C or
Swift, you can bring that with you to Mac development. There are also
many frameworks which have common or similar APIs such as Core Data,
Core Graphics, CoreML, and more. For more details check out [Apple’s
guide on
migration](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/OSX_Technology_Overview/MigratingFromCocoaTouch/MigratingFromCocoaTouch.html).

### Differences

With API that is at least 10 years older, there’s liable to be many
differences when it comes to iOS and macOS development. iOS is based
around Cocoa Touch with UIKit as the primary UI framework. macOS on the
other hand is based around Cocoa and uses AppKit for its UI framework.
The main differences come down to methodologies, language support, UX,
and hardware.

<img src="/media/wp-images/brightdigit/2017/12/uczf1sxcejo.jpg" class="size-full wp-image-178" width="1600" height="1068" />

#### Methodologies

AppKit, the primary UI framework, was originally developed at a time
before many modern programming concepts had arrived. So while UIKit uses
a Target-Action model, as well, delegates, and closures; AppKit uses
mostly Target-Action for method signatures. Another thing is the use of
Cocoa Binding for mapping data to controls using key paths. Cocoa
Binding is more based around the Model-View-ViewModel pattern as opposed
to Model-View-Controller pattern when it comes to displaying model data.
While Cocoa Touch has evolved along with Swift much more fluidly, Cocoa,
is still restricted by backwards support and being an older framework.

#### Language Support

With Objective-C being the more primary language with AppKit, there is a
heavier use of the target-action model, selectors, and accessor methods.
Selectors while available in Swift tends to be more awkward in use.
Typically UIKit will have selectors but usually have an alternative way
as well to respond to events such as delegates and closures. Accessor
Methods are used throughout Cocoa and AppKit rather than Properties
which are used throughout Cocoa Touch and UIKit. Also the prefixes for
many classes use the NextStep prefix “NS-“ still rather than the UIKit
prefix “UI-“.

<img src="/media/wp-images/brightdigit/2018/02/lilly-rum-342740-425.jpg" class="wp-image-621 size-full" width="1920" height="1280" />

#### Development Workflow

There are some things which make developing macOS on macOS hardware. For
one thing, there is no need for simulators. However this means you no
longer have access to every model which the operating system could be
on. This should rarely be an issue but there are times when certain Mac
models have differing capabilities and differing speeds. One difference
with Macs are the differing screen sizes. Over the years iOS screen
sizes have grown in variety quite a bit but macs have a practically
infinite possibilities with screen sizes. Of course macOS apps unlike
iOS apps don’t always run in full-screen.

## <img src="/media/wp-images/brightdigit/2018/02/kaitlyn-baker-422999-409.jpg" class="size-full wp-image-622" width="1920" height="1280" />

#### Human Computer Interaction

With macOS apps running in multiple windows comes a different classic
way to interact. With iOS, apps typically have one UIWindow which take
up the whole screen however macOS apps have multiple NSWindows which can
a wide variety sizes. UIWindow is a subclass of UIView; NSWindow is not
a subclass of NSView. Also there are a variety of devices you may need
to interact with including the mouse and keyboard. NSEvent along with
varying delegate, controller, view, window methods, are the ways you can
respond to various mouse and keyboard events. Menus can also be more
complex and come in a variety of types such as context menus, pop-up
lists, status bar menus, and more. There is also a variety of classes
which may sound similar but aren’t. One example is NSTableView and
UITableView. While UITableView is used for menus, lists, and other
purposes in iOS, NSTableView is pretty much a strict table with rows and
columns and is used for those purposes. The other major difference is
the way documents and the file system is handled. macOS comes with more
complex document handling and depending on how your app is setup with
sandboxing the user may have differing access to the actual file system.

<img src="/media/wp-images/brightdigit/2018/02/vadim-sherbakov-36-437.jpg" class="wp-image-619 size-full" width="1920" height="1282" />

## Remedies For Porting to macOS

There are few method to porting code over from iOS to macOS. All these
methods are valid and could be used together in various ways:

*   Just Copy the Code
    -   more code to maintain
    -   most flexible
    -   least consistent
*   Use Lower-Level Common Framework
    -   less code to maintain
    -   more difficult to provide functionality
    -   some consistency
*   Use Adapter Pattern
    -   less code to maintain than copying
    -   more consistency with some flexibility
*   Preprocessor Directives
    -   use for small pieces of code which have little difference (i.e. NSColor / UIColor, etc…)

<img src="/media/wp-images/brightdigit/2018/02/Marzipan_fruit_with_nervous_expression-430.jpg" class="wp-image-618 size-full" width="1920" height="1440" />

## What’s the Future of macOS Development?

With talk about the *Marzipan* project, which is supposed to unify iOS
and macOS development, the question becomes “What is the future of macOS
development?”.

### Porting iOS UI to macOS

Apple could port classes such as UIViewController to macOS and only make
minor modification for macOS. This could mean a jaunty experience on the
Mac but the easiest experience for developers.

### UXKit

UXKit, a private framework, used in the development of the Mac Photos
app could be made available to the public. The Photos app while visually
appealing has received many criticism for its awkward experience on the
Mac.

### Unified Abstract Layer

A new framework which abstracts UIKit and AppKit but also offers way to
hook into AppKit and UIKit if needed such as the way UIKit or AppKit
allow access to Core Graphics. This would offer the most flexibility
while removing all of the repetitive code.

### Similar to watchOS and tvOS

Apple may also follow their pattern with watchOS and especially tvOS
which have many similar UI type features but also have many differences.

## Conclusion

If you are thinking about getting into macOS development, I think now is
the best time to do it; especially if you are already an iOS
development. It is not something which will be easy however being fluent
in Swift or Objective-C and having knowledge of some of the common
frameworks used will help. With hopefully whatever the *Marzipan*
project brings will smooth out of the rough and outdated piece of the
macOS api but coming with some of that legacy knowledge will help.