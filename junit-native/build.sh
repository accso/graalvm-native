SRC=./src
TARGET=./target

which java

# -----------------------------------------------------------------------------------------------------------------

mkdir -p ${TARGET}

./mvnw clean 

./mvnw package -Pnative
