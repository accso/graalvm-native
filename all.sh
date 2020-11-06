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

for dir in filefinder mandelbrot printproperties reflection resource;
do
    all
done