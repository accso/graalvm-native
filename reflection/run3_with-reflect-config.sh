SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image, now backed up by the reflect-config file

time ./reflectionCallerWithExplicitConfiguration StringManipulator reverse    "hello"

time ./reflectionCallerWithExplicitConfiguration StringManipulator capitalize "world"

# runtime error - does not work, as such a method is not available
time ./reflectionCallerWithExplicitConfiguration StringManipulator whatever "else"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
