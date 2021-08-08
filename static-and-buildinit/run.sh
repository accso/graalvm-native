which java

echo "1) Running the native image, named 'static-build-init', built with default compiler/linker settings"
echo "   Executable is run twice, sleeping 5 seconds in between. The two outputs have to be different"
./target/static-build-init
sleep 5
./target/static-build-init

echo ""
echo "2) Running native image, named 'static-build-init_runtime', built with explicit initialization at run time"
echo "   Executable is run twice, sleeping 5 seconds in between. The two outputs have to be different"
./target/static-build-init_runtime
sleep 5
./target/static-build-init_runtime

echo ""
echo "3) Running twice native image, named 'static-build-init_buildtime', built with explicit initialization at build time"
echo "   Executable is run twice, sleeping 5 seconds in between. The two outputs have to be identical"
./target/static-build-init_buildtime
sleep 5
./target/static-build-init_buildtime
