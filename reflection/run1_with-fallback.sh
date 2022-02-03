SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "1) run the native-image - works as there is a fallback to the JVM ($JAVA_HOME and/or java in \$PATH must be accessible)"
echo "   Works only, when started in 'target' and when 'ReflectionCaller.class' and 'StringManipulator.class' are available as fallback."
echo "   Otherwise no fallback is possible and hence this error is shown:"
echo "        Error: Could not find or load main class ReflectionCaller"
echo "        Caused by: java.lang.ClassNotFoundException: ReflectionCaller"

time ./reflectionCallerWithFallback StringManipulator reverse    "hello"

time ./reflectionCallerWithFallback StringManipulator capitalize "world"

# runtime error - does not work, as such a method "some" is not available
./reflectionCallerWithFallback StringManipulator some "thing"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
