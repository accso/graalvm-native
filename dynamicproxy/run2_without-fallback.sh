SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image
# shows errors as cannot use JVM fallback

time ./dynamicProxyWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
