SRC=./src
TARGET=./target

which java

time ${TARGET}/printPropertiesWithBuildTime    -Dmy.run.time.flag=true | grep -i flag

time ${TARGET}/printPropertiesWithoutBuildTime -Dmy.run.time.flag=true | grep -i flag
