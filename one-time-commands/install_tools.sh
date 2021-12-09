function Main() {
    echo "This tool installs mode [gcc] [g++] [make] [npm] and [yarn] [libssl-dev] [git] [curl] \nDo you wish to proceed?[Y/N]"
    read -p "Press [Enter] key to continue..."
        read exitvar

        case $exitvar in
            "Y" )
                curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -

                sudo apt-get install gcc g++ make libssl-dev git curl 

                curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
                    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
                    sudo apt-get update && sudo apt-get install -y yarn

                sudo apt-get install -y nodejs
                ;;
            "N" )
                exit
                ;;
            * )
                printf "${RED}Invalid Input${NC}\n"
        esac
}
Main

