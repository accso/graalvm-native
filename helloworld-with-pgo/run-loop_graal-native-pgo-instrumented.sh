MAX=20
if [ "$1" != "" ]; then MAX=$1; fi

which java
java -version

function runinloop() 
{
	for ((i=1; i<=${MAX}; i++))
	do
	  ./target/helloworld-pgo-instrumented
	done  
}

time runinloop
