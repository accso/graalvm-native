SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

./mvnw package -P JAVA_inMemory

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

echo "1) create native-image, step 1"
echo "   shows an error, if not run with a Graal Enterprise Edition (message 'Error: Unrecognized option: --pgo-instrument')"

${GRAALVM_HOME}/bin/native-image  \
        -cp mandelbrot-1.0.0-SNAPSHOT-jar-with-dependencies.jar \
		--pgo-instrument \
        --no-fallback \
        MandelbrotInMemory mandelbrotInMemory-pgo-instrumented

echo "2) run binary to produce the pgo profile"
echo "   shows an error, if build step above was not run with a Graal Enterprise Edition (message './mandelbrotInMemory-pgo-instrumented: No such file or directory')"
rm -f default.iprof
FACTOR=16
./mandelbrotInMemory-pgo-instrumented $FACTOR
mv default.iprof mandelbrotInMemory-pgo.iprof

echo " "
echo "3) create native-image, using the pgo profile for optimization"
echo "   shows an error, if not run with a Graal Enterprise Edition (message 'Error: Unrecognized option: --pgo=default.iprof')"
${GRAALVM_HOME}/bin/native-image  \
        -cp mandelbrot-1.0.0-SNAPSHOT-jar-with-dependencies.jar \
		--pgo=mandelbrotInMemory-pgo.iprof \
        --no-fallback \
        MandelbrotInMemory mandelbrotInMemory-pgo-optimized

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
