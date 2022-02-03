SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

for factor in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
  echo "3) runs graal in jvm mode in loop, in memory, for factor $factor"
  time java -cp classes MandelbrotInMemory $factor
  echo " "
done

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
