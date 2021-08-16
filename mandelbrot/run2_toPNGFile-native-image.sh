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

echo "2) runs graal in native-image mode, creating mandelbrot PNG file (factor $factor) in /tmp "

time ./mandelbrotToPNGFile $factor

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
