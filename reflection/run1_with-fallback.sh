SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# create native-image with fallback

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
#
$GRAALVM_HOME/bin/native-image -H:+ReportExceptionStackTraces ReflectionCaller reflectionCallerWithFallback

# -----------------------------------------------------------------------------------------------------------------

# run the native-image
# works as there is a fallback to the JVM ($JAVA_HOME and/or java in $PATH must be accessible)

./reflectionCallerWithFallback StringManipulator reverse    "hello"

./reflectionCallerWithFallback StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
