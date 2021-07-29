dyld
===

- compile 

```
xcrun clang -c *.m
```

- link `ld`

```
xcrun clang SayHi.o Boy.o -Wl,`xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
```

- run executable file `a.out`

```
./a.out
```

print symbol tables, the prefix `_OBJC_CLASS_` is for OC symbol

```
xcrun nm -nm SayHi.o
xcrun nm -nm a.out
```

please pay attention to the `undefined` symbol

```
xcrun otool -L a.out
```

print what libraries are loaded

```
export DYLD_PRINT_LIBRARIES=; ./a.out
```

