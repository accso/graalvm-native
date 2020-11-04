SRC=./src
TARGET=./target 

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

# create reflect-config as JSON file
# (absolute path needed when calling java, seems like a bug?)

mkdir -p ./META-INF/native-image

# create META-INF/native-image/reflect-config.json (note: "output-dir")
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-output-dir=./META-INF/native-image ReflectionCaller StringManipulator reverse "hello"

# ... and then append to it in the second run (note: "merge-dir")
${GRAALVM_HOME}/bin/java -agentlib:native-image-agent=config-merge-dir=./META-INF/native-image  ReflectionCaller StringManipulator capitalize "world"


# -----------------------------------------------------------------------------------------------------------------

# create native-image with explicit reflection configuration

$GRAALVM_HOME/bin/native-image --no-fallback ReflectionCaller reflectionCallerWithExplicitConfiguration

# -----------------------------------------------------------------------------------------------------------------

# run the native-image, now backed up by the reflect-config file

./reflectionCallerWithExplicitConfiguration StringManipulator reverse    "hello"

./reflectionCallerWithExplicitConfiguration StringManipulator capitalize "world"

# does not work, as such a method is not available
./reflectionCallerWithExplicitConfiguration StringManipulator whatever "else"

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
