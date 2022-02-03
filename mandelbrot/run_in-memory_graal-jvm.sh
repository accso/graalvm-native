SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

# Sizing factor (1 is default)

factor=1
if [ ! ${1} == "" ];
then
   factor=$1
fi

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

time java -cp classes MandelbrotInMemory $factor

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
