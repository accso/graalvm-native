# Environment settings

export GRAALVM_HOME=/TODO/PATH/TO/GRAALVM/INSERT/HERE
export OPENJDK_HOME=/TODO/PATH/TO/JAVA_HOME/INSERT/HERE
export JAVA_HOME=${GRAALVM_HOME}

export PATH=${PATH}:${JAVA_HOME}/bin:${GRAALVM_HOME}/bin

# ---------------------------------------------------------------------------------

# needed only once
# sudo ${GRAALVM_HOME}/bin/gu install native-image
