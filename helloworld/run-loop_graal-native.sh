MAX=20
if [ "$1" != "" ]; then MAX=$1; fi

which java

for ((i=1; i<=${MAX}; i++))
do
  ./target/helloworld
done
