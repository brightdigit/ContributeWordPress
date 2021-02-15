---
date: 2014-04-01 14:22
---
# Hello Emscripten!


It has been often said JavaScript is the assembly language of the web, then I suppose that would make emscripten a compiler(or transcompiler). Emscripten is powerful tool which is able to take compiled c/c++ byte code and translate it to JavaScript.

Right now I am working on taking the game music emulator library and making a JavaScript library to play nsf (NES Sound Format)and other console music files playable on the browser. Let's take a basic look at how to compile a JavaScript library from c/c++ code with our old friend "hello world".



# Requirements and Components

## Requirements



## Components



# Transcompiling

```swift
emcc src/c/hello-emscripten.c
```

```swift
emcc -s EXPORTED_FUNCTIONS=['_hello_world'] src/c/hello-emscripten.c
```

```swift
emcc -s EXPORTED_FUNCTIONS=['_hello_world'] -O2 -o tmp/hello-emscripten.js
\ -Wno-deprecated -Qunused-arguments -Wno-logical-op-parentheses src/c/hello-emscripten.c
```

[here:](https://github.com/kripken/emscripten/blob/master/src/settings.js)

[https://github.com/kripken/emscripten/blob/master/src/settings.js](https://github.com/kripken/emscripten/blob/master/src/settings.js)

# Interfacing with the code

**Module**



```swift
char* hello_world () {
 return "hello world!";
}
```

```swift
return {
  hello : Module.cwrap('hello_world', 'string', [])
};
```

```swift
hello_emscripten.hello()
```

[here](http://leogdion.github.io/hello-emscripten/)

```swift
npm install
grunt
```

# Conclusion

[hundreds of projects](https://github.com/kripken/emscripten/wiki#demos)

[gmemujs](https://github.com/leogdion/gmemujs)

[emscripten](https://github.com/kripken/emscripten)

[gmemu](https://code.google.com/p/game-music-emu/)

[ Web Audio API](https://developer.mozilla.org/en-US/docs/Web_Audio_API)