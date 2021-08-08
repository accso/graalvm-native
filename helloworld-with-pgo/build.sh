SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/HelloWorld.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

echo "1) create native-image, step 1"
echo "   shows an error, if not run with a Graal Enterprise Edition (message 'Error: Unrecognized option: --pgo-instrument')"

${GRAALVM_HOME}/bin/native-image --pgo-instrument \
        --no-fallback \
        HelloWorld helloworld-pgo-instrumented

# -----------------------------------------------------------------------------------------------------------------

echo "2) run binary to produce the pgo profile (result is 'profile.iprof')"
echo "   shows an error, if build step above was not run with a Graal Enterprise Edition (message './helloworld-pgo-instrumented: No such file or directory')"
./helloworld-pgo-instrumented

# -----------------------------------------------------------------------------------------------------------------

echo "3) create native-image, using the pgo profile for optimization"
echo "   shows an error, if not run with a Graal Enterprise Edition (message 'Error: Unrecognized option: --pgo=default.iprof')"
${GRAALVM_HOME}/bin/native-image --pgo=default.iprof \
        --no-fallback \
        HelloWorld helloworld-pgo-optimized

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
