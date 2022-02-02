DIR=.
PATTERN="*.java"

if [ $# -gt 0 ]
then
   DIR=${1}
   PATTERN="${2}"
fi

MAX=20
if [ "$3" != "" ]; then MAX=$3; fi

which java
java -version

function runinloop() 
{
	for ((i=1; i<=${MAX}; i++))
	do
      java -cp target FileFinder ${DIR} -name ${PATTERN}
	done
}

time runinloop
