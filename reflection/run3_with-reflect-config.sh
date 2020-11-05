SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image, now backed up by the reflect-config file

./reflectionCallerWithExplicitConfiguration StringManipulator reverse    "hello"

./reflectionCallerWithExplicitConfiguration StringManipulator capitalize "world"

# does not work, as such a method is not available
./reflectionCallerWithExplicitConfiguration StringManipulator whatever "else"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
