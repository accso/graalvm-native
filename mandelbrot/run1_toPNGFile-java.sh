SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "1) runs graal in jvm mode, creating mandelbrot PNG file in /tmp"

time java -Djava.io.tmpdir=/tmp -cp classes MandelbrotToPNGFile

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
