SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

# compile 
./mvnw clean package -P JAVA

# -----------------------------------------------------------------------------------------------------------------

# create resource-config as JSON file
# (absolute path needed when calling java, seems like a bug?)

mkdir -p ${TARGET}/META-INF/native-image

# create META-INF/native-image/resource-config.json
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=${TARGET}/META-INF/native-image -cp ${TARGET}/classes ResourceLoader

# -----------------------------------------------------------------------------------------------------------------

# create native-image
./mvnw package -P NATIVE_IMAGE
