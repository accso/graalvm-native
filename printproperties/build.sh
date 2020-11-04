SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

$GRAALVM_HOME/bin/javac -d ${TARGET} ${SRC}/PrintProperties.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image with flag set at build time
$GRAALVM_HOME/bin/native-image PrintProperties printPropertiesWithBuildTime -Dmy.build.time.flag=true 

# -----------------------------------------------------------------------------------------------------------------

# create native-image without any flag set at build time
$GRAALVM_HOME/bin/native-image PrintProperties printPropertiesWithoutBuildTime

popd >/dev/null
