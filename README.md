# graalvm-native
GraalVM Examples, Native Image

## Graal Version
Choosing the one correct GraalVM version is tricky, if not impossible as you have the choice of a) several GraalVM version (20.x, 21.x, 22.x) and b) the Community CE and the Enterprise Edition EE, respectively or Redhats Mandrel and c) combining all this with an unterlying JDK 11 or 17. 

TL;DR Use GraalVM 22.0.0.2 with JDK 17 for the majority of the examples.

Note that `spring-boot-greetingserver` still only works with 21.3.0 with JDK 11:
* Spring Native theoretically runs with Graal22/JDK17 but during testing the build and the runs we encountered several problems which could not be fixed easily. So 
We might want to update theses two examples later in 2022.

Note that `quarkus-timeserver` has been tested also with Redhats Mandrel, also using version 22 with JDK 11 and 17.

All examples had previously worked perfectly with Graal CE/EE 21.1.0 with JDK11. Note that we now updated some examples to 22.0.0.2 with JDK 17 but expect the examples still to work with Graal21/Java11.

#### CE or EE?
All examples should work with the Community Edition, CE, except 
* `helloworld-with-pgo`, which requires "profile guided optimization", something only supported by the GraalVM Enterprise Edition. 
* `mandelbrot`, which also uses "profile guided optimization", optionally (see `build_pgo.sh`)

## Setup
### Setup GraalVM and JDK
edit `env.sh` and set the environment variables `OPENJDK_HOME` and `GRAALVM_HOME` according to your local installation

### Setup JMeter in example quarkus-timeserver
edit `quarkus-timeserver/run_jmeter-loadtest.sh` and set the environment variable `JMETER_HOME according to your local installation
