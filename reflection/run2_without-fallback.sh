SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "2) run the native-image - shows runtime error as cannot use JVM fallback"
echo " "
echo "       Exception in thread \"main\" java.lang.ClassNotFoundException: StringManipulator"
echo "               at com.oracle.svm.core.hub.ClassForNameSupport.forName(ClassForNameSupport.java:60)"
echo "               at java.lang.Class.forName(DynamicHub.java:1214)"
echo "               at ReflectionCaller.main(ReflectionCaller.java:19)"

time ./reflectionCallerWithoutFallback StringManipulator reverse    "hello"

time ./reflectionCallerWithoutFallback StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
