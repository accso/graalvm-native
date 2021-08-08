. ./env.sh

all() {
    DIR=${dir%*/}
    pushd ${DIR} > /dev/null 2>&1
    if [ -f ./build.sh ] 
    then 
        echo "#######################################################################################"
        echo "All build in ${DIR}"
        . ./build.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in helloworld filefinder mandelbrot printproperties reflection resource quarkus-timeserver staticinit dynamicproxy exceptions spring-boot-greetingserver junit-native shared-library helloworld-with-pgo static-and-buildinit;
do
    all
done
