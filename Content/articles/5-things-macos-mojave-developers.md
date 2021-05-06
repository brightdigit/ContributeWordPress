---
date: 2018-08-27 07:42
---
[**Apple just announced the upcoming macOS update called Mojave for
developers (version 10.14).** The final release date will probably be
some time in September or October and it\'s already creating buzz in the
tech world. Here are 5 ways this could affect those with macOS apps
already out there:]{style=";"} ![desktop screenshot of Mojave for
developers](https://brightdigit.com/wp-content/uploads/2018/08/macOS-Mojave-Screenshot.jpg){.aligncenter
.size-full .wp-image-1289 width="1280" height="800"}

# Phasing Out 32 Bit Support for Applications

[64-bit computers have been around for at least 10 years. However, many
older applications are still built with only 32-bit support. This means
macOS has had to support both 32-bit and 64-bit apps.Until
now.]{style=";"} Apple has announced that **Mojave will be the final OS
to support 32-bit.  **With this change in Mojave for developers, **you
have one year to get ready and update your build** for 10.15, the first
64-bit only OS from Apple. Otherwise your ancient 32-bit app will no
longer work in the fall of 2019.

# Enhanced App Permissions in Mojave for Developers

![](https://brightdigit.com/wp-content/uploads/2018/07/Screen-Shot-2018-07-13-at-2.57.43-PM.png){.aligncenter
.size-full .wp-image-1257 width="1560" height="1370"} macOS Mojave now
requires your apps to request permission when using the **camera,
microphone, or any automation** (i.e. AppleScript and Apple Events).
This means if your app uses any of those functionalities, **you\'ll need
to update your code to ask for those permissions as well as handle when
permission is not granted.**

# Dark Mode and Mojave

[Dark mode is the ability to change UI to use a more *light on
dark *theme. Developers love this and it can look slick as long as apps
are built with this in mind.** To take advatange, developers can look at
[Apple\'s
documentation](https://developer.apple.com/documentation/appkit/supporting_dark_mode_in_your_interface) on
how to support Dark mode.** For websites, make sure your [background
color is set
properly](https://twitter.com/kkuldar/status/1006208146464002049) and
stay up to date on possible queries you can add to your styling to keep
it looking good in dark mode.]{style=";"}

# Safari Privacy Features in Mojave

[With Mojave, Safari users will have to start explicitly giving
permission for certain websites to track them. If you run a website
which is using any sort of tracking or pixel targeting, keep note of
these changes. You may have to tweak how you track your user
interactions for your site.]{style=";"}

# UIKit Coming to the Mac

\[caption id=\"attachment_1285\" align=\"aligncenter\"
width=\"896\"\]![example of \"Marzipan\" in action on
Mojave](https://brightdigit.com/wp-content/uploads/2018/07/Screen-Shot-2018-08-06-at-4.35.30-PM-e1533587827702.png){.size-full
.wp-image-1285 width="896" height="700"} example of \"Marzipan\" in
action on Mojave with the Stocks app\[/caption\] [UIKit is the framework
for developing the user interface of iPhone and iPad apps. There have
been rumors of "Marzipan" a bridge which brings UIKit over to the
Mac. ]{style=";"}[In this post on macOS development for iOS developers,
we speculated about what "Marzipan" could
be.](https://brightdigit.com/blog/2018/02/16/macos-development-ios-developers/)
Well t[his year they announced that they will be bringing it to Mac
developers\... probably next year. They have also given us a preview in
Mojave with apps like Home, Stocks, News and Calculator. While we can
see the resulting apps, there are still plenty of questions
like:]{style=";"}

-   [How will these apps look? ]{style=";"}
-   [How easy will the framework be to use? ]{style=";"}
-   [Will it be easy to build a Mac App and an iOS App at the same
    time?]{style=";"}

[For those building macOS Apps right now, this means there is time to
prepare your app by:]{style=";"}

-   Making sure you are organizing your code to use newer APIs and
    methodoligies
-   Avoid deprecated code and APIs
-   Use other frameworks and APIs properly which are available across
    Apple\'s platforms such as CoreData, Metal, CoreML, and more\...

# Conclusion

**With all the new features in Mojave for developers, Apple has given us
a roadmap for the first time.** This means we have time till 4Q 2019 to:

-   Update macOS apps to **use 64-bit only**
-   **Support Dark Mode** in your UI
-   **Support Enhanced App Permissions** (camera, microphone, etc\...)
-   **Clean up your architecture** to use cross platform frameworks and
    APIs properly.

If you have a spare Mac or a spare partition on your hard drive, go
ahead download and try macOS Mojave through the [developer
program](http://developer.apple.com) or the [beta
program](https://beta.apple.com/sp/betaprogram/) today. Do all these
changes in Mojave have you wondering just how you\'re going to keep your
app current? If you need help updating your macOS app, [contact Bright
Digit today.](https://brightdigit.com/contact/)