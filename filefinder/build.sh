SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/FileFinder.java
${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/FileFinderWithJS.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image
${GRAALVM_HOME}/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces  FileFinder filefinder

# -----------------------------------------------------------------------------------------------------------------

# create native-image
${GRAALVM_HOME}/bin/native-image --no-fallback -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces  FileFinderWithJS --language:js filefinderWithJS

popd >/dev/null
