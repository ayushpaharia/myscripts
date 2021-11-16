NC='\e[0m' # reset

RED='\e[1;31m'
GREEN='\e[1;32m'
BOC='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'
WHITE='\e[1;37m'

function WarpSetupMode() {
    if [ "$1" == "sw" ]; then
        warp-cli set-mode warp+doh >/dev/null
        printf "Mode set to ${CYAN}[warp+doh]${NC}\n"
    elif [ "$1" == "sd" ]; then
        warp-cli set-mode doh >/dev/null
        printf "Mode set to ${BOC}[doh]${NC}\n"
    else 
        printf "${RED}Invalid Input${NC}\n"
    fi
}

function WarpDelRegCon() {
    warp-cli delete >/dev/null
    printf "${RED}[Profile Deleted]${NC}\n"

    warp-cli register >/dev/null
    printf "${CYAN}[Profile Registered]${NC}\n"

    warp-cli connect >/dev/null
    printf "${GREEN}[Connected]${NC}\n"
}

function IsWarpOn() {
    warponoff=$(curl --silent https://www.cloudflare.com/cdn-cgi/trace/ | awk '(/warp/)')
    if [ "$warponoff" = "warp=on" ]; then
        printf "${GREEN}Warp is [ON]${myvar}${NC}\n"
    else
        printf "${RED}Warp is [OFF]${myvar}${NC}\n"
    fi
}

function ChangeModeMenu() {
    printf "Enter mode to change to ${CYAN}[warp]${NC}, ${BOC}[doh]${NC} - "; read changedmode
    if [ "$changedmode" = "warp" ]; then
        warp-cli set-mode warp+doh >/dev/null
        printf "Mode set to ${CYAN}[warp+doh]${NC}\n"
    elif [ "$changedmode" = "doh" ]; then
        warp-cli set-mode doh >/dev/null
        printf "Mode set to ${BOC}[doh]${NC}\n"
    else
        printf "${RED}Incorrect Input${NC}\n"
    fi
}

function PrintMenu() {
    printf "${CYAN}[Warp Script]${NC}\n"
    printf "${BOC}[Quick Setup]${NC}\n"
    printf "Enter q to ${RED}disconnect${NC}\n"
    printf "Enter t for ${CYAN}speedtest${NC}\n"
    printf "Enter c to ${BOC}clear${NC} console\n"
    printf "Enter colors to log ${WHITE}colors.sh${NC}\n"
    printf "Enter m for change ${GREEN}mode menu${NC}\n"
    printf "Enter cw to ${BLUE}check${NC} if warp is on\n"
    printf "Enter sd for ${BOC}default doh${NC} setup\n"
    printf "Enter sw for ${PURPLE}default warp${NC} setup\n"
}

function Main(){
    PrintMenu # Prints Menu

    while [ "$exitvar" != "q" ]; do
        echo -n "-> "
        read exitvar

        case $exitvar in
            "sw" )
                WarpSetupMode sw # Warp + Doh
                WarpDelRegCon # Warp Delete Register Connect
                ;;
            "sd" )
                WarpSetupMode sd # Doh
                WarpDelRegCon # Warp Delete Register Connect
                ;;
            "q" )
                warp-cli disconnect >/dev/null
                printf "${RED}[Disconnected]${NC}\n"
                ;;
            "c" )
                clear
                ;;
            "t" )
                speedtestresult=$(speedtest --simple)
                download=$(echo $speedtestresult | egrep -o "Download:\s[0-9]+\.[0-9]+\sMbit/s")
                upload=$(echo $speedtestresult | egrep -o "Upload:\s[0-9]+\.[0-9]+\sMbit/s")
                ping=$(echo $speedtestresult | egrep -o "Ping:\s[0-9]+\.[0-9]+\sms")
                printf "${GREEN}${download}${NC}\n"
                printf "${PURPLE}${upload}${NC}\n"
                printf "${BLUE}${ping}${NC}\n"
                ;;
            "cw" )
                IsWarpOn # Check if warp is on
                ;;
            "m" )
                ChangeModeMenu # Change mode menu
                ;;
            "colors" )
                bash /home/ayush/Desktop/scripts/utility/colors.sh
                ;;
            * )
                printf "${RED}Invalid Input${NC}\n"
        esac
    done
}

Main