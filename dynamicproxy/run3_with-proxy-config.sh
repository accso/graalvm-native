SRC=./src
TARGET=./target 

which java

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "3) run the native-image, now backed up by the proxy-config file"

time ./dynamicProxyWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
