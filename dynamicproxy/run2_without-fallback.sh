SRC=./src
TARGET=./target 

which java
java -version

pushd ${TARGET} >/dev/null 

# -----------------------------------------------------------------------------------------------------------------

echo "2) run the native-image - shows errors as cannot use JVM fallback"

# Exception in thread "main" java.lang.NoSuchMethodException: FooAndBarAndBazImpl.<init>()
#         at java.lang.Class.getConstructor0(DynamicHub.java:3349)
#         at java.lang.Class.getDeclaredConstructor(DynamicHub.java:2553)
#         at MyProxyHandler.<init>(MyProxyHandler.java:18)
#         at MyProxyHandler.newProxyInstance(MyProxyHandler.java:12)
#         at DynamicProxyMain.main(DynamicProxyMain.java:4)

time ./dynamicProxyWithoutFallback

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
