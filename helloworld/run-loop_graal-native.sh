MAX=10
if [ "$1" != "" ]; then MAX=$1; fi

for ((i=1; i<=${MAX}; i++))
do
  ./target/helloworld
done
