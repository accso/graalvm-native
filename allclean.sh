. ./env.sh

all() {
    DIR=${dir%*/}
    pushd ${DIR} > /dev/null 2>&1
    if [ -f ./clean.sh ] 
    then 
        echo "#######################################################################################"
        echo "All clean in ${DIR}"
        . ./clean.sh
    fi
    popd >/dev/null 2>&1 
    echo " "
}

for dir in filefinder mandelbrot printproperties reflection resource;
do
    all
done