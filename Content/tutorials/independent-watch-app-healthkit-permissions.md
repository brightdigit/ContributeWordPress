---
date: 2019-09-17 14:45
tags: apple-watch
---
In the development of my latest app which is an Independent Watch App
that uses
[HealthKit](https://learningswift.brightdigit.com/healthkit-getting-started/),
I ran into an issue with App Store Connect. **App Store Connect will
complain about missing** ***Purpose Strings*****, that is the messages
display to the user when access permission is asked for health
information.**

> **ITMS-90683: Missing Purpose String in Info.plist** - Your app\'s
> code references one or more APIs that access sensitive user data. The
> app\'s Info.plist file should contain a NSHealthShareUsageDescription
> key with a user-facing purpose string explaining clearly and
> completely why your app needs the data. Starting Spring 2019, all apps
> submitted to the App Store that access user data are required to
> include a purpose string. If you\'re using external libraries or SDKs,
> they may reference APIs that require a purpose string. While your app
> might not use these APIs, a purpose string is still required. You can
> contact the developer of the library or SDK and request they release a
> version of their code that doesn\'t contain the APIs. Learn more
> ([https://developer.apple.com/d\
> ocumentation/uikit/core_app/protecting_the_user_s\_privacy](https://developer.apple.com/documentation/uikit/core_app/protecting_the_user_s_privacy)).
>
> \
> **ITMS-90683: Missing Purpose String in Info.plist** - Your app\'s
> code references one or more APIs that access sensitive user data. The
> app\'s Info.plist file should contain a NSHealthUpdateUsageDescriptio\
> n key with a user-facing purpose string explaining clearly and
> completely why your app needs the data. Starting Spring 2019, all apps
> submitted to the App Store that access user data are required to
> include a purpose string. If you\'re using external libraries or SDKs,
> they may reference APIs that require a purpose string. While your app
> might not use these APIs, a purpose string is still required. You can
> contact the developer of the library or SDK and request they release a
> version of their code that doesn\'t contain the APIs. Learn more
> ([https://developer.apple.com/d\
> ocumentation/uikit/core_app/protecting_the_user_s\_privacy](https://developer.apple.com/documentation/uikit/core_app/protecting_the_user_s_privacy)).

This is regardless of whether the Property List in the Watch App
Extension includes these properties.

## The Resolution

To resolve this issue, create a new *Property List* **with no target
set** in your project at the root:

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/09/Screen-Shot-2019-09-17-at-2.25.49-PM.png){.wp-image-667}

Inside that *Property List* add (or copy) the required *HealthKit
Property Strings* to your new *Property List* file.

![](https://learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/09/Screen-Shot-2019-09-17-at-2.27.48-PM.png){.wp-image-668}

In short, these properties should be the only required properties in
your file. Lastly, set this *Property List* file as the property list
file of your app container target:

1.  Click on the Project File in the Navigator on the right.
2.  Select the *App Container* target.\
    *This should be obvious since the target does not come with a
    Property List file on initial creation in Xcode.*
3.  Go to the **Build Setting** tab on the top.
4.  Search for **Info.plist File**
5.  In the field value enter the name of the newly created Info.plist
    file with your HealthKit Privacy strings set.

![](https://i1.wp.com/learningswift.brightdigit.com/wp-content/uploads/sites/2/2019/09/Screen-Shot-2019-09-17-at-2.32.21-PM.png?fit=640%2C325&ssl=1){.wp-image-669}

Now go ahead and archive and distribute your app to App Store Connect
from the organizer as usual. App Store should be happy moving forward.

## In Summary\...

-   App Store Connect requires both your Apple Watch App Extension and
    your App Watch App Container to contain an Info.plist file with
    NSHealthUpdateUsageDescription and NSHealthShareUsageDescription
    strings set.
-   To fix this, create a new Info.plist file with those settings set
    for your App Container.
-   The new Info.plist is not to be included in your App Container but
    rather set as your App Container\'s Info.plist file in Build
    Settings.

Perhaps this will be fixed in the Independent Apple Watch App template
in the future or in App Store Connect but for now you can easily publish
your Independent Watch App to the TestFlight and the App Store.