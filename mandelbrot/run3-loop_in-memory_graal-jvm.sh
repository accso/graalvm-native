SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# run in memory for different scaling factors
for factor in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
  echo "Factor is now: $factor"
  time java -cp classes MandelbrotInMemory $factor
  echo " "
done

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
