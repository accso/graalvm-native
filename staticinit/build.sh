SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/StaticInitialization.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# create native-image, set a build-time property with -D
${GRAALVM_HOME}/bin/native-image --no-fallback -Dcustom.property=buildtime \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 StaticInitialization static-init
		 
# create the same native image, initializing *all* classes at build time
${GRAALVM_HOME}/bin/native-image --initialize-at-build-time --no-fallback -Dcustom.property=buildtime \
         -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		 StaticInitialization static-init-buildtime

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
