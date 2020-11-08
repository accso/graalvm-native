SRC=./src
TARGET=./target

time ${TARGET}/printPropertiesWithBuildTime    -Dmy.run.time.flag=true | grep -i flag

time ${TARGET}/printPropertiesWithoutBuildTime -Dmy.run.time.flag=true | grep -i flag
