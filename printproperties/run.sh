SRC=./src
TARGET=./target

${TARGET}/printPropertiesWithBuildTime    -Dmy.run.time.flag=true | grep -i flag

${TARGET}/printPropertiesWithoutBuildTime -Dmy.run.time.flag=true | grep -i flag
