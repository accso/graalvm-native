SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/HelloWorld.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+PrintAnalysisStatistics -H:+ReportExceptionStackTraces \
        HelloWorld helloworld

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
