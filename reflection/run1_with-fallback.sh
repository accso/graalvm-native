SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "1) run the native-image - works as there is a fallback to the JVM ($JAVA_HOME and/or java in \$PATH must be accessible)"

time ./reflectionCallerWithFallback StringManipulator reverse    "hello"

time ./reflectionCallerWithFallback StringManipulator capitalize "world"

# runtime error - does not work, as such a method "some" is not available
./reflectionCallerWithFallback StringManipulator some "thing"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
