TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

java -jar ./spring-boot-greetingserver-0.0.1-SNAPSHOT.jar

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null 
