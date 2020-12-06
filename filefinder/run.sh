DIR=.
PATTERN="*.java"

if [ $# -gt 0 ]
then
   DIR=${1}
   PATTERN="${2}"
fi

which java

time java -cp target FileFinder ${DIR} -name ${PATTERN}
time ./target/filefinder        ${DIR} -name ${PATTERN}
time ./target/filefinderWithJS  ${DIR} -name ${PATTERN}
