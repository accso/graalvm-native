SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# create PNG file in /tmp
time java -Djava.io.tmpdir=/tmp -cp classes MandelbrotToPNGFile

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
