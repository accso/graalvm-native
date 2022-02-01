SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/StaticInitialization.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

echo "1) create native-image, set a build-time property with -D"

${GRAALVM_HOME}/bin/native-image -Dcustom.property=buildtime \
         --no-fallback \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 StaticInitialization static-init


echo "2) create native image, same build-time property but this time initializing *all* classes at build time"

${GRAALVM_HOME}/bin/native-image --initialize-at-build-time -Dcustom.property=buildtime \
         --no-fallback \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 StaticInitialization static-init-buildtime

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
