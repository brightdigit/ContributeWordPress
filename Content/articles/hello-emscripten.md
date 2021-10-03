---
date: 2014-04-01 14:22
---
It has been often said JavaScript is the assembly language of the web,
then I suppose that would make
[emscripten](https://github.com/kripken/emscripten/wiki) a compiler(or
transcompiler). [Emscripten](https://github.com/kripken/emscripten/wiki)
is powerful tool which is able to take compiled c/c++ byte code and
translate it to JavaScript. []{#more}[]{#more-758}Right now I am working
on taking the [game music emulator
library](https://code.google.com/p/game-music-emu/) and [making a
JavaScript library](https://github.com/leogdion/gmemujs) to play [nsf
(NES Sound Format)](http://en.wikipedia.org/wiki/NES_Sound_Format)and
other console music files playable on the browser. Let\'s take a basic
look at how to compile a JavaScript library from c/c++ code with our old
friend \"hello world\".

# Requirements and Components

First let\'s look at the requirements:

## Requirements

[NodeJS](http://nodejs.org/)
:   for building the project, this should be easy to install. Just
    follow the instructions on the website.

[Emscripten](https://github.com/kripken/emscripten)
:   for compiling the c+ code to JavaScript. On my mac using the
    portable installation this seemed to work fine. On windows, the nsis
    package worked well. Just make sure to add the paths to the binary
    executables (ie emcc)
    ::: {.well}
    On Windows XP, I had to install [Java](http://java.com/en/) and the
    [Visual C++ 2010 Redistributable
    Package](http://www.microsoft.com/en-us/download/details.aspx?id=5555).
    You may need to install it for Windows Vista, 7, and 8.
    :::

[Grunt](http://gruntjs.com/)

:   once you\'ve installed nodejs and npm, install the grunt command
    globally using npm

        npm -g install grunt

## Components

package.json
:   for what node modules that need to be installed

Gruntfile.js
:   the \"make\" file

public
:   web site with the sample

src/c/hello-emscripten.c
:   sample c code

src/js/hello-emscripten.js
:   sample js code to interface with the c code

# Transcompiling

The c code in this case would be for a static library. In order to
compile the c code to JavaScript, we simply run:

    emcc src/c/hello-emscripten.c

This will give a map file and a usable JavaScript file. The JavaScript
file a.out.js contains a global Module you can then access to call the c
methods. However you need the expose the methods you would like to call.
In this case we use:

    emcc -s EXPORTED_FUNCTIONS=['_hello_world'] src/c/hello-emscripten.c

The other arguments which are passed include optimizations and cleaning
warnings:

    emcc -s EXPORTED_FUNCTIONS=['_hello_world'] -O2 -o tmp/hello-emscripten.js
    \ -Wno-deprecated -Qunused-arguments -Wno-logical-op-parentheses src/c/hello-emscripten.c

For more details on options, look at the documentation
[here:](https://github.com/kripken/emscripten/blob/master/src/settings.js)
<https://github.com/kripken/emscripten/blob/master/src/settings.js>

# Interfacing with the code

The a.out.js gives you a variable called **Module**. All Modules have
four methods which are mainly used:

`ccall(functionName, jsReturnType, [jsparameterTypes], [args])`
:   Calls the encapsulated c method. The JavaScript type is either
    number or string.

`cwrap(functionName, jsReturnType, [jsparameterTypes])`
:   Creates a JavaScript method, which can be called directory. It is to
    [bind](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)
    what ccall is to
    [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call).

`getValue(ptr, type)`
:   Gets the value based the pointer.

`setValue(ptr, value, type)`
:   Sets the value based on the pointer. The type must be one of
    i8,i16,i32,i64,float,double or a pointer type like i8 *(or just* )

With our c function looking like:

    char* hello_world () {
     return "hello world!";
    }

We\'ll just use cwrap to create an ordinary JavaScript to call and
return a string.

    return {
      hello : Module.cwrap('hello_world', 'string', [])
    };

Now all we have to do is call `hello_emscripten.hello()` to return the
string. Go [here](http://leogdion.github.io/hello-emscripten/) to look
at the resulting demo. To build the project your self, install the node
modules required and run grunt.

    npm install
    grunt

# Conclusion

Emscripten is powerful tool for taking complex c code and running it in
the browser. There are already [hundreds of
projects](https://github.com/kripken/emscripten/wiki#demos) doing the
same thing. Next time I will show how to the
[gmemujs](https://github.com/leogdion/gmemujs) works in playing old
video game music using
[emscripten](https://github.com/kripken/emscripten),
[gmemu](https://code.google.com/p/game-music-emu/), and the [Web Audio
API](https://developer.mozilla.org/en-US/docs/Web_Audio_API).