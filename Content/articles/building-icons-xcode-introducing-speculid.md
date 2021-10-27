---
title: Building Icons in Xcode - Introducing Speculid
date: 2016-10-12 14:25
description: "We developed Speculid for Mac \u2013 Now you can take your vector graphics
  and raster images and render them to all their correct sizes"
featuredImage: /media/images/brightdigit/2016/10/XcodeUnorganizedAssets.png
---
<img src="https://www.brightdigit.com/wp-content/uploads/2016/10/XcodeUnorganizedAssets.png" class="aligncenter size-full wp-image-289" width="1024" height="680" />
Have you ever had a difficult time getting all the correct sizes
rendered for your graphics when you are developing an app in Xcode? *1x,
2x, 3x, 1x 60 x 60, 2x 60 x 60, etc...*
<img src="https://www.brightdigit.com/wp-content/uploads/2016/10/Diagram.png" class="aligncenter size-full wp-image-287" width="850" height="480" />
Well, that's why we developed **[Speculid for the
Mac](http://www.speculid.com/)**. Now you can take your scalable vector
graphics and large raster images and render them to all their correct
sizes as part of the build process. You create a small `json` file:

    {
      "set" : "Assets.xcassets/Raster Image.imageset",
      "source" : "layers.png",
      "geometry" : "128"
    }

or

    {
      "set" : "Assets.xcassets/iOS AppIcon.appiconset",
      "source" : "geometry.svg"
    }

<img src="https://www.brightdigit.com/wp-content/uploads/2016/10/SetExample.png" class="size-full wp-image-288 alignnone" width="320" height="240" />
It **creates the appropiate png or pdf files for your Image Set or App
Icon Set.** based what is setup in the Asset Library **Speculid is
currently available on GitHub as well as [Homebrew](http://brew.sh/)**.
For more details take a look at the **[ReadMe on
GitHub](https://github.com/brightdigit/speculid)** and join us on
**[gitter](https://gitter.im/speculid/Lobby)** if you have any questions
and let us know what you think.