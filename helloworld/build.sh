SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/HelloWorld.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image
${GRAALVM_HOME}/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces  HelloWorld helloworld

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
