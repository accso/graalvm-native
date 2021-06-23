SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "3) run the native-image, now backed up by the reflect-config file"

time ./reflectionCallerWithExplicitConfiguration StringManipulator reverse    "hello"

time ./reflectionCallerWithExplicitConfiguration StringManipulator capitalize "world"

# runtime error - does not work, as such a method "some" is not available
./reflectionCallerWithExplicitConfiguration StringManipulator some "thing"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
