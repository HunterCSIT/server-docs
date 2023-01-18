#!/bin/bash

# install to /usr/local/bin/
# $ sudo chown root:root /usr/local/bin/pyhelp
# $ sudo chmod 755 /usr/local/bin/pyhelp

RED='\033[0;31m'
YELLOW='\e[1;45m\033[0;33m'

NC='\033[0m' # No Color

PREFX="\e[1;30m\e[1;43mpyhelp:\e[0m"
CMDPX="\e[1;44m\e[1;37m "
CMDSX=" \e[0m"

echo -e "$PREFX Hello"


PY2INTERPRETER=$(which python2)
if [ ! -z "$PY2INTERPRETER" ]; then
    echo -e "$PREFX *** Python 2 ***"
    echo -e "\tfound command: ${CMDPX}python2${CMDSX} ---> $PY2INTERPRETER"
    echo -e "\t${RED}NOTE: Python2 is old, please use python3${NC}"
fi

echo -e "$PREFX *** Python 3 ***"
PY3INTERPRETER=$(which python3)
CONDAINTERPRETER=$(which conda)
if [ -z "$PY3INTERPRETER" ]; then
    echo -e "\t${RED}no python3 interpreter found${NC}"
else

    echo -e "\tfound command: ${CMDPX}python3${CMDSX} ---> $PY3INTERPRETER"

    if [[ ! "$PY3INTERPRETER" == *"anaconda"* ]]; then
        echo -e "\tYou are currently NOT using Anaconda"

        if [ -d "/opt/anaconda3" ]; then
            if [[ "$PY3INTERPRETER" == "/usr/bin"* ]]; then
                echo -e "\tTo start Anaconda run command: ${CMDPX}source /opt/anaconda3/bin/activate${CMDSX}"
            fi
        else
            if [ -z "$CONDAINTERPRETER" ]; then
                echo -e "\t${RED}Anaconda not found${NC}"
            else
                echo -e "\tfound command: ${CMDPX}conda${CMDSX} ---> $CONDAINTERPRETER"
            fi
        fi

        if [[ "$PY3INTERPRETER" == "/usr/bin"* ]]; then
            echo -e "$PREFX *** Python 3 venv ***"
            echo -e "\t to create a new venv run command: ${CMDPX}python3 -m venv PROJECT_NAME_GOES_HERE${CMDSX}"
            echo -e "\t to start your venv run command: ${CMDPX}source PROJECT_NAME_GOES_HERE/bin/activate${CMDSX}"
            echo -e "\t to exit your venv: ${CMDPX}deactivate${CMDSX}"
        else
            echo -e "$PREFX *** Python 3 venv ***"
            echo -e "\t it looks like youre using a virtual environment"
            echo -e "\t to exit your environment: ${CMDPX}deactivate${CMDSX}"
        fi

    else
        echo -e "$PREFX You are using Anaconda"
        echo -e "$PREFX found command: ${CMDPX}conda${CMDSX} ---> $CONDAINTERPRETER"
        echo -e "$PREFX to view conda environment details: ${CMDPX}conda info${CMDSX}"
        echo -e "$PREFX To exit Anaconda run command: ${CMDPX}conda deactivate${CMDSX}"
    fi
fi

echo -e "$PREFX *** Python 3 pip ***"
PIPPATH=$(which pip)
PIP3PATH=$(which pip3)
if [ ! -z "$PIPPATH" ]; then
    echo -e "\tfound command: ${CMDPX}pip${CMDSX} ---> $PIPPATH"
else
    echo -e "\tcommand ${CMDPX}pip${CMDSX} not found"
fi
if [ ! -z "$PIP3PATH" ]; then
    echo -e "\tfound command: ${CMDPX}pip3${CMDSX} ---> $PIP3PATH"
else
    echo -e "\tcommand ${CMDPX}pip3${CMDSX} not found"
fi

echo -e "$PREFX Bye"
