SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

${GRAALVM_HOME}/bin/javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# create native-image with fallback

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.forName invoked at ReflectionCaller.main(ReflectionCaller.java:21)
# Warning: Reflection method java.lang.Class.getDeclaredMethod invoked at ReflectionCaller.main(ReflectionCaller.java:22)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
#
${GRAALVM_HOME}/bin/native-image --force-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		DynamicProxyMain dynamicProxyWithFallback 

echo "---------------------------------------------------------------------------------------"

# -----------------------------------------------------------------------------------------------------------------

# create native-image without fallback

${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		DynamicProxyMain dynamicProxyWithoutFallback

echo "---------------------------------------------------------------------------------------"

# -----------------------------------------------------------------------------------------------------------------

# create proxy-config as JSON file
# (absolute path needed when calling java, seems like a bug?)

mkdir -p ./META-INF/native-image

# create META-INF/native-image/proxy-config.json (note: "output-dir")
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image DynamicProxyMain

# create native-image with explicit proxy configuration
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:DynamicProxyConfigurationResources=./META-INF/native-image/proxy-config.json \
		-H:ReflectionConfigurationResources=./META-INF/native-image/reflect-config.json \
		DynamicProxyMain dynamicProxyWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
