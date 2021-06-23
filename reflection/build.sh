SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/ReflectionCaller.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "-----------------------------------------------------------------------------------------------------------------"

echo "1) create native-image with fallback by default (might want to use --force-fallback)"

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
#
${GRAALVM_HOME}/bin/native-image \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		ReflectionCaller reflectionCallerWithFallback 

echo "-----------------------------------------------------------------------------------------------------------------"

echo "2) create native-image without fallback"

${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		ReflectionCaller reflectionCallerWithoutFallback

echo "-----------------------------------------------------------------------------------------------------------------"

echo "3) create reflect-config as JSON file"

mkdir -p ./META-INF/native-image

# create META-INF/native-image/reflect-config.json (note: "output-dir")
# (absolute path needed when calling java, seems like a bug?)
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image \
        ReflectionCaller StringManipulator reverse "hello"

# ... and then append to it in the second run (note: "merge-dir")
# (absolute path needed when calling java, seems like a bug?)
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-merge-dir=./META-INF/native-image  \
        ReflectionCaller StringManipulator capitalize "world"


# create native-image with explicit reflection configuration
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:ReflectionConfigurationResources=./META-INF/native-image/reflect-config.json \
		ReflectionCaller reflectionCallerWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
