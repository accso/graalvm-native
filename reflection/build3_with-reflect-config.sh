SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "3) create native-image using a reflect-config Json file as input with all relevant reflection calls specified"

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
