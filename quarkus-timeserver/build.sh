SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw clean package -Pnative

# including the Docker image
# ./mvnw clean package -Pnative -Dquarkus.native.container-build=true
