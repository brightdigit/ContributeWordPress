---
date: 2018-12-19 08:05
---
# Swift 5.0 and XCode 10.1 - Using a Custom Toolchain


Just as Swift 4.2 brought some interesting features, the release of Swift 5.0 will bring several as well such as raw strings, dynamically callable types, and compactMapValues for dictionaries. Of course, the biggest feature of Swift 5.0 is ABI stability.



The good news is you can try out these new features now by using the Swift 5.0 development branch. 


## Using Custom Toolsets


If you use the swift package manager, I highly recommend taking a look at the swiftenv project by Kyle Fuller. As a frequent user of nvm and rbenv and other tools, this is great. However, Xcode is particular about using different toolchains and development versions of Swift, so it takes a bit of tweaking to get it to work.



Here's how:


1.  Download and Install the Swift 5.0 Development Branch Toolchain.
1.  Create Your Project or Target in Xcode 10.1
1.  Go to the Top Menu and Select Xcode...Toolchains... Swift 5.0 Snapshot...


Xcode Toolchain Menu Item



If you try to compile you will get an error saying no SWIFT_VERSION is set. So you try to set the SWIFT_VERSION, but 5.0 is not available under Build Settings and even if you try to set it manually by editing the .pbxproj, Xcode will say 5.0 is not supported. So now what? Well, you have two options: Use the Legacy Build System or hack Xcode program language support.


## Option #1: Using the Legacy Build System for Swift 5.0


To use the Legacy Build System which essentially ignores the SWIFT_VERSION:



Xcode Project Settings Menu Item


1.  Go to the Top Menu and Select File...Project Settings
1.  Under Shared Project Settings section select Legacy Build System. 


Xcode Project Settings Window



You should be good to go. However, if you wish to use the New Build System, you'll need to do a bit of tweaking of the Xcode application files.


## Option #2: Using the New Build System by Hacking Xcode


If you wish to use the New Build System, you'll need to edit a .xcspec file inside the Xcode.app. Thanks to some help from the Swift team here is how:


1.  In your favorite editor, open the file: 

```swift
/Applications/Xcode.app/Contents/PlugIns/Xcode3Core.ideplugin/Contents/SharedSupport/Developer/Library/Xcode/Plug-ins/XCLanguageSupport.xcplugin/Contents/Resources/Swift.xcspec
```

1.  Find the section with SupportedLanguage

```swift
        SupportedLanguageVersions = (
 
            3.0,
            
            4.0,

            4.2      
        );
        
        LanguageVersionDisplayNames = {
            
            3.0 = "Swift 3";
            
            4.0 = "Swift 4";
            
            4.2 = "Swift 4.2";       
        };

```

1.  Add 5.0 as a SupportedLanguageVersions and add a label for it under LanguageVersionDisplayNames (such as "5.0-dev")

```swift
        SupportedLanguageVersions = (
 
            3.0,
            
            4.0,

            4.2,

            5.0
        
        );
        
        LanguageVersionDisplayNames = {
            
            3.0 = "Swift 3";
            
            4.0 = "Swift 4";
            
            4.2 = "Swift 4.2";
            
            5.0 = "Swift 5.0-dev";
        
        };

```


Now all you'll need to do is select the SWIFT_VERSION as the display name you have set up for Swift 5.0. Now you are using both the New Build System and Swift 5.0.



For more details on Swift 5.0 and its features, check out this article from Paul Hudson and stay tuned for more articles here on how to take advantage of Swift 5.0 and its new features.