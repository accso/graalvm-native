SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

# 1) compile Java code

mkdir -p ${TARGET}

javac -d ${TARGET} ${SRC}/main/java/MyMath.java

pushd ${TARGET} >/dev/null

# -----------------------------------------------------------------------------------------------------------------

# 2) create shared library

${GRAALVM_HOME}/bin/native-image \
        --no-fallback \
        -H:+ReportExceptionStackTraces \
		--shared \
		-H:Name=libmymath

# -----------------------------------------------------------------------------------------------------------------

# 3) compile and link CPP code

g++ ../src/main/cpp/mathcaller.cpp -L . -I . -l mymath -o mathcaller

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
