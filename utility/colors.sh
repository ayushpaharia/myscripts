reset='\e[0m' # No Color
NCU='\e[4m' # No Underline
XB='\e[K'

BLACK='\e[0;30m'       BOLDBLACK='\e[1;30m'       UBLACK='\e[4;30m'        BBLACK='\e[40m'
RED='\e[0;31m'         BOLDRED='\e[1;31m'         URED='\e[4;31m'          BRED='\e[41m'
GREEN='\e[0;32m'       BOLDGREEN='\e[1;32m'       UGREEN='\e[4;32m'        BGREEN='\e[42m'
BROWNORANGE='\e[0;33m' BOLDBROWNORANGE='\e[1;33m' UBROWNORANGE='\e[4;33m'  BBROWNORANGE='\e[43m'
BLUE='\e[0;34m'        BOLDBLUE='\e[1;34m'        UBLUE='\e[4;34m'         BBLUE='\e[44m'
PURPLE='\e[0;35m'      BOLDPURPLE='\e[1;35m'      UPURPLE='\e[4;35m'       BPURPLE='\e[45m'
CYAN='\e[0;36m'        BOLDCYAN='\e[1;36m'        UCYAN='\e[4;36m'         BCYAN='\e[46m'
LIGHTGRAY='\e[0;37m'   BOLDWHITE='\e[1;37m'       UWHITE='\e[4;37m'        BWHITE='\e[47m'



printf "${BLACK}Black        \\\e[0;30   ${BOLDBLACK}[Bold] \\\e[1;30       ${NC}${UBLACK}[Underline] 4;30m${reset}   ${BBLACK}${BOLDWHITE}[Background]  \\\e[40m${reset}\n" 
printf "${RED}Red          \\\e[0;31   ${BOLDRED}[Bold] \\\e[1;31       ${NC}${URED}[Underline] 4;31m${reset}   ${BRED}${BOLDWHITE}[Background]  \\\e[41m\n" 
printf "${GREEN}Green        \\\e[0;32   ${BOLDGREEN}[Bold] \\\e[1;32       ${NC}${UGREEN}[Underline] 4;32m${reset}   ${BGREEN}${BOLDWHITE}[Background]  \\\e[42m\n"
printf "${BROWNORANGE}Brown/Orange \\\e[0;33   ${BOLDBROWNORANGE}[Bold] \\\e[1;33       ${NC}${UBROWNORANGE}[Underline] 4;33m${reset}   ${BBROWNORANGE}${BOLDWHITE}[Background]  \\\e[43m\n"
printf "${BLUE}Blue         \\\e[0;34   ${BOLDBLUE}[Bold] \\\e[1;34       ${NC}${UBLUE}[Underline] 4;34m${reset}   ${BBLUE}${BOLDWHITE}[Background]  \\\e[44m\n"
printf "${PURPLE}Purple       \\\e[0;35   ${BOLDPURPLE}[Bold] \\\e[1;35       ${NC}${UPURPLE}[Underline] 4;35m${reset}   ${BCYAN}${BOLDWHITE}[Background]  \\\e[45m\n"
printf "${CYAN}Cyan         \\\e[0;36   ${BOLDCYAN}[Bold] \\\e[1;36       ${NC}${UCYAN}[Underline] 4;36m${reset}   ${BWHITE}${BOLDBLACK}[Background]  \\\e[46m\n"
printf "${LIGHTGRAY}Light Gray   \\\e[0;37   ${BOLDWHITE}[Bold] \\\e[1;37       ${NC}${UWHITE}[Underline] 4;37m${reset}   ${BBLACK}${BOLDWHITE}[Background]  \\\e[47m\n"
printf "${reset}ANSI Reset   \\\e[0m     ${NCU}No Color Underline${reset}   \\\e[4m               ${BBLACK}${XB}Expand Background${reset}\n"