#!/bin/sh

show_menu(){
    white=`echo "\033[m"`
    blue=`echo "\033[36m"`
    cyan=`echo "\033[1;36m"`
    yellow=`echo "\033[1;33m"`
    green=`echo "\033[01;32m"`
    red=`echo "\033[01;31m"`
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${blue}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |                            ${cyan}v1.3                            ${white}| \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " [============================================================] \n"
    printf " | ${blue}INSTALLATION                                               ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Install ${green}Moonraker ${white}and ${green}Nginx                           ${white}| \n"
    printf " |  ${yellow} 2)${white} Install ${green}Fluidd ${white}(port 4408)                            ${white}| \n"
    printf " |  ${yellow} 3)${white} Install ${green}Mainsail ${white}(port 4409)                          ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 4)${white} Install ${green}Entware                                       ${white}| \n"
    printf " |  ${yellow} 5)${white} Install ${green}Mobileraker Companion                         ${white}| \n"
    printf " |  ${yellow} 6)${white} Install ${green}Klipper Adaptive Meshing & Purging            ${white}| \n"
    printf " |                                                            | \n"
    printf " [============================================================] \n"
    printf " | ${blue}UNINSTALLATION                                             ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 7)${white} Remove ${green}Fluidd                                         ${white}| \n"
    printf " |  ${yellow} 8)${white} Remove ${green}Mainsail                                       ${white}| \n"
    printf " |  ${yellow} 9)${white} Remove ${green}Moonraker ${white}and ${green}Nginx                            ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 10)${white} Remove ${green}Mobileraker Companion                         ${white}| \n"
    printf " |  ${yellow} 11)${white} Remove ${green}Klipper Adaptive Meshing & Purging            ${white}| \n"
    printf " |                                                            | \n"
    printf " [============================================================] \n"
    printf " | ${blue}BACKUP AND RESTORE                                         ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 12)${white} Backup configuration files                           ${white}| \n"
    printf " |  ${yellow} 13)${white} Restore configuration files                          ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |  ${yellow} r)${white} Reload Moonraker and Nginx                            ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt
    printf "${white}\n"
}

option_picked(){
    white=`echo "\033[m"`
    red=`echo "\033[31m"`
    message=${@:-"${white}Error: No message passed"}
    clear;
    printf "\n"
    printf "${red} ${message}${white}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) DIR1=/usr/data/moonraker/
            DIR2=/usr/data/fluidd/
            DIR3=/usr/data/mainsail/
            if [ -d "$DIR1" ];
            then
                option_picked "Moonraker and Nginx are already installed!";
                printf "\n"
                show_menu;
            else
                printf "${green}Installing Moonraker and Nginx...${white}\n"
                cd /usr/data
                wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker.tar
                tar -xvf moonraker.tar
                [ ! -e /etc/init.d/S50nginx ] && cp nginx/S50nginx /etc/init.d/
                [ ! -e /etc/init.d/S56moonraker_service ] && cp moonraker/S56moonraker_service /etc/init.d/
                rm -f moonraker.tar
                if [ ! -d "$DIR2" -a -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_mainsail.conf
                    cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_mainsail.conf
                elif [ -d "$DIR2" -a ! -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_fluidd.conf
                    cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_fluidd.conf
                elif [ -d "$DIR2" -a -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_both.conf
                    cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_both.conf
                else
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker.conf
                    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker.conf
                fi
                cd /usr/data/moonraker/moonraker
                git stash; git checkout master; git pull
                /etc/init.d/S50nginx start
                sleep 1
                /etc/init.d/S56moonraker_service start
                sleep 1
                printf "\n${green} Moonraker ${white}and ${green}Nginx ${white}have been installed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        2) DIR1=/usr/data/fluidd/
            DIR2=/usr/data/mainsail/
            DIR3=/usr/data/moonraker/
            if [ -d "$DIR1" ];
            then
                option_picked "Fluidd is already installed!";
                printf "\n"
                show_menu;
            elif [ ! -d "$DIR3" ];
            then
                option_picked "Please install Moonraker and Nginx first!";
                printf "\n"
                show_menu;
            else
                printf "${green}Installing Fluidd...${white}\n"
                mkdir /usr/data/fluidd
	            cd /usr/data/fluidd
	            wget -q -O fluidd.zip https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip && unzip fluidd.zip && rm fluidd.zip
                cd /usr/data
                if [ -d "$DIR2" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_both.conf
                    cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_both.conf
                else
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_fluidd.conf
                    cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_fluidd.conf
                fi
                /etc/init.d/S50nginx restart
                sleep 1
                /etc/init.d/S56moonraker_service restart
                sleep 1
                printf "\n${green} Fluidd${white} has been installed ${green}successfully${white}!\n"
                printf " You can now connect to Fluidd Web Interface with: ${yellow}https://xxx.xxx.xxx.xxx:4408${white}\n\n"
                show_menu;
            fi
        ;;
        3) DIR1=/usr/data/mainsail/
            DIR2=/usr/data/fluidd/
            DIR3=/usr/data/moonraker/
            if [ -d "$DIR1" ];
            then
                option_picked "Mainsail is already installed!";
                printf "\n"
                show_menu;
            elif [ ! -d "$DIR3" ];
            then
                option_picked "Please install Moonraker and Nginx first!";
                printf "\n"
                show_menu;
            else
                printf "${green}Installing Mainsail...${white}\n"
                mkdir /usr/data/mainsail
	            cd /usr/data/mainsail
	            wget -q -O mainsail.zip https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip && unzip mainsail.zip && rm mainsail.zip
                cd /usr/data
                if [ -d "$DIR2" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_both.conf
                    cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_both.conf
                else
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_mainsail.conf
                    cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_mainsail.conf
                fi
                /etc/init.d/S50nginx restart
                sleep 1
                /etc/init.d/S56moonraker_service restart
                sleep 1
                printf "\n${green} Mainsail ${white}has been installed ${green}successfully${white}!\n"
                printf " You can now connect to Mainsail Web Interface with: ${yellow}https://xxx.xxx.xxx.xxx:4409${white}\n\n"
                show_menu;
            fi
        ;;
        4) printf "${green}Installing Entware...${white}\n"
            echo "Making /opt directory on data partition where there is space, and adding a symbolic link..."
            rm -rf /opt/*
            mkdir /usr/data/opt
            ln -nsf /usr/data/opt /opt
            echo "Installing Entware using generic installer script..."
            wget -O - http://bin.entware.net/mipselsf-k3.4/installer/generic.sh | /bin/sh
            echo "Adding /opt/bin and /opt/sbin to the start of the PATH in the system profile..."
            sed -i 's/export PATH="\/bin:/export PATH="\/opt\/bin:\/opt\/sbin:\/bin:/' /etc/profile
            echo "Adding startup script..."
            echo -e '#!/bin/sh\n/opt/etc/init.d/rc.unslung "$1"' > /etc/init.d/S50unslung
            chmod 755 /etc/init.d/S50unslung
            printf "\n${green} Entware ${white}has been installed ${green}successfully${white}!\n"
            printf " Log out and log back in, and you can install packages with: ${yellow}opkg install <packagename>${white}\n\n"
            show_menu;
        ;;
        5) DIR1=/usr/data/mobileraker_companion/
            if [ -d "$DIR1" ];
            then
                option_picked "Mobileraker Companion is already installed!";
                printf "\n"
                show_menu;
            else
                printf "${green}Installing Mobileraker Companion...${white}\n"
                cd /usr/data
                echo "Installing prerequisite python packages..."
                pip3 install requests websockets pytz coloredlogs
                echo 'Done'
                echo "Downloading modified version of Mobileraker Companion for K1..."
                echo "Cloning mobileraker_companion github repository..."
                git clone --depth 1 https://github.com/Clon1998/mobileraker_companion
                cd mobileraker_companion
                echo 'Getting K1 compatibility patches..'
                wget https://openk1.org/static/k1/patches/mobileraker-companion-k1-no-tzlocal.patch
                echo 'Applying K1 compatibility patches..'
                patch -p1 < mobileraker-companion-k1-no-tzlocal.patch
                echo "Adding startup script..."
                cp S80mobileraker_companion /etc/init.d/S80mobileraker_companion
                chmod 755 /etc/init.d/S80mobileraker_companion
                echo "Starting service..."
                /etc/init.d/S80mobileraker_companion restart
                printf "\n${green} Mobileraker Companion ${white}has been installed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        6) DIR1=/usr/data/Klipper-Adaptive-Meshing-Purging
            if [ -d "$DIR1" ];
            then
                option_picked "Klipper Adaptive Meshing & Purging is already installed!";
                printf "\n"
                show_menu;
            else
                printf "${green}Installing Klipper Adaptive Meshing & Purging...${white}\n"
                cd /usr/data
                git clone https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging.git
                ln -sv /usr/data/Klipper-Adaptive-Meshing-Purging/Configuration printer_data/config/KAMP
                cp Klipper-Adaptive-Meshing-Purging/Configuration/KAMP_Settings.cfg printer_data/config/KAMP_Settings.cfg
                printf "\n${green} Klipper Adaptive Meshing & Purging ${white}has been installed ${green}successfully${white}!\n\n"
                printf " Don't miss to enable ${yellow}enable_object_processing: True ${white}in moonraker.conf file.\n\n"
                printf " You can also add this for future updates of KAMP:\n"
                printf "\n${yellow} [update_manager Klipper Adaptive Meshing Purging]"
                printf "\n${yellow} type: git_repo"
                printf "\n${yellow} channel: dev"
                printf "\n${yellow} path: /usr/data/Klipper-Adaptive-Meshing-Purging"
                printf "\n${yellow} origin: https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging.git"
                printf "\n${yellow} managed_services: klipper"
                printf "\n${yellow} primary_branch: main${white}\n\n"
                show_menu;
            fi
        ;;
        7) DIR1=/usr/data/fluidd/
            DIR2=/usr/data/mainsail/
            DIR3=/usr/data/moonraker/
            if [ ! -d "$DIR1" ];
            then
                option_picked "Fluidd is not installed!";
                printf "\n"
                show_menu;
            else
                rm -rf /usr/data/fluidd
                if [ -d "$DIR2" -a -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_mainsail.conf
                    cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_mainsail.conf
                elif [ -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker.conf
                    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker.conf
                fi
                printf "\n${green} Fluidd ${white}has been removed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        8) DIR1=/usr/data/fluidd/
            DIR2=/usr/data/mainsail/
            DIR3=/usr/data/moonraker/
            if [ ! -d "$DIR2" ];
            then
                option_picked "Mainsail is not installed!";
                printf "\n"
                show_menu;
            else
                rm -rf /usr/data/mainsail
                if [ -d "$DIR1" -a -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker_fluidd.conf
                    cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker_fluidd.conf
                elif [ -d "$DIR3" ];
                then
                    wget https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker.conf
                    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    rm -f moonraker.conf
                fi
                printf "\n${green} Mainsail ${white}has been removed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        9) DIR1=/usr/data/moonraker/
            DIR2=/usr/data/nginx/
            if [[ ! -d "$DIR1" -a ! -d "$DIR2" ]]; 
            then
                option_picked "Moonraker and Nginx are not installed!";
                printf "\n"
                show_menu;
            else
                printf "${white}"
                cd /overlay/upper
                /etc/init.d/S50nginx stop
                /etc/init.d/S56moonraker_service stop
                rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service 
                rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/printer_data/.moonraker.uuid /usr/data/printer_data/moonraker.asvc /usr/data/nginx /usr/data/moonraker
                printf "\n${green} Moonraker ${white}and ${green}Nginx ${white}have been removed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        10) DIR1=/usr/data/mobileraker_companion/
            if [[ ! -d "$DIR1" ]]; 
            then
                option_picked "Mobileraker Companion is not installed!";
                printf "\n"
                show_menu;
            else
                printf "${white}"
                /etc/init.d/S80mobileraker_companion stop
                rm -rf /etc/init.d/S80mobileraker_companion /usr/data/mobileraker_companion
                printf "\n${green} Mobileraker Companion ${white}have been removed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        11) DIR1=/usr/data/Klipper-Adaptive-Meshing-Purging
            if [[ ! -d "$DIR1" ]]; 
            then
                option_picked "Klipper Adaptive Meshing & Purging is not installed!";
                printf "\n"
                show_menu;
            else
                printf "${white}"
                rm -rf /usr/data/Klipper-Adaptive-Meshing-Purging /usr/data/printer_data/config/KAMP /usr/data/printer_data/config/KAMP_Settings.cfg
                printf "\n${green} Klipper Adaptive Meshing & Purging ${white}have been removed ${green}successfully${white}!\n\n"
                show_menu;
            fi
        ;;
        12) FILE=/root/backup_config.tar
            if [[ -f "$FILE" ]]; 
            then
                rm -f /root/backup_config.tar
            fi
            cd /usr/data/printer_data
            tar -czvf /root/backup_config.tar config/
            printf "\n${white} Klipper configuration files have been saved ${green}successfully${white} in ${yellow}/root ${white}folder!\n\n"
            show_menu;
        ;;
        13) DIR1=/usr/data/printer_data/config/
            FILE=/root/backup_config.tar
            if [[ -f "$FILE" ]]; 
            then
                if [[ -d "$DIR1" ]]; 
                then
                    rm -rf /usr/data/printer_data/config
                fi
                cp /root/backup_config.tar /usr/data/printer_data/
                cd /usr/data/printer_data
                tar -xvf backup_config.tar
                rm -f backup_config.tar
                printf "\n${white} Klipper configuration files have been restored ${green}successfully${white}!\n\n"
                show_menu;
            else
                option_picked "Please backup configuration file before restore!";
                printf "\n"
                show_menu;
            fi
        ;;
        r) DIR1=/usr/data/moonraker/
            DIR2=/usr/data/nginx/
            if [[ ! -d "$DIR1" -a ! -d "$DIR2" ]]; 
            then
                option_picked "Moonraker is not installed!";
                printf "\n"
                show_menu;
            else
                /etc/init.d/S50nginx stop
                /etc/init.d/S56moonraker_service stop
                /etc/init.d/S56moonraker_service start
                sleep 1
                /etc/init.d/S50nginx start
                sleep 1
                printf "\n${green} Moonraker services ${white}has been reloaded!\n\n"
                show_menu;
            fi
        ;;
        q)exit;
        ;;
        *)clear;
            option_picked "Please select a correct choice!";
            printf "\n"
            show_menu;
        ;;
      esac
    fi
done

