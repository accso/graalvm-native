JMETER_HOME=/TODO/PATH/TO/JMETER/INSERT/HERE 

NOW=`date +%s%3N`

TMPDIR=/tmp
JMETER_TMPDIR=${TMPDIR}/jmeter-${NOW}

mkdir -p ${JMETER_TMPDIR}

bash ${JMETER_HOME}/jmeter.sh -n -t jmeter-timeserver.jmx -e -o ${JMETER_TMPDIR} -l ${JMETER_TMPDIR}/output-${NOW}.txt
