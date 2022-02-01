SRC=./src
TARGET=./target

which java
java -version

echo "1) should show only the my.runtime.flag set to true"
time ${TARGET}/printProperties           -Dmy.runtime.flag=true | grep -i flag

echo "2) should show both the my.buildtime.flag and the my.runtime.flag set to true"
time ${TARGET}/printProperties-buildtime -Dmy.runtime.flag=true | grep -i flag
