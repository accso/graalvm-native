# graalvm-native
GraalVM Examples, Native Image

## Graal Version
TL;DR Use GraalVM 21.1.0 with JDK 11.

The examples have been tested with GraalVM 21.1.0 both CE and EE (with underlying JDKs 8, 11, 16). 

All examples should work perfectly with 21.1.0 with JDK11 (CE and EE). 
Most of the examples have been tested successfully with older GraalVM versions 20.2.0, 20.3.0 CE and also EE.

You might want to stick to 21.1.0, JDK 11 because ...
* Note that some examples like `quarkus-timeserver` do _only_ run on JDK11.
* Note that all examples containing Maven (like `resource`, `mandelbrot` and `quarkus-timeserver`) have a fixed GraalVM version in the `pom.xml`, so using a different GraalVM version would require some manual work in the `pom` file, too. 
* Note that some examples do not compile and/or run when switching to JDK 16.

## Setup
### Setup GraalVM and JDK
edit `env.sh` and set the environment variables `OPENJDK_HOME` and `GRAALVM_HOME` according to your local installation

### Setup JMeter in example quarkus-timeserver
edit `quarkus-timeserver/run_jmeter-loadtest.sh` and set the environment variable `JMETER_HOME according to your local installation
