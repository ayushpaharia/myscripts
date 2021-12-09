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

function DoASpeedTest() {
    speedtestresult=$(speedtest)
    server1=$(echo $speedtestresult | egrep -o "((\w+)\s){2}\([0-9]+.[0-9]+.[0-9]+.[0-9]+\)" | awk '{print $1 " " $2}')
    server2=$(echo $speedtestresult | egrep -o "Hosted by (([[:alnum:].()]+)\s)+.[0-9]+\.[0-9]{2} km.: [0-9]+\.[0-9]{3} ms")
    ip=$(echo $speedtestresult | egrep -o "((\w+)\s){2}\([0-9]+.[0-9]+.[0-9]+.[0-9]+\)" | awk '{print $3}')
    download=$(echo $speedtestresult | egrep -o "Download:\s[0-9]+\.[0-9]+\sMbit/s")
    upload=$(echo $speedtestresult | egrep -o "Upload:\s[0-9]+\.[0-9]+\sMbit/s")
    ping=$(echo $speedtestresult | egrep -o "Hosted by (([[:alnum:].()]+)\s)+.[0-9]+\.[0-9]{2} km.: [0-9]+\.[0-9]{3} ms" |
    awk '{ print $(NF-1) " " $NF }')
    printf "${CYAN}[Speedtest]${NC}\n"
    printf "${WHITE}Config from: ${server1}${NC}\n"
    printf "${BOC}Testing from: ${server2}${BOC}\n"
    printf "${RED}IP: ${ip}\n${NC}"
    printf "${GREEN}${download}${NC}\n"
    printf "${PURPLE}${upload}${NC}\n"
    printf "${BLUE}Ping: ${ping}${NC}\n"
}

function PrintMenu() {
    printf "${CYAN}[Warp Script]${NC}\n"
    printf "${BOC}[Quick Setup]${NC}\n"
    printf "Enter q to ${RED}disconnect${NC}\n"
    printf "Enter Q to ${RED}Quit${NC} script\n"
    printf "Enter t for ${CYAN}speedtest${NC}\n"
    printf "Enter c to ${BOC}clear${NC} console\n"
    printf "Enter P to log ${WHITE}colors.sh${NC}\n"
    printf "Enter m for change ${GREEN}mode menu${NC}\n"
    printf "Enter C to ${BLUE}check${NC} if warp is on\n"
    printf "Enter D for ${BOC}default doh${NC} setup\n"
    printf "Enter W for ${PURPLE}default warp${NC} setup\n"
    printf "Enter U to get your current${CYAN} IP${NC}\n"
    printf "Enter T to get ${RED}IP${NC} through ${PURPLE}tor${NC}\n"
    printf "Enter M to Print ${BOC}Menu${NC}\n"
}

function InputSwitch() {
    case $1 in
            "sw"| "--setup-warp" | "-W" )
                WarpSetupMode sw # Warp + Doh
                WarpDelRegCon # Warp Delete Register Connect
                ;;
            "sd" | "--setup-doh" | "-D" )
                WarpSetupMode sd # Doh
                WarpDelRegCon # Warp Delete Register Connect
                ;;
            "q" | "--disconnect" )
                warp-cli disconnect >/dev/null
                printf "${RED}[Disconnected]${NC}\n"
                ;;
            "Q" | "--quit" )
                exit
                ;;
            "c" | "--clear" | "clear" )
                clear
                ;;
            "t" | "--speed-test" )
                DoASpeedTest
                ;;
            "cw" | "--check-warp" | "-C" )
                IsWarpOn # Check if warp is on
                ;;
            "m" | "--mode-menu" )
                ChangeModeMenu # Change mode menu
                ;;
            "colors" | "--colors" | "P" )
                bash /home/ayush/Desktop/myscripts/utility/colors.sh
                ;;
            "ip" | "--ip" | "U")
                wget -qO - https://api.ipify.org; echo
                ;;
            "ip-tor" | "T" )
                torsocks wget -qO - https://api.ipify.org; echo
                ;;
            "M" | "--menu")
                PrintMenu
                ;;
            * )
                printf "${RED}Invalid Input${NC}\n"
        esac
}

function Main(){
    InputSwitch $@

    while [ "$exitvar" != "Q" ]; do
        echo -n "-> "
        read exitvar

        InputSwitch $exitvar
    done
}

Main $@