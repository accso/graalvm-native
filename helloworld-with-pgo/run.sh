which java
java -version

time java -cp target HelloWorld
time ./target/helloworld-pgo-instrumented
time ./target/helloworld-pgo-optimized
