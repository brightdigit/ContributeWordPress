---
date: 2018-11-07 07:55
---
# Asset Catalogs, Image Sets, and App Icons


Asset catalogs are collections of specialized files (such as graphics files) as well as JSON files containing metadata. The metadata from the JSON files are used for organizing the specialized files and denoting their purpose within the set. In the case of graphic sets like Image Sets, they contain several pieces of information.






## Image Sets

```swift
{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "apple-watch@1x.png",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "filename" : "apple-watch@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "filename" : "apple-watch@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}

```

-   filename - the file name for the particular image
-   scale - the designated scale for the image file, as of now there are four scales used:
-   

        default unspecified - vector pdf file for any display



-   

        1x - iPhones up to 3GS, iPod Touch up to 3rd Gen



-   

        2x - iPhone 4, iPhone 4s, iPhone 5, iPhone 5c, iPhone 5s, iPhone SE, iPhone 6, iPhone 6s, iPhone 7, iPhone 8, iPhone Xr, iPod Touch 4th Generation and Up, MacBook Pro 3rd Generation and up, MacBook (2015 and newer)



-   

        3x - iPhone 6+, iPhone 6s+, iPhone 7+ iPhone 8+ iPhone X, iPhone Xs, iPhone Xs Max, iMac 4K and 5K



-   idiom - the designated device and purpose for the particular image file

### Idioms

-   universal - The default value, designates the image file works on any device and platform.
-   iphone - The image is for iPhone devices.
-   ipad - The image is for iPad devices.
-   mac - The image is for Mac computers.
-   watch - The image is for the Apple Watch devices.
-   tv - The image is for Apple TV.

-   ios-marketing - An image for the App Store icon
-   watch-marketing - An image for the App Store icon.

## App Icons

```swift
...
{
  "size" : "24x24",
  "idiom" : "watch",
  "scale" : "2x",
  "role" : "notificationCenter",
  "subtype" : "38mm"
},
...

```

-   size the size of the image file in points, this designates whether the image
-   subtype - typically used for Apple Watch icons, they designate what Apple Watch size the image file is for
-   role - typically used for Apple Watch icons, they designate a specific purpose for the icon. The values could be:
-   

        appLauncher - An image shown app launcher.



-   

        companionSettings - An image for the Apple Watch Settings app



-   

        notificationCenter - An image for the notification center on watchOS.



-   

        quickLook - An image used for a short look notification



-   

        longLook - An image used for a long look notification




[series of blog posts on automating that process for more details.](https://learningswift.brightdigit.com/category/building-icons-and-image-sets/)