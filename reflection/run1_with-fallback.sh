SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image
# works as there is a fallback to the JVM ($JAVA_HOME and/or java in $PATH must be accessible)

time ./reflectionCallerWithFallback StringManipulator reverse    "hello"

time ./reflectionCallerWithFallback StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
