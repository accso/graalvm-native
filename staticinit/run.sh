which java

echo "Running in JVM mode with custom.property set to \"runtime\"..."
time java -Dcustom.property=runtime -cp target StaticInitialization

echo "Running in native-image mode with custom.property set to \"runtime\"..."
time ./target/static-init -Dcustom.property=runtime

echo "Running in native-image (buildtime-initialization) mode with custom.property set to \"runtime\"..."
time ./target/static-init-buildtime -Dcustom.property=runtime
