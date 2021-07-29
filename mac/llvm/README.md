# llvm get started

![llvm-three-phase](http://www.aosabook.org/images/llvm/LLVMCompiler1.png)
![llvm-time](http://www.aosabook.org/images/llvm/InstallTime.png)

- hello.c

```c
#include <stdio.h>

int main() {
  printf("hello world\n");
  return 0;
}
```

- ask clang what it will do to compile the file `hello.c`

```shell
clang -ccc-print-phases hello.c
```

the result

```text
               +- 0: input, "hello.c", c
            +- 1: preprocessor, {0}, cpp-output
         +- 2: compiler, {1}, ir
      +- 3: backend, {2}, assembler
   +- 4: assembler, {3}, object
+- 5: linker, {4}, image
6: bind-arch, "x86_64", {5}, image
```

- run the preprocessor on this to see what the effect is

```shell
clang -E hello.c | less
```

- dump tokens

```shell
clang -Xclang -dump-tokens hello.c
```

- parse AST

```
clang -Xclang -ast-dump -fsyntax-only hello.c
```

- compile code into LLVM IR

```shell
clang -O3 -S -emit-llvm hello.c -o hello.ll
```

- compile code without optimizations

```shell
clang -O0 -S -emit-llvm hello.c -o hello.ll
# without optimization
#clang -O0 -S -emit-llvm factorial.c -o factorial1.ll
# with all optimization
#clang -O3 -S -emit-llvm factorial.c -o factorial2.ll
```

- compile to assembly code

```shell
xcrun clang -S hello.c
```

- compile to object code

```shell
xcrun clang -c hello.c
# file hello.o
```

- link to binary code

```shell
xcrun clang hello.o
# file a.out
./a.out
# compile & link *.m
# xcrun clang -c hello.m
# xcrun clang hello.o -Wl,`xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
# ./a.out
# xcrun otool -L `xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
```

- how the linker resolved all the symbols

  to look at the symbol table of the final executable a.out 

```shell
xcrun nm -nm a.out
```

- to peek the header of Mach-O file

```shell
xcrun otool -v -h hello.o
xcrun otool -v -h a.out
```

- to see the load commands

```shell
xcrun otool -l a.out
```

take a look at which dynamic libraries the executable is using:
- to knows where to find related libraries (dyld)

```shell
xcrun otool -L a.out
```

## reference

- https://clang.llvm.org/get_started.html
- https://www.objc.io/issues/6-build-tools/compiler/
