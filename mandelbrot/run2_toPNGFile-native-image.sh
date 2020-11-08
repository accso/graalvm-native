SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------

pushd ${TARGET} >/dev/null 

# Profiles for the app which creates MandelbrotToPNG (creating a PNG file)
#   Note: Native-Image can be compiled but dies with a runtime error (as awt not available at runtime).
#   Excepted to be fixed with a newer GraalVM version, potentially with version 20.3.

time ./mandelbrotToPNGFile $factor

# -----------------------------------------------------------------------------------------------------------------

popd >/dev/null
