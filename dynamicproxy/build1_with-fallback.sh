SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/*.java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

echo "1) create native-image with fallback by default (might want to enforce this with --force-fallback)"
echo "   Shows compiler warnings and message 'Aborting stand-alone image build due to reflection use without configuration.'"
echo "   Build is done twice. First build prints compiler warnings as follows:"
echo "       Warning: Reflection method java.lang.Class.getDeclaredConstructor invoked at MyProxyHandler.<init>(MyProxyHandler.java:18)"
echo "       Warning: Aborting stand-alone image build due to reflection use without configuration."
echo "       com.oracle.svm.hosted.FallbackFeature$FallbackImageRequest: Reflection method java.lang.Class.getDeclaredConstructor invoked at MyProxyHandler.<init>(MyProxyHandler.java:18)"
echo "       Aborting stand-alone image build due to reflection use without configuration."
echo "       ..."
echo "       Failed generating 'dynamicProxyWithFallback' after 38s."
echo " "
echo "   Then the second build is automatically started and 'dynamicProxyWithFallback' is finally created successfully."
echo "   Finished generating 'dynamicProxyWithFallback' in 1m 18s."
echo "   Warning: Image 'dynamicProxyWithFallback' is a fallback image that requires a JDK for execution "
echo "   (use --no-fallback to suppress fallback image generation and to print more detailed information why a fallback image was necessary)."
echo " "
echo "   This 'dynamicProxyWithFallback' can only be started, when the corresponding class files are available as a fallback."
echo "   So this executable needs to be started in 'target' and the class files need to be in 'target', too."

${GRAALVM_HOME}/bin/native-image \
        -H:+PrintAnalysisCallTree -H:+ReportExceptionStackTraces \
		DynamicProxyMain dynamicProxyWithFallback 

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
