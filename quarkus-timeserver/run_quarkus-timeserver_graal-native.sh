SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

time ./timeserver-1.0.0-SNAPSHOT-runner

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null 