SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "1) run the native-image - works as there is a fallback to the JVM ($JAVA_HOME and/or java in \$PATH must be accessible)"
echo "   Works only, when started in 'target' and when the class are available there as fallback."
echo "   Otherwise no fallback is possible and hence this error is shown:"
echo "        Error: Could not find or load main class DynamicProxyMain"
echo "        Caused by: java.lang.ClassNotFoundException: DynamicProxyMain"

time ./dynamicProxyWithFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
