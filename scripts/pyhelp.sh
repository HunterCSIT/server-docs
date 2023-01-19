#!/bin/bash

# install to /usr/local/bin/
# $ sudo chown root:root /usr/local/bin/pyhelp
# $ sudo chmod 755 /usr/local/bin/pyhelp

# Add to /etc/bash.bashrc
# echo -e "\nrun command \e[1;44m\e[1;37m pyhelp \e[0m to view Python environment\n"


# https://github.com/HunterCSIT/server-docs/blob/main/scripts/pyhelp.sh

RED='\033[0;31m'
NC='\033[0m' # No Color

PREFX="pyhelp: "
CMDPX="\e[1;44m\e[1;37m "
CMDSX=" \e[0m"
BOLD="\033[1m"

PY2INTERPRETER=$(which python2)
PY3INTERPRETER=$(which python3)
CONDAINTERPRETER=$(which conda)

echo -e "$PREFX Hello"


if [ ! -z "$PY2INTERPRETER" ]; then
    echo -e "\n$PREFX ${BOLD}Python 2${NC}"
    echo -e "$PREFX found command: ${CMDPX}python2${CMDSX} ---> ${BOLD}$PY2INTERPRETER${NC}"
    echo -e "$PREFX ${RED}NOTE: Python2 is old, please use python3${NC}"
fi

echo -e "\n$PREFX ${BOLD}Python 3${NC}"
# Python3 interpreter
if [ -z "$PY3INTERPRETER" ]; then
    echo -e "$PREFX ${RED}no python3 interpreter found${NC}"
else
    echo -e "$PREFX found command: ${CMDPX}python3${CMDSX} ---> ${BOLD}$PY3INTERPRETER${NC}"
    echo -e "$PREFX current python3 interpreter"
    if [[ "$PY3INTERPRETER" == "/usr/bin"* ]]; then
        echo -e "$PREFX \t[x] ${BOLD}system python${NC}"
    else
        echo -e "$PREFX \t[ ] system python"
    fi
    if [[ "$PY3INTERPRETER" == *"conda"* ]]; then
        echo -e "$PREFX \t[x] ${BOLD}anaconda python${NC}"
    else
        echo -e "$PREFX \t[ ] anaconda python"
    fi
    if [[ ! "$PY3INTERPRETER" == *"conda"* ]] && [[ ! "$PY3INTERPRETER" == "/usr/bin"* ]]; then
        echo -e "$PREFX \t[x] ${BOLD}other virtual environment python${NC}"
    else
        echo -e "$PREFX \t[ ] other virtual environment python"
    fi

    # Anaconda instructions
    echo -e "\n$PREFX ${BOLD}Anaconda${NC}"
    if [ -d "/opt/anaconda3" ]; then
        if [ ! -z "$CONDAINTERPRETER" ]; then
            echo -e "$PREFX found command: ${CMDPX}conda${CMDSX} ---> ${BOLD}$CONDAINTERPRETER${NC}"
        fi
        if [[ ! "$PY3INTERPRETER" == *"conda"* ]]; then
            echo -e "$PREFX To start Anaconda run command: ${CMDPX}source /opt/anaconda3/bin/activate${CMDSX}"
        elif [ ! -z "$CONDAINTERPRETER" ]; then
            echo -e "$PREFX to view conda environment details: ${CMDPX}conda info${CMDSX}"
            echo -e "$PREFX To exit Anaconda run command: ${CMDPX}conda deactivate${CMDSX}"
        fi
    else
        echo -e "$PREFX ${RED}Anaconda not found${NC}"
    fi

    # VENV instructions
    if [[ ! "$PY3INTERPRETER" == "/usr/bin"* ]] && [[ ! "$PY3INTERPRETER" == *"conda"* ]]; then
        echo -e "\n$PREFX ${BOLD}venv${NC}"
        echo -e "$PREFX to exit your environment: ${CMDPX}deactivate${CMDSX}"
    elif [[ ! "$PY3INTERPRETER" == *"conda"* ]]; then
        echo -e "\n$PREFX ${BOLD}venv${NC}"
        echo -e "$PREFX to create a new venv run command: ${CMDPX}python3 -m venv PROJECT_NAME_GOES_HERE${CMDSX}"
        echo -e "$PREFX to start your venv run command: ${CMDPX}source PROJECT_NAME_GOES_HERE/bin/activate${CMDSX}"
    fi
fi

# pip instructions
echo -e "\n$PREFX ${BOLD}pip${NC}"
PIPPATH=$(which pip)
PIP3PATH=$(which pip3)
if [ ! -z "$PIPPATH" ]; then
    echo -e "$PREFX found command: ${CMDPX}pip${CMDSX} ---> ${BOLD}$PIPPATH${NC}"
else
    echo -e "$PREFX ${RED}command pip not found${NC}"
fi
if [ ! -z "$PIP3PATH" ]; then
    echo -e "$PREFX found command: ${CMDPX}pip3${CMDSX} ---> ${BOLD}$PIP3PATH${NC}"
else
    echo -e "$PREFX ${RED}command pip3 not found${NC}"
fi

echo -e "\n$PREFX
echo -e "$PREFX Need help? Email cstechsp@hunter.cuny.edu"
echo -e "$PREFX Bye"
