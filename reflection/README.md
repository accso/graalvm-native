# graalvm-native, example 'reflection'
GraalVM Examples, Native Image Reflection Usage

This example shows three different options:
* build a native image with fallback (to JVM, needs JVM in $PATH and also class files available)
* build a native image without fallback (throws runtime errors)
* build a native image based on pre-defined reflective configuration JSON files
