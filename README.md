# graalvm-native
GraalVM Examples, Native Image

## Graal Version
Tested with Graal 20.2.0, 20.3.0 and 21.1.0 both CE and EE (with various underlying JDKs 8,11,16). 

All examples should work perfectly with 20.3.0 with JDK11 (CE and EE) and also 21.1.0 with JDK11 (CE and EE). Note that some examples like `quarkus-timeserver` do _only_ run on JDK11.

## Setup
### Setup GraalVM and JDK
edit `env.sh` and set the environment variables `OPENJDK_HOME` and `GRAALVM_HOME` according to your local installation

### Setup JMeter in example quarkus-timeserver
edit `quarkus-timeserver/run_jmeter-loadtest.sh` and set the environment variable `JMETER_HOME according to your local installation
