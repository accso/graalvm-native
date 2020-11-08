# Environment settings

# export GRAALVM_HOME=/g/graal/graalvm-ce-java11-20.2.0
export GRAALVM_HOME=/TODO/PATH/TO/GRAALVM/INSERT/HERE
export JAVA_HOME=${GRAALVM_HOME}

export PATH=${PATH}:${JAVA_HOME}/bin:${GRAALVM_HOME}/bin:/g/bin

# ---------------------------------------------------------------------------------

# needed only once
# gu install native-image
