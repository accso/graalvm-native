SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

# Sizing factor (1 is default)

factor=1
if [ ! ${1} == "" ];
then
   factor=$1
fi

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "1) runs graal in jvm mode, creating mandelbrot PNG file (factor $factor) in /tmp"

time java -Djava.io.tmpdir=/tmp -cp classes MandelbrotToPNGFile $factor

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
