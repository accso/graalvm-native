SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

$GRAALVM_HOME/bin/javac -d ${TARGET} ${SRC}/ReflectionCaller.java
