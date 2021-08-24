SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/StaticBuildInit.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

echo "1) create native-image, using default initialization"

${GRAALVM_HOME}/bin/native-image \
         --no-fallback \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 StaticBuildInit static-build-init

echo "---------------------------------------------------------------------------------------"

echo "2) create native-image, using explicit initialization at runtime"

${GRAALVM_HOME}/bin/native-image \
         --no-fallback \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 --initialize-at-run-time=StaticBuildInit \
		 StaticBuildInit static-build-init_runtime

echo "---------------------------------------------------------------------------------------"

echo "3) create native-image, using explicit initialization at buildtime"

${GRAALVM_HOME}/bin/native-image \
         --no-fallback \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 --initialize-at-build-time=StaticBuildInit \
		 StaticBuildInit static-build-init_buildtime

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
