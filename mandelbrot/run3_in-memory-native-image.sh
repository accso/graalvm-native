SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# run in memory for different scaling factors
for factor in 1 2 4 8 16
do 
  echo "Factor is now: $factor"
  time ./mandelbrot $factor
  echo " "
done

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
