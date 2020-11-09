SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# run the native-image, now backed up by the proxy-config file

time ./dynamicProxyWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
