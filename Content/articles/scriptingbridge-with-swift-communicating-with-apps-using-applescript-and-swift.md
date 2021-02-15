---
date: 2017-06-09 16:38
---
# ScriptingBridge with Swift - Communicating with Apps using AppleScript and Swift

![](https://www.brightdigit.com/wp-content/uploads/2017/06/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift-300x105.png)

**AppleScript**

**build an app in Xcode with the power of AppleScript**

1.  Write a separate AppleScript file and use the NSAppleScript API to execute and run the script.
1.  Use ScriptingBridge to work with AppleScript in Swift or Objective-C.

### The Drawbacks of ScriptBridging

**It should be noted if you intend to write an App for the Mac App Store there are restrictions as noted by Apple.**

[this article by Craig Hockenberry](https://www.objc.io/issues/14-mac/sandbox-scripting/)

**You can not use ScriptingBridge with an app in the Mac App Store.**

### Objective-C ScriptBridging to Swift ScriptBridging

**Objective-C**

[tools to prepare the code](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ScriptingBridgeConcepts/UsingScriptingBridge/UsingScriptingBridge.html#//apple_ref/doc/uid/TP40006104-CH4-DontLinkElementID_12)

**Tony Ingraldi of Majesty Software, has a great set of python scripts for creating the same code in Swift.**

[his repo on GitHub](https://github.com/tingraldi/SwiftScripting)

[his blog post here](https://majestysoftware.wordpress.com/2015/03/31/swift-scripting-part-1/)

### ScriptBridging with Safari

**by writing an app which pulls the tab urls out of a Safari window.**

[here](https://github.com/brightdigit/jURLnal)

##### Building the Swift Code from AppleScript Definition

[SwiftScripting repo on GitHub](https://github.com/tingraldi/SwiftScripting)

```swift
pip install clang
sdef /Applications/Safari.app > Safari.sdef
sdp -fh --basename Safari Safari.sdef
./sbhc.py Safari.h
./sbsc.py Safari.sdef

```

1.  pip install clang - ensures clang is installed for python
1.  sdef /Applications/Safari.app > Safari.sdef - gets the scripting definition from the specified script- able application
1.  sdp -fh --basename Safari Safari.sdef - transforms a scripting definition to an Objective-C header file
1.  ./sbhc.py Safari.h - transforms the Objective-C header file to Swift
1.  ./sbsc.py Safari.sdef - extracts the enums from the standard definition to Swift

-   Safari.sdef - the scripting definition file, which is used to build the code
-   Safari.h - the objective-c header file, which we would use if we were doing objective-c directly or using objective-c bridging
-   Safari.swift - the primary file containing the main ScriptingBridge API to the application
-   SafariScripting.swift - the nessecary enums needed by the ScriptingBridge API for the application

##### Using the ScriptBridging API for Safari

```swift
if let application = SBApplication(bundleIdentifier: "com.apple.Safari") {
  let safariApplication = application as SafariApplication
  let safariWindows = safariApplication.windows?().flatMap({ $0 as? SafariWindow })
  ...
}

```

[SBApplication](https://developer.apple.com/documentation/scriptingbridge/sbapplication)

```swift
SafariApplication
```

```swift
windows
```

[SBElementArray](https://developer.apple.com/documentation/scriptingbridge/sbelementarray)

```swift
SafariWindow
```

```swift
let safariWindow = safariWindows?.first
let safariTab = safariWindow?.tabs?().firstObject as? SafariTab
let url = safariTab?.URL

```

1.  let safariWindow = safariWindows?.first - get the first Safari window
1.  let safariTab = safariWindow?.tabs?().firstObject as? SafariTab - get the first tab of the Safari window and cast it to SafariTab
1.  let url = safariTab?.URL - get the url of that particular tab

[the repo for the sample app](https://github.com/brightdigit/jURLnal)

[jURLnal](https://github.com/brightdigit/jURLnal)

### Conclusion

1.  We have used the standard ScriptBridging tools to build the standard definition and Objective-C header file of Safari’s AppleScript API.
1.  We used a set of python scripts from Tony Ingraldi of Majesty Software to convert the Objective-C header file and standard definition to Swift code.
1.  Added the two Swift files to our project and used the API to extract the windows and tabs of the currently open Safari application.

[the disqus forum](https://brightdigit.com/blog/17/06/09/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift/#disqus_thread)

[contact me at our form here](https://brightdigit.com/#contact-us)