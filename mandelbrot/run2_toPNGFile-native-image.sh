SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "1) runs graal in  native-image mode, creating mandelbrot PNG file in /tmp "
echo "   shows error, dies at runtime with exception (as awt not available at runtime)"

time ./mandelbrotToPNGFile $factor

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
