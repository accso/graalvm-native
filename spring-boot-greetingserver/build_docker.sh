SRC=./src
TARGET=./target

which java
java -version

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw clean 

./mvnw package -Pjvm

./mvnw package -Pnative

./mvnw spring-boot:build-image
