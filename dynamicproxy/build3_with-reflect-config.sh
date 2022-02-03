SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "3) create native-image using a proxy-config Json file as input with all relevant reflective calls specified"

mkdir -p ./META-INF/native-image

# create META-INF/native-image/proxy-config.json in 'output-dir'
# (absolute path needed here when calling java, seems like a bug?)
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image DynamicProxyMain

# create native-image with explicit proxy configuration
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:DynamicProxyConfigurationResources=./META-INF/native-image/proxy-config.json \
        -H:ReflectionConfigurationResources=./META-INF/native-image/reflect-config.json \
        DynamicProxyMain dynamicProxyWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
