---
title: Integrating ​​​C++ Libraries with Swift - How Speculid Is Built
date: 2019-01-16 05:00
description: Previously, I discussed using Objective-C to integrate C++ with Swift
  in Speculid. Today, I'm going to talk about the challenges of using C++.
featuredImage: /media/wp-images/learningswift/2018/10/cswift.png
---
In the article [Objective-C and Swift - Being
Friendly](/tutorials/objective-c-and-swift-being-friendly/),
I talked about how I used Objective-C to integrate C++ libraries with
Swift in [Speculid](https://Speculid.com). Today, I'm going to talk
about the challenges of using C++ Libraries in your XCode project.

[Speculid is a completely open source application](https://Speculid.com)
built with the latest version of Xcode (10.1) primarily in Swift (I’ll
explain why primarily and not only). With Speculid, you **can take a
single graphic and build it into a complete App Icon or Image Set.**

Therefore, this meant packaging any required dependencies within the
.App package. At first, I thought about including *Inkscape* and
*ImageMagick* with the installation. However the fact that *Inkscape*
has other dependencies such as *XQuartz* meant that would be too
cumbersome. Therefore, Cairo and librsvg became the obvious choice.

<img src="/media/wp-images/learningswift/2018/11/440px-Librsvg.svg_-e1541095349996.png" class="full-size" />

<img src="/media/wp-images/learningswift/2018/11/500px-Cairo_banner_1.svg_-e1541095276942.png" class="full-size" />

## Integrating Cairo and librsvg with Swift

The first version of Speculid required the installation of two software
packages: [Inkscape](https://inkscape.org) and
[ImageMagick](https://www.imagemagick.org). Each application would be
used in some combination to read, manipulate, and export SVG, PNG, JPEG,
or PDF files. As a result, **requiring these software packages made the
user experience clumsy and difficult.** However, since they are complete
applications including both of these packages would be cumbersome as
well. That’s why I looked into integrating C++ libraries - specifically
two of them: [**Cairo**](https://cairographics.org) **and**
[**libRSVG**](https://developer.gnome.org/rsvg/)**.**

Used by several software packages, **Cairo** and **librsvg** are the
leading libraries for the development of graphics and SVG manipulation
software especially in the open source and Linux communities. **So with
Speculid v2.0, I integrated and packaged these libraries as the primary
means of reading PNG and SVG and exporting PDF and PNG files**. Above
all, both of these libraries can be installed on your Mac through
[**HomeBrew**](http://brew.sh), using the command:

`brew install cairo librsvg`

Now we'll need to make sure to copy and link the files.

<figure>
<img src="/media/wp-images/learningswift/2019/01/xe7za0jttem-e1547589614468-1024x513.jpg" class="wp-image-350" />
</figure>

## Properly Linking and Copying C++ Libraries

<span style="color: #191e23;"><span
style="caret-color: #191e23; background-color: #ffffff;">I</span></span>n
order to use C++ libraries, **we can either compile every piece of C++
code as their individual libraries within Speculid or integrate the
already compiled libraries.** At first it seemed compiling the code
would be the most clean and efficient way, except for the fact that each
library had many requirements as well as special flags for compiling
each library. Therefore I decided to take a different route and use the
compiled libraries themselves.

After installing the libraries using HomeBrew, copy the directories for
Cairo and librsvg to your project folder. **HomeBrew stores its
applications and libraries at:**
```
    /usr/local/Cellar
```

Therefore, **Cairo**, for instance, would be located at:
```
    /usr/local/Cellar/cairo
```

Once it's copied to your project, there are three spots the files need
to be under **build phases:**

-   **Link With Libraries - **all **.dylib** files need to be listed
-   **Copy Files -** all **.dylib** files need to be copied to the
    **Frameworks** folder
-   **Headers -** all **.h** files need to be listed under **Project**

**After that, you should be good to go.** If you have any issues with
building the application, **double check all the proper files are listed
under build phases in your Xcode projec**t.

<figure>
<img src="/media/wp-images/learningswift/2019/01/eiwvoa9zb10-e1547589663680-1024x512.jpg" class="wp-image-351" />
</figure>

### Staying Organized in Dependency Hell

With your C++ libraries linked and embedded, you run the app and it
works without a hitch. So then you archive and package your product and
send it off for someone to run and they get something like this:
```
    dyld: Library not loaded: @loader _path/../lib/libintl.8.dylib
```

**Unfortunatley libraries like Cairo and librsvg, often have
dependencies of their own which are required.** However there are a few
commands to help with this:

-   `otool -L`  
    If we want to find out actual dependencies, this command displays
    names and version numbers of libraries which are required and used
    by a particular library.
-   `brew deps —tree`  
    In order to make sure we have all the dependencies installed on the
    developer machine, we can use HomeBrew to find their dependencies
    installed along with the package. Once they are installed we can add
    them to our project and include them in the App package
-   `install_name_tool`  
    Once the dependencies are copied and included with our App, we need
    to update the paths used to look for our dependencies.

#### Gathering Dependencies

Firstly we need to make sure we've included all the dependencies in your
App by adding the dynamic libraries described by `otool -L`. For
instance if we ran `otool -L` on the Cairo library we get this:
```
    $ otool -L libcairo.2.dylib
    /usr/local/Cellar/cairo/1.14.12/lib/libcairo.2.dylib:
        /usr/local/opt/cairo/lib/libcairo.2.dylib (compatibility version 11403.0.0, current version 11403.12.0)
        /usr/local/opt/pixman/lib/libpixman-1.0.dylib (compatibility version 35.0.0, current version 35.0.0)
        /usr/local/opt/fontconfig/lib/libfontconfig.1.dylib (compatibility version 12.0.0, current version 12.1.0)
        /usr/local/opt/freetype/lib/libfreetype.6.dylib (compatibility version 22.0.0, current version 22.0.0)
        /usr/local/opt/libpng/lib/libpng16.16.dylib (compatibility version 51.0.0, current version 51.0.0)
        /usr/lib/libz.1.dylib (compatibility version 1.0.0, current version 1.2.11)
        /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices (compatibility version 1.0.0, current version 50.0.0)
        /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.0.0)
        /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation (compatibility version 150.0.0, current version 1450.16.0)
        /System/Library/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics (compatibility version 64.0.0, current version 1129.5.0)
        /System/Library/Frameworks/CoreText.framework/Versions/A/CoreText (compatibility version 1.0.0, current version 1.0.0)
```

Therefore, we see Cairo requires a few libraries like *pixman*.
Thankfully, **we can get the HomeBrew dependency tree by using the
command**  
`brew deps —tree`:
```
    $ brew deps -tree cairo
    fontconfig
    freetype
    gettext
    glib
    libffi
    libpng
    pcre
    pixman
```

Thankfully now, if we are missing *pixman* on our development machine,
we can install it using `brew install pixman` and then copy the HomeBrew
cellar directory for *pixman* to our project folder.

Again make sure the dynamic libraries are part of the build process
under build phases. In other words, you should have something like this
under **Build Phases**:

<figure>
<img src="/media/wp-images/learningswift/2018/10/pixman_example.png" class="full-size" />
</figure>

#### Updating References with `install_name_tool`

Now that all the required dependencies are included with the
applications, we need to tell Speculid where to look for
dependenciesndencies where to look for it’s respective dependencies.
That’s where `install_name_tool` comes in.

##### Writing a Script to Search and Update Dynamic Libraries

So for this process we are going to write a script to update our
dependencies, it will need to do the following:

1.  Look for the dependencies using `otool -L` which are not system
    installed
2.  Update the *id* of each dynamic library and the path to use @rpath
    which is the run-time search path the application uses.
3.  Go through each file in our `Frameworks` folder and…
4.  Again update the *id* as well as the path to use `@rpath`
5.  Use `otool -L` to look for each dependency of that dependency
6.  And update the search path to use `@rpath`

Here is the result:
```
    #!/bin/sh

    LIBS=`otool -L "$1" | grep "/opt\|Cellar" | awk -F' ' '{ print $1 }'`
    for lib in $LIBS; do
      install_name_tool -id @rpath/`basename $lib` "`dirname $1`/Frameworks/`basename $lib`"
      install_name_tool -change $lib @rpath/`basename $lib` "$1"
    done

    FRAMEWORKS_FOLDER_PATH="`dirname $1`/Frameworks/"
    deps=`ls "$FRAMEWORKS_FOLDER_PATH" | awk -F' ' '{ print $1 }'`
    for lib in $deps; do
      install_name_tool -id @rpath/`basename $lib` "`dirname $1`/Frameworks/`basename $lib`"
      install_name_tool -change $lib @rpath/`basename $lib` "$1"
      dylib="`dirname $1`/Frameworks/`basename $lib`"
      deps=`otool -L "$dylib" | grep "/opt\|Cellar" | awk -F' ' '{ print $1 }'`
      for dependency in $deps; do
          install_name_tool -change $dependency @rpath/`basename $dependency` "$dylib"
        done
    done
```

Let’s break this down...

##### Breaking Down Updating Dynamic Libraries
```
    LIBS=`otool -L "$1" | grep "/opt\|Cellar" | awk -F' ' '{ print $1 }'`
```

1.  Look for the dependencies using `otool -L` which are not system
    installed  
    $1 is the path to the executable or
    `${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}`. `otool -L` will list all
    the dependencies. Piping to grep, we can filter results which are
    not system installed but in locations like `/usr/local/opt` are
    installed via HomeBrew. `awk -F' ' '{ print $1 }'` will print the
    results into a format we can use in a for loop.

<!-- -->
```
    for lib in $LIBS; do
      install_name_tool -id @rpath/`basename $lib` "`dirname $1`/Frameworks/`basename $lib`"
      install_name_tool -change $lib @rpath/`basename $lib` "$1"
    done
```

1.  Update the *id* of each dynamic library and the path to use @rpath
    which is the run-time search path the application uses.  
    Here we go through each dependency and update the identification
    name and the path to look for the dependency in our framework to use
    `@rpath`.

<!-- -->
```
    FRAMEWORKS_FOLDER_PATH="`dirname $1`/Frameworks/"
    deps=`ls "$FRAMEWORKS_FOLDER_PATH" | awk -F' ' '{ print $1 }'`
    for lib in $deps; do
```

1.  Go through each file in our `Frameworks` folder and…

<!-- -->
```
      install_name_tool -id @rpath/`basename $lib` "`dirname $1`/Frameworks/`basename $lib`"
      install_name_tool -change $lib @rpath/`basename $lib` "$1"
```

1.  Again update the *id* as well as the path to use `@rpath`

<!-- -->
```
      dylib="`dirname $1`/Frameworks/`basename $lib`"
      deps=`otool -L "$dylib" | grep "/opt\|Cellar" | awk -F' ' 
```

1.  Use `otool -L` to look for each dependency of that dependency  
    Calculate the path to the dependency and run `otool -L` to get its
    dependencies.

<!-- -->
```
    for dependency in $deps; do
        install_name_tool -change $dependency @rpath/`basename $dependency` "$dylib"
    done
```

1.  And update the search path to use `@rpath`

Now the application and framework should contain all that’s needed for
our application to run on another machine.

*The latest version of the script can be found*
[*here*](https://gist.github.com/leogdion/88516f580108075c8b2d05ab7f895fd0)*.*

## Conclusion

Last time we learned [how to optimize Objective-C and Swift code so they
work well
together](https://learningswift.brightdigit.com/objective-c-and-swift-being-friendly/).
Today we learned how to:

-   integrate C++ libraries from HomeBrew into our project
-   verify all dependencies are included
-   fix references using install\_name\_tool and a script

So with Speculid, the Swift code which run the main interface can talk
to the Objective-C which interfaces with the C++ libraries. No need for
external applications or cumbersome installations.

If interested check out [the presentation I did at Ann Arbor Cocoaheads
on this very topic](https://www.youtube.com/watch?v=SxW5fs7_o18):

> youtube https://www.youtube.com/watch?v=SxW5fs7o18

What are some challenges you face using C++ Libraries? Have you ever
using any libraries for an iOS app? Let [me know on twitter.](https://twitter.com/intent/tweet?text=Integrating%20%E2%80%8B%E2%80%8B%E2%80%8BC++%20Libraries%20with%20Swift%20-%20How%20Speculid%20Is%20Built&url=https://brightdigit.com/tutorials/integrating-c-plus-plus-swift&via=leogdion)