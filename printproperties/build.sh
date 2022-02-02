SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/PrintProperties.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

echo "1) create native-image, set a build-time property with -D, which has no effect"

${GRAALVM_HOME}/bin/native-image --no-fallback \
        -Dmy.buildtime.flag=true \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
	    PrintProperties printProperties 

# -----------------------------------------------------------------------------------------------------------------

echo "2) create native image, set same build-time property but this time initializing the class at build time"

${GRAALVM_HOME}/bin/native-image --no-fallback \
        --initialize-at-build-time=PrintProperties -Dmy.buildtime.flag=true \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		PrintProperties printProperties-buildtime

popd >/dev/null
