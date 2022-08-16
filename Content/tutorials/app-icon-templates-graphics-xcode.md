---
title: App Icon Templates - Building Graphics For Xcode
date: 2018-10-29 08:22
description: Asset Catalogs are the key component in Xcode. Today we are going to
  talk about using app icon templates in Sketch and Photoshop.
featuredImage: /media/wp-images/learningswift/2018/10/templates-export.jpg
---
Asset Catalogs are the key component in Xcode project for storing
colors, sprites, metadata, and of course graphics and managing those
graphics can be a challenge. Today we are going to talk about using app
icon templates in Sketch and Photoshop.

## Using App Icon Templates

App Icon templates offer a simple and predictable way to create your
assets while using graphics applications designers are familiar with. We
are going to look at the top two graphic editors: **Sketch** and
**Photoshop**.

### Sketch

> youtube https://youtu.be/4UmzRh4ENY

In the last few years, Sketch has grown to be one of the leading
applications used by graphic designers especially in the area of mobile
application development. Luckily they already supply an app icon
template to use.

1.  Run your Sketch Application and the launching dialog should appear
    showing various templates built into Sketch.
2.  Select the **iOS App Icon** template. Now, you should see the
    template with various sizes of the app icon.
3.  Go ahead and edit the largest icon. As you edit the large icon, you
    changes should be reflected in your other app icon sizes.
4.  When completed, go to the top menu and select **Export**. In the
    Export dialog, select all the sizes you wish to export and then
    choose the folder you wish to export to.

If you go to that folder, you should see all your icon sizes. From there
you can drag the files into your Asset catalog App Icon slots.

Sketch offers a very simple way to export the set of graphics.
Obviously, each time an edit needs to be made, Sketch will need to be
accessed and the multiple files will need to be updated in the repo.

### Photoshop

> youtube https://youtu.be/yr6KsuP5j5A

Photoshop has been a well established graphics editor for over two
decades. However it isn’t quite as targeted toward application
development as Sketch so it isn’t geared as much towards that purpose.

Kindly enough Apple offers us UI templates and widget for Photoshop (as
well as constantly updated for Sketch) through their [Apple Design
Resources page](https://developer.apple.com/design/resources/).

1.  Go to the [Apple Design Resources
    page](https://developer.apple.com/design/resources/) and download
    the template for the OS you will be building for. In this case we
    will be using the iOS 12 version. **Please note - these downloads
    are quite large so make sure to do this ahead of time.**
2.  Unzip the template collection, go to the *Production Templates*
    folder. We’ll be using the standard *Template-AppIcons-iOS.psd*
    file. Open that psd file, opening Photoshop.
3.  Make sure we are generating image assets on save. Go to
    File...Generate...Image Assets and make sure it is checked.
4.  Go to your layers window and double click the layer named icon. This
    is the layer you will be editing directly and will be carried
    through to the other app icon sizes.
5.  Go to the folder containing the psd file you have opened. You should
    see a folder with the same name but including the suffix *-assets*.
    In there you should see all the icon sizes exported from the
    template.

Photoshop is the more established application but also less focused on
UI and App Icon development. The templates can be quite large and even
more cumbersome to open each time and edit can be made.

Ideally, we’d like to simply edit one file which can be included in our
repo and automatically generated on the build. That’s where building a
bash script to run on the build would be helpful.
