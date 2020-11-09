# graalvm-native, example 'staticinit'
GraalVM Examples, Native Image static initialization

This example shows the behaviour of system properties in combination with static initialization and the build time initialization feature of native images. It prints:
* The contents of the system property user.home, when stored in a normal, static, final and static final variable.
* The contents of the system property "custom.property" which is stored in a static variable and set both at buildtime and runtime.

Three artifacts are built in 'target':
* A class file
* A native image, named 'static-init'
* A native image, named 'static-init-buildtime', which is built with the flag --initialize-at-build-time (no argument means all classes are initialized at build time)

For the effect of static variables with buildtime-initialization on user.home, try running the generated native images with different users.
