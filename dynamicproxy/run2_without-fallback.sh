SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "2) run the native-image - shows runtime error as cannot use JVM fallback"
echo " "
echo "     Exception in thread \"main\" java.lang.NoSuchMethodException: FooAndBarAndBazImpl.<init>()"
echo "              at java.lang.Class.getConstructor0(DynamicHub.java:3349)"
echo "              at java.lang.Class.getDeclaredConstructor(DynamicHub.java:2553)"
echo "              at MyProxyHandler.<init>(MyProxyHandler.java:18)"
echo "              at MyProxyHandler.newProxyInstance(MyProxyHandler.java:12)"
echo "              at DynamicProxyMain.main(DynamicProxyMain.java:4)"

time ./dynamicProxyWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
