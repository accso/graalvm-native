SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------
# compile

mkdir -p ${TARGET}

# compile 
./mvnw clean package -P JAVA

# -----------------------------------------------------------------------------------------------------------------

# create native-image
./mvnw clean package -P NATIVE_IMAGE
