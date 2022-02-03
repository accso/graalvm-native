# graalvm-native, example 'mandelbrot'
GraalVM Examples, Native Image Mandelbrot number crunching 

This example comes in two flavours: 
* Mandelbrot set written to an PNG file
* Mandelbrot set only computed in memory (typically used for the performance measurements)

The script `build_pgo.sh` uses Profile Guided Optimization (so needs to be built with Graal Enterprise Edition)
