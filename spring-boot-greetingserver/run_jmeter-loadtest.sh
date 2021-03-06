#JMETER_HOME=/TODO/PATH/TO/JMETER/INSERT/HERE
JMETER_HOME=/opt/jmeter/apache-jmeter-5.3

NOW=`date +%s%3N`

TMPDIR=/tmp
JMETER_TMPDIR=${TMPDIR}/jmeter_spring-boot-greetingserver_${NOW}

mkdir -p ${JMETER_TMPDIR}

bash ${JMETER_HOME}/bin/jmeter.sh -n -t jmeter-greetingserver.jmx -e -o ${JMETER_TMPDIR} -l ${JMETER_TMPDIR}/output-${NOW}.txt
