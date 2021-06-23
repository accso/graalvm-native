SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------
# creates Mandelbrot only in memory (without creating any image files)

mkdir -p ${TARGET}

./mvnw clean 

# compile 
./mvnw package -P JAVA_inMemory

# create native-image
./mvnw package -P NATIVE_IMAGE_inMemory

# -----------------------------------------------------------------------------------------------------------------
# creates MandelbrotToPNG (creating a PNG file)

mkdir -p ${TARGET}

# compile 
./mvnw package -P JAVA_toPNG

# create native-image
./mvnw package -P NATIVE_IMAGE_toPNG
