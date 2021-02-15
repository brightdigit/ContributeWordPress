---
date: 2018-08-27 07:42
---
# 5 Things to Know About macOS Mojave for Developers


Apple just announced the upcoming macOS update called Mojave for developers (version 10.14). The final release date will probably be some time in September or October and it's already creating buzz in the tech world. Here are 5 ways this could affect those with macOS apps already out there:


![desktop screenshot of Mojave for developers](https://brightdigit.com/wp-content/uploads/2018/08/macOS-Mojave-Screenshot.jpg)

# Phasing Out 32 Bit Support for Applications


64-bit computers have been around for at least 10 years. However, many older applications are still built with only 32-bit support. This means macOS has had to support both 32-bit and 64-bit apps.Until now.


**Mojave will be the final OS to support 32-bit.  **

**you have one year to get ready and update your build**

# Enhanced App Permissions in Mojave for Developers

![](https://brightdigit.com/wp-content/uploads/2018/07/Screen-Shot-2018-07-13-at-2.57.43-PM.png)

**camera, microphone, or any automation**

** you'll need to update your code to ask for those permissions as well as handle when permission is not granted.**

# Dark Mode and Mojave


Dark mode is the ability to change UI to use a more light on dark theme. Developers love this and it can look slick as long as apps are built with this in mind. To take advatange, developers can look at Apple's documentation on how to support Dark mode. For websites, make sure your background color is set properly and stay up to date on possible queries you can add to your styling to keep it looking good in dark mode.


# Safari Privacy Features in Mojave


With Mojave, Safari users will have to start explicitly giving permission for certain websites to track them. If you run a website which is using any sort of tracking or pixel targeting, keep note of these changes. You may have to tweak how you track your user interactions for your site.


# UIKit Coming to the Mac

![example of "Marzipan" in action on Mojave](https://brightdigit.com/wp-content/uploads/2018/07/Screen-Shot-2018-08-06-at-4.35.30-PM-e1533587827702.png)


UIKit is the framework for developing the user interface of iPhone and iPad apps. There have been rumors of “Marzipan” a bridge which brings UIKit over to the Mac. 


[In this post on macOS development for iOS developers, we speculated about what ”Marzipan” could be.](https://brightdigit.com/blog/2018/02/16/macos-development-ios-developers/)


his year they announced that they will be bringing it to Mac developers... probably next year. They have also given us a preview in Mojave with apps like Home, Stocks, News and Calculator. While we can see the resulting apps, there are still plenty of questions like:


-   How will these apps look? 
-   How easy will the framework be to use? 
-   Will it be easy to build a Mac App and an iOS App at the same time?


For those building macOS Apps right now, this means there is time to prepare your app by:


-   Making sure you are organizing your code to use newer APIs and methodoligies
-   Avoid deprecated code and APIs
-   Use other frameworks and APIs properly which are available across Apple's platforms such as CoreData, Metal, CoreML, and more...

# Conclusion

**With all the new features in Mojave for developers, Apple has given us a roadmap for the first time. **

-   Update macOS apps to use 64-bit only
-   Support Dark Mode in your UI
-   Support Enhanced App Permissions (camera, microphone, etc...)
-   Clean up your architecture to use cross platform frameworks and APIs properly.

[developer program](http://developer.apple.com)

[beta program](https://beta.apple.com/sp/betaprogram/)

[contact Bright Digit today.](https://brightdigit.com/contact/)