---
title: ScriptingBridge with Swift - Communicating with Apps using AppleScript and
  Swift
date: 2017-06-09 16:38
featuredImage: /media/images/brightdigit/2017/06/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift.png
---
<img src="https://www.brightdigit.com/wp-content/uploads/2017/06/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift-300x105.png" class="alignnone size-medium wp-image-276" width="300" height="105" />
**AppleScript** is a great technology on macOS for both developers and
power users. It allows users to create automated processes which work
other apps. As a developer though, sometimes you want a **build an app
in Xcode with the power of AppleScript**without the need to have
separate script files. To work with AppleScript in any app, there are
two options to do this:

1.  **Write a separate AppleScript file** and use the [*NSAppleScript
    API*](https://developer.apple.com/documentation/foundation/scripting_support)
    to execute and run the script.
2.  **Use ScriptingBridge** to work with AppleScript in **Swift** or
    **Objective-C**.

We are going to look at the second option: ScriptBridging. In
particular, how to use ScriptBridge in Swift wihout the need for
AppleScript files or event Objective-C bridging.

#### The Drawbacks of ScriptBridging

**It should be noted if you intend to write an App for the Mac App Store
there are restrictions as [noted by
Apple](https://developer.apple.com/library/content/qa/qa1888/_index.html).**
You can also look at [this article by Craig
Hockenberry](https://www.objc.io/issues/14-mac/sandbox-scripting/) which
shows how you can use the AppleScript API in a Mac Store app. The bottom
line is: **You can not use ScriptingBridge with an app in the Mac App
Store.**

#### Objective-C ScriptBridging to Swift ScriptBridging

When it comes to **Objective-C** ScriptBridging, Apple already provides
[tools to prepare the
code](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ScriptingBridgeConcepts/UsingScriptingBridge/UsingScriptingBridge.html#//apple_ref/doc/uid/TP40006104-CH4-DontLinkElementID_12).
Luckily, **Tony Ingraldi of [Majesty
Software](http://majestysoftware.com/), has [a great set of python
scripts](https://github.com/tingraldi/SwiftScripting) for creating the
same code in Swift.** For more details on this specifically take a look
[his repo on GitHub](https://github.com/tingraldi/SwiftScripting) or
[his blog post
here](https://majestysoftware.wordpress.com/2015/03/31/swift-scripting-part-1/).

#### ScriptBridging with Safari

Now let's try doing this **by writing [an app which pulls the tab urls
out of a Safari window](https://github.com/brightdigit/jURLnal).** The
repo for this app can be found
[here](https://github.com/brightdigit/jURLnal).

##### Building the Swift Code from AppleScript Definition

Download the python scripting tools from the [SwiftScripting repo on
GitHub](https://github.com/tingraldi/SwiftScripting). From the repo's
directory, run the following commands:

    pip install clang
    sdef /Applications/Safari.app > Safari.sdef
    sdp -fh --basename Safari Safari.sdef
    ./sbhc.py Safari.h
    ./sbsc.py Safari.sdef

Let's break this down:

1.  `pip install clang` - ensures clang is installed for python
2.  `sdef /Applications/Safari.app > Safari.sdef` - gets the scripting
    definition from the specified script- able application
3.  `sdp -fh --basename Safari Safari.sdef` - transforms a scripting
    definition to an Objective-C header file
4.  `./sbhc.py Safari.h` - transforms the Objective-C header file to
    Swift
5.  `./sbsc.py Safari.sdef` - extracts the enums from the standard
    definition to Swift

Now you should have 4 new files:

-   **Safari.sdef** - the scripting definition file, which is used to
    build the code
-   **Safari.h** - the objective-c header file, which we would use if we
    were doing objective-c directly or using objective-c bridging
-   **Safari.swift** - the primary file containing the main
    ScriptingBridge API to the application
-   **SafariScripting.swift** - the nessecary enums needed by the
    ScriptingBridge API for the application

Since we are using only Swift code, we will only need the two Swift
files (Safari.swift and SafariScripting.swift) in our application. Add
the two files to your project in Xcode and now in our application we can
talk to Safari.

##### Using the ScriptBridging API for Safari

To pull the all Safari windows currently open:

    if let application = SBApplication(bundleIdentifier: "com.apple.Safari") {
      let safariApplication = application as SafariApplication
      let safariWindows = safariApplication.windows?().flatMap({ $0 as? SafariWindow })
      ...
    }

We call the
[`SBApplication`](https://developer.apple.com/documentation/scriptingbridge/sbapplication)
constructor using the bundle identifier. If an object is returned, we
cast as the `SafariApplication` protocol and get all the windows. The
`windows` property only returns a
[`SBElementArray`](https://developer.apple.com/documentation/scriptingbridge/sbelementarray),
so we need to cast those elements to a `SafariWindow`. From there we can
get the window's set of tabs:

    let safariWindow = safariWindows?.first
    let safariTab = safariWindow?.tabs?().firstObject as? SafariTab
    let url = safariTab?.URL

Let's break this down:

1.  `let safariWindow = safariWindows?.first` - get the first Safari
    window
2.  `let safariTab = safariWindow?.tabs?().firstObject as? SafariTab` -
    get the first tab of the Safari window and cast it to SafariTab
3.  `let url = safariTab?.URL` - get the url of that particular tab

If you need more details checkout [the repo for the sample
app](https://github.com/brightdigit/jURLnal) called
[jURLnal](https://github.com/brightdigit/jURLnal) which copies the URLs
to the clipboard.

#### Conclusion

So as you can see -

1.  We have used the standard ScriptBridging tools to build the standard
    definition and Objective-C header file of Safari’s AppleScript API.
2.  We used [a set of python
    scripts](https://github.com/tingraldi/SwiftScripting) from Tony
    Ingraldi of [Majesty Software](http://majestysoftware.com/) to
    convert the Objective-C header file and standard definition to Swift
    code.
3.  Added the two Swift files to our project and used the API to extract
    the windows and tabs of the currently open Safari application.

If you have any questions, comments, or thoughts, be sure to post a
comment below in [the disqus
forum](https://brightdigit.com/blog/17/06/09/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift/#disqus_thread).
If you are looking for a speaker on an Apple development topic or need
help with your current macOS app project, feel free to [contact me at
our form here](https://brightdigit.com/#contact-us).