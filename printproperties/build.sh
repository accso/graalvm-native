SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/PrintProperties.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image with flag set at build time
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		PrintProperties printPropertiesWithBuildTime -Dmy.build.time.flag=true 

# -----------------------------------------------------------------------------------------------------------------

# create native-image without any flag set at build time
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		PrintProperties printPropertiesWithoutBuildTime

popd >/dev/null
