NC='\e[0m' # reset

RED='\e[1;31m'
GREEN='\e[1;32m'
BOC='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'

function Main(){
    if [ -e ~/.ssh/id_rsa.pub  ] && [ -e ~/.ssh/id_rsa.pub ]
    then
        printf "${GREEN}[SSH Keys Found]${NC}\n"
    else
        printf "${RED}SSH-key does not exist${NC}\n"
        printf "${CYAN}Enter an email to use with SSH${NC}\n"
        echo -n "-> "
        read email
        printf "${CYAN}Generating SSH-key${NC}\n"
        ssh-keygen -t rsa -b 4096 -C $email
    fi
}

Main