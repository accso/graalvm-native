SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

time ./resourceloader

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
