#!/bin/bash

# install to /usr/local/bin/
# $ sudo chown root:root /usr/local/bin/pyhelp
# $ sudo chmod 755 /usr/local/bin/pyhelp

RED='\033[0;31m'
YELLOW='\033[0;33m'

NC='\033[0m' # No Color

PREFX="\e[1;30m\e[1;43mpyhelp:\e[0m"

echo -e "$PREFX Hello"


PY2INTERPRETER=$(which python2)
if [ ! -z "$PY2INTERPRETER" ]; then
    echo -e "$PREFX *** Python 2 ***"
    echo -e "\tfound command: ${YELLOW}python2${NC} ---> $PY2INTERPRETER"
    echo -e "\t${RED}NOTE: Python2 is old, please use python3${NC}"
fi

echo -e "$PREFX *** Python 3 ***"
PY3INTERPRETER=$(which python3)
CONDAINTERPRETER=$(which conda)
if [ -z "$PY3INTERPRETER" ]; then
    echo -e "\t${RED}no python3 interpreter found${NC}"
else

    echo -e "\tfound command: ${YELLOW}python3${NC} ---> $PY3INTERPRETER"

    if [[ ! "$PY3INTERPRETER" == *"anaconda"* ]]; then
        echo -e "\tYou are currently NOT using Anaconda"

        if [ -d "/opt/anaconda3" ]; then
            if [[ "$PY3INTERPRETER" == "/usr/bin"* ]]; then
                echo -e "\tTo start Anaconda run command: ${YELLOW}source /opt/anaconda3/bin/activate${NC}"
            fi
        else
            if [ -z "$CONDAINTERPRETER" ]; then
                echo -e "\t${RED}Anaconda not found${NC}"
            else
                echo -e "\tfound command: ${YELLOW}conda${NC} ---> $CONDAINTERPRETER"
            fi
        fi

        if [[ "$PY3INTERPRETER" == "/usr/bin"* ]]; then
            echo -e "$PREFX *** Python 3 venv ***"
            echo -e "\t to create a new venv run command: ${YELLOW}python3 -m venv PROJECT_NAME_GOES_HERE${NC}"
            echo -e "\t to start your venv run command: ${YELLOW}source PROJECT_NAME_GOES_HERE/bin/activate${NC}"
            echo -e "\t to exit your venv: ${YELLOW}deactivate${NC}"
        else
            echo -e "$PREFX *** Python 3 venv ***"
            echo -e "\t it looks like youre using a virtual environment"
            echo -e "\t to exit your environment: ${YELLOW}deactivate${NC}"
        fi

    else
        echo -e "$PREFX You are using Anaconda"
        echo -e "$PREFX found command: ${YELLOW}conda${NC} ---> $CONDAINTERPRETER"
        echo -e "$PREFX to view conda environment details: ${YELLOW}conda info${NC}"
        echo -e "$PREFX To exit Anaconda run command: ${YELLOW}conda deactivate${NC}"
    fi
fi

echo -e "$PREFX *** Python 3 pip ***"
PIPPATH=$(which pip)
PIP3PATH=$(which pip3)
if [ ! -z "$PIPPATH" ]; then
    echo -e "\tfound command: ${YELLOW}pip${NC} ---> $PIPPATH"
else
    echo -e "\tcommand ${YELLOW}pip${NC} not found"
fi
if [ ! -z "$PIP3PATH" ]; then
    echo -e "\tfound command: ${YELLOW}pip3${NC} ---> $PIP3PATH"
else
    echo -e "\tcommand ${YELLOW}pip3${NC} not found"
fi

echo -e "$PREFX Bye"
