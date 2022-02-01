SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "---------------------------------------------------------------------------------------"

echo "1) create native-image with a fallback (might want to enforce with --force-fallback)"
echo "   Shows compiler warnings and message 'Aborting stand-alone image build due to reflection use without configuration.'"

# Compiler Warnings as follows:
# Warning: Reflection method java.lang.Class.getDeclaredConstructor invoked at MyProxyHandler.<init>(MyProxyHandler.java:18)
# Warning: Aborting stand-alone image build due to reflection use without configuration.
# com.oracle.svm.hosted.FallbackFeature$FallbackImageRequest: Reflection method java.lang.Class.getDeclaredConstructor invoked at MyProxyHandler.<init>(MyProxyHandler.java:18)
# Aborting stand-alone image build due to reflection use without configuration.

${GRAALVM_HOME}/bin/native-image \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		DynamicProxyMain dynamicProxyWithFallback 

echo "---------------------------------------------------------------------------------------"

echo "2) create native-image without fallback"

${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		DynamicProxyMain dynamicProxyWithoutFallback

echo "---------------------------------------------------------------------------------------"

echo "3) create proxy-config as JSON file"

mkdir -p ./META-INF/native-image

# create META-INF/native-image/proxy-config.json in 'output-dir'
# (absolute path needed here when calling java, seems like a bug?)
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image DynamicProxyMain

# create native-image with explicit proxy configuration
${GRAALVM_HOME}/bin/native-image --no-fallback \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
        -H:DynamicProxyConfigurationResources=./META-INF/native-image/proxy-config.json \
        -H:ReflectionConfigurationResources=./META-INF/native-image/reflect-config.json \
        DynamicProxyMain dynamicProxyWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
