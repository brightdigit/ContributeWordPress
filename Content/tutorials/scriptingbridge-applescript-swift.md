---
title: ScriptingBridge - Communicating with Swift  and AppleScript
date: 2017-07-15 06:34
description: You may want to build an app in Xcode with the power of AppleScript and
  without the need for scripts - particularly using Swift with ScriptingBridge.
featuredImage: /media/wp-images/learningswift/2018/11/0nrlPZlDopn4aHLy6.png
---
**AppleScript **is a great technology on macOS for both developers and
power users. With **AppleScript, **users can create automated processes
which work other apps. As a developer though, sometimes you want
a **build an app in Xcode with the power of AppleScript** without the
need to have separate script files. That's where ScriptingBridge comes
in. To work with AppleScript in any app, there are two options to do
this:

1.  **Write a separate AppleScript file **and use the [*NSAppleScript
    API*](https://developer.apple.com/documentation/foundation/scripting_support)
    to execute and run the script.
2.  **Use ScriptingBridge** to work with AppleScript
    in **Swift **or **Objective-C**.

We are going to look at the second option: ScriptingBridge. In
particular, **how to use ScriptingBridge in Swift** without the need for
AppleScript files or event Objective-C bridging.

## The Drawbacks of ScriptingBridge

**If you intend to write an App for the Mac App Store there are
restrictions as **[**noted by
Apple**](https://developer.apple.com/library/content/qa/qa1888/_index.html)**.** You
can also look at [this article by Craig
Hockenberry](https://www.objc.io/issues/14-mac/sandbox-scripting/) which
shows how you can use the AppleScript API in a Mac Store app. The bottom
line is: **You can not use ScriptingBridge with an app in the Mac App
Store.**

## Objective-C ScriptingBridge to Swift ScriptingBridge

When it comes to **Objective-C ScriptingBridge**, Apple already
provides [tools to prepare the
code](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ScriptingBridgeConcepts/UsingScriptingBridge/UsingScriptingBridge.html#//apple_ref/doc/uid/TP40006104-CH4-DontLinkElementID_12).
Luckily, **Tony Ingraldi of **[**Majesty
Software**](http://majestysoftware.com/)**, has **[**a great set of
python scripts**](https://github.com/tingraldi/SwiftScripting)** for
creating the same code in Swift.** For more details on this
specifically, take a look [his repo on
GitHub](https://github.com/tingraldi/SwiftScripting) or [his blog post
here](https://majestysoftware.wordpress.com/2015/03/31/swift-scripting-part-1/).

## ScriptingBridge with Safari

Now let’s try doing this **by writing **[**an app which pulls the tab
urls out of a Safari
window**](https://github.com/brightdigit/jURLnal)**. **The repo for this
app can be found [here](https://github.com/brightdigit/jURLnal).
Building the Swift Code from AppleScript Definition Download the python
scripting tools from the [SwiftScripting repo on
GitHub](https://github.com/tingraldi/SwiftScripting). From the repo’s
directory, run the following commands:

    pip install clangsdef /Applications/Safari.app > Safari.sdefsdp -fh --basename Safari Safari.sdef./sbhc.py Safari.h./sbsc.py Safari.sdef

Let’s break this down:

1.  `pip install clang`- ensures clang is installed for python
2.  `sdef /Applications/Safari.app > Safari.sdef`- gets the scripting
    definition from the specified scriptable application
3.  `sdp -fh --basename Safari Safari.sdef`- transforms a scripting
    definition to an Objective-C header file
4.  `./sbhc.py Safari.h`- transforms the Objective-C header file to
    Swift
5.  `./sbsc.py Safari.sdef`- extracts the enums from the standard
    definition to Swift

Now you should have 4 new files:

-   **Safari.sdef** — the scripting definition file
-   **Safari.h** — the objective-c header file, which we would use if we
    were doing objective-c directly or using objective-c bridging
-   **Safari.swift** — the primary file containing the main
    ScriptingBridge API to the application
-   **SafariScripting.swift** — the necessary enums needed by the
    ScriptingBridge API for the application

Since we are using only Swift code, we will only need the two Swift
files (Safari.swift and SafariScripting.swift) in our application. Add
the two files to your project in Xcode and now in our application, we
can talk to Safari.

## Using the ScriptingBridge API for Safari

To pull the all Safari windows currently open:

    if let application = SBApplication(bundleIdentifier: "com.apple.Safari") {  let safariApplication = application as SafariApplication  let safariWindows = safariApplication.windows?().flatMap({ $0 as? SafariWindow })  ...}

We call the `SBApplication`constructor using the bundle identifier. If
an object is returned, we cast as the `SafariApplication`protocol and
get all the windows. The `windows`property only returns
a `SBElementArray`, so we need to cast those elements to
a `SafariWindow`. Therefore by using the SafariWindow, we can get the
window’s set of tabs:

    let safariWindow = safariWindows?.firstlet safariTab = safariWindow?.tabs?().firstObject as? SafariTablet url = safariTab?.URL

So, let’s break this down:

1.  `let safariWindow = safariWindows?.first`- get the first Safari
    window
2.  `let safariTab = safariWindow?.tabs?().firstObject as? SafariTab`-
    grab the first tab of the Safari window and cast it to SafariTab
3.  `let url = safariTab?.URL`- get the url of that particular tab

If you need more details, check out [the repo for the sample
app](https://github.com/brightdigit/jURLnal) called [jURLnal](https://github.com/brightdigit/jURLnal)
which copies the URLs to the clipboard.

## Conclusion

So as you can see -

1.  We have used the standard ScriptingBridge tools to build the
    standard definition and Objective-C header file of Safari’s
    AppleScript API.
2.  By using [a set of python
    scripts](https://github.com/tingraldi/SwiftScripting) from Tony
    Ingraldi of [Majesty Software](http://majestysoftware.com/), we can
    convert the Objective-C header file and standard definition to Swift
    code.
3.  Adding the two Swift files to our project, we can use the API to
    extract the windows and tabs of the currently open Safari
    application.

If you want to learn more about Swift and ScriptingBridge, sign up at
the [form here](http://eepurl.com/dNQNAw).