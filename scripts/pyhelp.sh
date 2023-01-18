#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'

NC='\033[0m' # No Color

PREFX="\e[1;30m\e[1;43mpyhelp:\e[0m "

echo -e "$PREFX Hello"


PY2INTERPRETER=$(which python2)
if [ ! -z "$PY2INTERPRETER" ]; then
    echo -e "$PREFX found command: ${YELLOW}python2${NC} ---> $PY2INTERPRETER"
    echo -e "$PREFX ${RED}NOTE: Python2 is old, please use python3${NC}"
fi

PY3INTERPRETER=$(which python3)
CONDAINTERPRETER=$(which conda)
if [ -z "$PY3INTERPRETER" ]; then
    echo -e "$PREFX ${RED}no python3 interpreter found${NC}"
else

    echo -e "$PREFX found command: ${YELLOW}python3${NC} ---> $PY3INTERPRETER"

    if [[ ! "$PY3INTERPRETER" == *"anaconda"* ]]; then
        echo -e "$PREFX You are currently NOT using Anaconda"
        if [ -d "/opt/anaconda3" ]; then
            echo -e "$PREFX To start Anaconda run command \"${YELLOW}source /opt/anaconda3/bin/activate${NC}\""
        else
            if [ -z "$CONDAINTERPRETER" ]; then
                echo -e "$PREFX ${RED}Anaconda not found${NC}"
            else
                echo -e "$PREFX found command: ${YELLOW}conda${NC} ---> $CONDAINTERPRETER"
            fi
        fi
    else
        echo -e "$PREFX You are using Anaconda"
        echo -e "$PREFX found command: ${YELLOW}conda${NC} ---> $CONDAINTERPRETER"
        echo -e "$PREFX To exit Anaconda run command \"${YELLOW}conda deactivate${NC}\""
    fi
fi

PIPPATH=$(which pip)
PIP3PATH=$(which pip3)
if [ ! -z "$PIPPATH" ]; then
    echo -e "$PREFX found command ${YELLOW}pip${NC} ---> $PIPPATH"
fi
if [ ! -z "$PIP3PATH" ]; then
    echo -e "$PREFX found command ${YELLOW}pip3${NC} ---> $PIP3PATH"
fi

echo -e "$PREFX Bye"
