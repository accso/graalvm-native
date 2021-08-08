# graalvm-native, example 'static-and-buildinit'
GraalVM Examples, Native Image static and build initialization

This example shows the behaviour of build time vs run time initialization, for a `LocalDateTime` variable.

These artifacts are built in 'target':
* A class file
* A native image, named 'static-build-init', built with default compiler/linker settings
* A native image, named 'static-build-init_runtime', built with explicit initialization at run time
* A native image, named 'static-build-init_buildtime', built with explicit initialization at build time

