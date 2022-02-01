SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/ThrowsAnException.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        ThrowsAnException throwsanexception

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
