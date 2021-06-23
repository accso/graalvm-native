SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "1) run the native-image - works as there is a fallback to the JVM ($JAVA_HOME and/or java in \$PATH must be accessible)"

time ./dynamicProxyWithFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
