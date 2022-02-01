SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "1) run the native-image for the SerializerApp, backed up by the serialization-config file"

time ./serializerApp

## -----------------------------------------------------------------------------------------------------------------

echo " "
echo "2) run the native-image for the DeserializerApp, backed up by the serialization-config file"

time ./deserializerApp

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
