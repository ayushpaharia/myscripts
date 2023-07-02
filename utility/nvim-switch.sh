#!/bin/bash

NC='\e[0m' # reset

RED='\e[1;31m'
GREEN='\e[1;32m'
BOC='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'

function PrintMenu() {
  printf "${WHITE}Switch NVIM type - ${NC}(${CYAN}Astronvim${NC}, ${BOC}Customnvim${NC})\n"
#    printf "${CYAN}[Astronvim 🚀$]${NC}\n"
#    printf "${BOC}[Customnvim 🛠️${NC}\n"
}


CONFIG="~/.config"

function InputSwitch() {
    case $1 in
            "Q" )
              exit
              ;;
            "M" | "--menu")
                PrintMenu   
              ;;
            "A" )
                  cp -r ${CONFIG}/nvim-old/ ${CONFIG}/nvim/
                  printf "Switched to ${CYAN}[Astronvim 🚀$]${NC}\n"
                ;;
            "C" )
                  cp -r ${CONFIG}/nvim-custom/ ${CONFIG}/nvim/
                ;;
            * )
             $1 
        esac
}

function Main(){
    PrintMenu
    while [ "$exitvar" != "Q" ]; do
        echo -n "-> "
        read exitvar

        InputSwitch $exitvar
    done
}

Main $@
