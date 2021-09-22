SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "-----------------------------------------------------------------------------------------------------------------"

mkdir -p ./META-INF/native-image

echo "1) create native-image with the SerializerApp as its main class"

${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image/serializer \
        SerializerApp
${GRAALVM_HOME}/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:SerializationConfigurationResources=./META-INF/native-image/serializer/serialization-config.json \
        SerializerApp serializerApp 

# -----------------------------------------------------------------------------------------------------------------

echo " "
echo "2) create native-image with the DeserializerApp as its main class"

${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image/deserializer \
        DeserializerApp
${GRAALVM_HOME}/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:SerializationConfigurationResources=./META-INF/native-image/deserializer/serialization-config.json \
        DeserializerApp deserializerApp 

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
