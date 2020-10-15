#!/bin/bash

# Start by making build folder and do all inside it!

# STEP 1: Compile add.c and add.h as static library:

# 1.1 Compile sources to object files (in that case only add.c)
gcc -std=gnu11 -o add.o -c ../add.c

# 1.2 Make static lib of add
ar q libadd.a add.o

# q - quickly append files to library

# 1.3 Make runlib tool - it will generate header with indexes which will fasten up using lib in the future
ranlib libadd.a


# STEP 2: Compile substract.c and substract.h as static library, in similar way:

# 2.1 Compile sources to object files (in that case only add.c)
g++ -std=c++17 -o substract.o -c ../substract.cpp

# 2.2 Make static lib of add
ar q libsubstract.a substract.o

# q - quickly append files to library

# 2.3 Make runlib tool - it will generate header with indexes which will fasten up using lib in the future
ranlib libsubstract.a

# STEP 3: Create shared library from mymath
# 3.1 Compile mymath to object file
g++ -fPIC -std=c++17 -o mymath.o -c ../mymath.cpp

# flaga PIC (fPIC) - position independent code - needed for shared libs

# 3.2 Link the files to shared lib
g++ -fPIC -shared -Wl,-soname,libmath.so -o libmath.so mymath.o libadd.a libsubstract.a

# fPIC flag - as above
# We also link libadd and libsubstract created before
# We use the compiler, which will call linker for us and pass the parameters given in -Wl flag (the ones between ,)
# -shared means that we want to achieve shared library
# -soname - tells we want to achive what binary api the lib supports (in that case api for so libs)

# STEP 4: Compile main (user of our so lib)
# 4.1 Compile to object file
g++ -std=c++17 -o main.o -c ../main.cpp

# 4.2 And link it
g++ main.o -o hellolibs -Wl,--enable-new-dtags,-rpath,`pwd` libmath.so
# rpath (runpath) - Unix type systems specific parameter, which allows all executable/shared lib search for its dependencies
# in that case, by rpath we give path to our shared lib libmath.so.
# --enable-new-dtags - feature (enabled here) 