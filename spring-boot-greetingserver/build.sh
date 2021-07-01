SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw spring-boot:build-image
