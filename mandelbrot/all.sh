echo "---------------------------------------------------------------------------------------"

which java
java -version

./clean.sh
./build.sh
./build_pgo.sh
./run.sh

PWD=`readlink -f .`
echo "end of `basename $PWD`"
echo "---------------------------------------------------------------------------------------"
