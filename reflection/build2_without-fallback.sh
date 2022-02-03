SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "2) create native-image without fallback, which then will not work at all but throws a runtime error:"
echo "      Exception in thread "main" java.lang.ClassNotFoundException: StringManipulator"
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		ReflectionCaller reflectionCallerWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
