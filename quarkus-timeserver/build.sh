SRC=./src
TARGET=./target

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw clean package -Pnative

# including the Docker image
# ./mvnw clean package -Pnative -Dquarkus.native.container-build=true

# build profiling image
# ./mvnw clean package -Pnative -Dquarkus.native.additional-build-args=--pgo-instrument

# build using profiling information (might need to add path to iprof file)
#./mvnw clean package -Pnative -Dquarkus.native.additional-build-args="--pgo=default.iprof"
