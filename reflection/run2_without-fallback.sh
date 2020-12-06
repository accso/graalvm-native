SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image
# shows errors as cannot use JVM fallback

# Errors at Runtime
# Exception in thread "main" java.lang.ClassNotFoundException: StringManipulator
#        at com.oracle.svm.core.hub.ClassForNameSupport.forName(ClassForNameSupport.java:60)
#        at java.lang.Class.forName(DynamicHub.java:1214)
#        at ReflectionCaller.main(ReflectionCaller.java:19)

time ./reflectionCallerWithoutFallback StringManipulator reverse    "hello"

time ./reflectionCallerWithoutFallback StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
