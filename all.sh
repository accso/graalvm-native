. ./env.sh

all() {
    DIR=${dir%*/}
    pushd ${DIR} > /dev/null 2>&1
    if [ -f ./all.sh ] 
    then
        echo "#######################################################################################"
        echo "All in ${DIR}"
        . ./all.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

./showversion.sh

for dir in helloworld filefinder mandelbrot printproperties reflection resource quarkus-timeserver staticinit dynamicproxy exceptions spring-boot-greetingserver junit-native shared-library helloworld-with-pgo static-and-buildinit serialization; 
do
    all
done
