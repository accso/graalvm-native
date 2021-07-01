SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw clean 

./mvnw package

./mvnw package -Pnative

# -----------------------------------------------------------------------------------------------------------------

# including the Docker image
# ./mvnw spring-boot:build-image
