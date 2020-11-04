SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# create native-image without fallback

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
# Warning: Use -H:+ReportExceptionStackTraces to print stacktrace of underlying exception
#
$GRAALVM_HOME/bin/native-image --no-fallback ReflectionCaller reflectionCallerWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

# run the native-image
# shows errors as cannot use JVM fallback

# Errors at Runtime
# Exception in thread "main" java.lang.ClassNotFoundException: StringManipulator
#        at com.oracle.svm.core.hub.ClassForNameSupport.forName(ClassForNameSupport.java:60)
#        at java.lang.Class.forName(DynamicHub.java:1214)
#        at ReflectionCaller.main(ReflectionCaller.java:19)

./reflectionCallerWithoutFallback StringManipulator reverse    "hello"

./reflectionCallerWithoutFallback StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
