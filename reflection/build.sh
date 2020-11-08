SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

$GRAALVM_HOME/bin/javac -d ${TARGET} ${SRC}/ReflectionCaller.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# create native-image with fallback

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
#
$GRAALVM_HOME/bin/native-image --force-fallback -H:+ReportExceptionStackTraces -H:+PrintAnalysisCallTree ReflectionCaller reflectionCallerWithFallback 

# -----------------------------------------------------------------------------------------------------------------

# create native-image without fallback

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
# Warning: Use -H:+ReportExceptionStackTraces to print stacktrace of underlying exception
#
$GRAALVM_HOME/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces ReflectionCaller reflectionCallerWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

# create reflect-config as JSON file
# (absolute path needed when calling java, seems like a bug?)

mkdir -p ./META-INF/native-image

# create META-INF/native-image/reflect-config.json (note: "output-dir")
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image ReflectionCaller StringManipulator reverse "hello"

# ... and then append to it in the second run (note: "merge-dir")
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-merge-dir=./META-INF/native-image  ReflectionCaller StringManipulator capitalize "world"

# -----------------------------------------------------------------------------------------------------------------

# create native-image with explicit reflection configuration

$GRAALVM_HOME/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces -H:ReflectionConfigurationResources=./META-INF/native-image/reflect-config.json ReflectionCaller reflectionCallerWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
