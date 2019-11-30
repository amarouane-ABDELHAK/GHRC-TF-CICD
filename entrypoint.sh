#! /bin/bash


function execute_script {
    echo "Running ./$1."
    bash ./$1
    exit_status=$?
    (($exit_status != 0)) && { printf '%s\n' "Command exited with non-zero"; exit $exit_status; }
    exit 0

}

# In case docker was not executed with -e flag build.sh will run by default
while test $# != 0
do
    case "$1" in
    -e) execute_script $2;;
    esac
    shift
done
echo "Note running docker with -e flag can override build.sh"

execute_script "build.sh"




