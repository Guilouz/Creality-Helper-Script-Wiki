#!/bin/sh

clear

main_menu(){
    white=`echo "\033[m"`
    blue=`echo "\033[36m"`
    cyan=`echo "\033[1;36m"`
    yellow=`echo "\033[1;33m"`
    green=`echo "\033[01;32m"`
    red=`echo "\033[01;31m"`
    darkred=`echo "\033[31m"`
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                       ${yellow} [ Main Menu ]                       ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " | ${darkred}/!\ ONLY USE THIS SCRIPT WITH FIRMWARE 1.3.2.1 AND ABOVE!  ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Open ${green}[Install] ${white}Menu                                   | \n"
    printf " |  ${yellow} 2)${white} Open ${green}[Remove] ${white}Menu                                    | \n"
    printf " |  ${yellow} 3)${white} Open ${green}[Backup & Restore] ${white}Menu                          | \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} r)${white} Reload Moonraker and Nginx                            ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " | ${cyan}v2.0                                                       ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_main_menu
    printf "${white}\n"
}

install_menu(){
    white=`echo "\033[m"`
    blue=`echo "\033[36m"`
    cyan=`echo "\033[1;36m"`
    yellow=`echo "\033[1;33m"`
    green=`echo "\033[01;32m"`
    red=`echo "\033[01;31m"`
    darkred=`echo "\033[31m"`
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                     ${yellow} [ Install Menu ]                      ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Install ${green}Moonraker ${white}and ${green}Nginx                           ${white}| \n"
    printf " |  ${yellow} 2)${white} Install ${green}Fluidd ${white}(port 4408)                            ${white}| \n"
    printf " |  ${yellow} 3)${white} Install ${green}Mainsail ${white}(port 4409)                          ${white}| \n"
    printf " |  ${yellow} 4)${white} Install ${green}Moonraker Timelapse                           ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 5)${white} Install ${green}Entware                                       ${white}| \n"
    printf " |  ${yellow} 6)${white} Install ${green}Mobileraker Companion                         ${white}| \n"
    printf " |  ${yellow} 7)${white} Install ${green}Klipper Adaptive Meshing & Purging            ${white}| \n"
    printf " |  ${yellow} 8)${white} Install ${green}Hostname Service ${white}file                         ${white}| \n"
    printf " |  ${yellow} 9)${white} Install ${green}Custom Boot Display ${white}                          ${white}| \n"
    printf " | ${yellow} 10)${white} Install ${green}Buzzer Support ${white}files                          ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " | ${cyan}v2.0                                                       ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_install_menu
    printf "${white}\n"
}

uninstall_menu(){
    white=`echo "\033[m"`
    blue=`echo "\033[36m"`
    cyan=`echo "\033[1;36m"`
    yellow=`echo "\033[1;33m"`
    green=`echo "\033[01;32m"`
    red=`echo "\033[01;31m"`
    darkred=`echo "\033[31m"`
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                     ${yellow} [ Remove Menu ]                       ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Remove ${green}Fluidd                                         ${white}| \n"
    printf " |  ${yellow} 2)${white} Remove ${green}Mainsail                                       ${white}| \n"
    printf " |  ${yellow} 3)${white} Remove ${green}Moonraker Timelapse                            ${white}| \n"
    printf " |  ${yellow} 4)${white} Remove ${green}Moonraker ${white}and ${green}Nginx                            ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 5)${white} Remove ${green}Mobileraker Companion                          ${white}| \n"
    printf " |  ${yellow} 6)${white} Remove ${green}Klipper Adaptive Meshing & Purging             ${white}| \n"
    printf " |  ${yellow} 7)${white} Remove ${green}Hostname Service ${white}file                          ${white}| \n"
    printf " |  ${yellow} 8)${white} Remove ${green}Custom Boot Display ${white}                           ${white}| \n"
    printf " |  ${yellow} 9)${white} Remove ${green}Buzzer Support ${white}files                           ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " | ${cyan}v2.0                                                       ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_uninstall_menu
    printf "${white}\n"
}

backup_menu(){
    white=`echo "\033[m"`
    blue=`echo "\033[36m"`
    cyan=`echo "\033[1;36m"`
    yellow=`echo "\033[1;33m"`
    green=`echo "\033[01;32m"`
    red=`echo "\033[01;31m"`
    darkred=`echo "\033[31m"`
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                ${yellow} [ Backup & Restore Menu ]                  ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Backup configuration files                            ${white}| \n"
    printf " |  ${yellow} 2)${white} Restore configuration files                           ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " | ${cyan}v2.0                                                       ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_backup_menu
    printf "${white}\n"
}

while [ 1 ]
do
    main_menu
    case $opt_main_menu in
        1)
            while [ 1 ]
            do
                install_menu
                case $opt_install_menu in
                    1)
                        DIR1=/usr/data/moonraker/
            			DIR2=/usr/data/fluidd/
            			DIR3=/usr/data/mainsail/
            			URL="https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker.tar"
            			if [ -d "$DIR1" ];
            			then
            				printf "${darkred} Moonraker and Nginx are already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Moonraker and Nginx${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Moonraker and Nginx...${white}\n"
                			    cd /usr/data
                			    wget --no-check-certificate "$URL"
                			    if [ $? -eq 0 ]; then
                			        tar -xvf moonraker.tar
                			        [ ! -e /etc/init.d/S50nginx ] && cp nginx/S50nginx /etc/init.d/
                			        [ ! -e /etc/init.d/S56moonraker_service ] && cp moonraker/S56moonraker_service /etc/init.d/
                			        rm -f moonraker.tar
                			        if [ ! -d "$DIR2" -a -d "$DIR3" ]; then
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_mainsail.conf
                    			        cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_mainsail.conf
                			        elif [ -d "$DIR2" -a ! -d "$DIR3" ]; then
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_fluidd.conf
                    			        cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_fluidd.conf
                			        elif [ -d "$DIR2" -a -d "$DIR3" ]; then
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_both.conf
                    			        cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_both.conf
                			        else
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker.conf
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
                			    else
                			        printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    2)
                        DIR1=/usr/data/fluidd/
            			DIR2=/usr/data/mainsail/
            			DIR3=/usr/data/moonraker/
            			URL="https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip"
            			if [ -d "$DIR1" ]; then
            				printf "${darkred} Fluidd is already installed!${white}\n\n"
            			elif [ ! -d "$DIR3" ]; then
            				printf "${darkred} Please install Moonraker and Nginx first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Fluidd${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Fluidd...${white}\n"
	            			    cd /usr/data
	            			    wget --no-check-certificate "$URL"
	            			    if [ $? -eq 0 ]; then
	            			        mkdir /usr/data/fluidd
	            			        mv fluidd.zip fluidd
                			        cd /usr/data/fluidd
                			        unzip fluidd.zip && rm fluidd.zip
                			        if [ -d "$DIR2" ]; then
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_both.conf
                    			        cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_both.conf
                			        else
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_fluidd.conf
                    			        cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_fluidd.conf
                			        fi
                			        /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n${green} Fluidd${white} has been installed ${green}successfully${white}!\n\n"
                			        printf " You can now connect to Fluidd Web Interface with: ${yellow}https://xxx.xxx.xxx.xxx:4408${white}\n\n"
                			    else
                			        printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
                        DIR1=/usr/data/mainsail/
            			DIR2=/usr/data/fluidd/
            			DIR3=/usr/data/moonraker/
            			URL="https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip"
            			if [ -d "$DIR1" ]; then
            				printf "${darkred} Mainsail is already installed!${white}\n\n"
            			elif [ ! -d "$DIR3" ]; then
            				printf "${darkred} Please install Moonraker and Nginx first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Mainsail${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Mainsail...${white}\n"
                			    cd /usr/data
                			    wget --no-check-certificate "$URL"
	            			    if [ $? -eq 0 ]; then
	            			        mkdir /usr/data/mainsail
	            			        mv mainsail.zip mainsail
                			        cd /usr/data/mainsail
                			        unzip mainsail.zip && rm mainsail.zip
                			        if [ -d "$DIR2" ]; then
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_both.conf
                    			        cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_both.conf
                			        else
                    			        wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_mainsail.conf
                    			        cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    			        rm -f moonraker_mainsail.conf
                			        fi
                			        /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n${green} Mainsail ${white}has been installed ${green}successfully${white}!\n\n"
                			        printf " You can now connect to Mainsail Web Interface with: ${yellow}https://xxx.xxx.xxx.xxx:4409${white}\n\n"
                			    else
                			        printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    4)
                        FILE=/usr/data/moonraker/moonraker/moonraker/components/timelapse.py
            			DIR1=/usr/data/fluidd/
            			DIR2=/usr/data/mainsail/
            			if [ -f "$FILE" ]; then
            				printf "${darkred} Moonraker Timelapse is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Moonraker Timelapse${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    cd /usr/data
                			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/timelapse/timelapse.py
                			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/timelapse/timelapse.cfg
                			    mv timelapse.py moonraker/moonraker/moonraker/components/
                			    mv timelapse.cfg printer_data/config/
                			    if [ ! -d "$DIR1" -a -d "$DIR2" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_mainsail.conf
                    			    cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker_mainsail.conf
                			    elif [ -d "$DIR1" -a ! -d "$DIR2" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_fluidd.conf
                    			    cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker_fluidd.conf
                			    elif [ -d "$DIR1" -a -d "$DIR2" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_both.conf
                    			    cp moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker_both.conf
                			    else
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker.conf
                    			    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker.conf
                			    fi
                			    printf "\n${green} Moonraker Timelapse ${white}has been installed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to enable ${yellow}[timelapse] ${white}function in moonraker.conf file.\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    5)
                        printf " Are you sure you want to install ${green}Entware${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			read confirm
            			printf "${white}\n"
            			if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                            printf "${green}Installing Entware...${white}\n"
            			    echo "Making /opt directory on data partition where there is space, and adding a symbolic link..."
            			    rm -rf /opt/*
            			    mkdir /usr/data/opt
            			    ln -nsf /usr/data/opt /opt
            			    echo "Installing Entware using generic installer script..."
            			    wget --no-check-certificate -O - http://bin.entware.net/mipselsf-k3.4/installer/generic.sh | /bin/sh
            			    echo "Adding /opt/bin and /opt/sbin to the start of the PATH in the system profile..."
            			    sed -i 's/export PATH="\/bin:/export PATH="\/opt\/bin:\/opt\/sbin:\/bin:/' /etc/profile
            			    echo "Adding startup script..."
            			    echo -e '#!/bin/sh\n/opt/etc/init.d/rc.unslung "$1"' > /etc/init.d/S50unslung
            			    chmod 755 /etc/init.d/S50unslung
            			    printf "\n${green} Entware ${white}has been installed ${green}successfully${white}!\n"
            			    printf " Log out and log back in, and you can install packages with: ${yellow}opkg install <packagename>${white}\n\n"
            			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			printf "${darkred} Installation canceled!${white}\n\n"
                	    else
                		    printf "${darkred} Please select a correct choice!${white}\n\n"
            			fi
                        ;;
                    6)
                        DIR1=/usr/data/mobileraker_companion/
            			if [ -d "$DIR1" ]; then
            				printf "${darkred} Mobileraker Companion is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Mobileraker Companion${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Mobileraker Companion...${white}\n"
                			    cd /usr/data
                			    echo "Installing prerequisite python packages..."
                			    pip3 install requests websockets pytz coloredlogs
                			    echo "Downloading modified version of Mobileraker Companion for K1..."
                			    echo "Cloning mobileraker_companion github repository..."
                			    git clone --depth 1 https://github.com/Clon1998/mobileraker_companion
                			    cd mobileraker_companion
                			    echo 'Getting K1 compatibility patches...'
                			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/mobileraker/mobileraker-companion-k1-no-tzlocal.patch
                			    echo 'Applying K1 compatibility patches...'
                			    patch -p1 < mobileraker-companion-k1-no-tzlocal.patch
                			    echo "Adding startup script..."
                			    cp S80mobileraker_companion /etc/init.d/S80mobileraker_companion
                			    chmod 755 /etc/init.d/S80mobileraker_companion
                			    echo "Starting service..."
                			    /etc/init.d/S80mobileraker_companion restart
                			    printf "\n${green} Mobileraker Companion ${white}has been installed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    7)
                        DIR1=/usr/data/Klipper-Adaptive-Meshing-Purging
            			if [ -d "$DIR1" ]; then
            				printf "${darkred} Klipper Adaptive Meshing & Purging is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Klipper Adaptive Meshing & Purging${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
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
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    8)
                        FILE=/etc/init.d/S00hostname
            			if [ -f "$FILE" ]; then
            				printf "${darkred} Hotsname Service file is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Hotsname Service${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Hotsname Service file...${white}\n"
                			    cd /etc/init.d/
                			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/services/S00hostname
                			    chmod 755 S00hostname
                			    printf "\n${green} Hotsname Service ${white}file has been installed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    9)
                        DIR=/etc/boot-display
                        URL1="https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/boot-display/k1_boot_display.tar"
                        URL2="https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/boot-display/k1max_boot_display.tar"
            			if [ ! -d "$DIR" ]; then
            				printf "${darkred} Please use latest firmware to install Custom Boot Display!${white}\n\n"
            			else
                            printf " Are you sure you want to install ${green}Custom Boot Display${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        printf " Do you want install ${green}Custom Boot Display${white} for ${yellow}K1${white} or ${yellow}K1 Max${white} ? (${yellow}k1${white}/${yellow}k1max${white}): ${yellow}" 
            			        read confirm2
            			        printf "${white}\n"
            			        if [ "$confirm2" = "k1" ]; then
                			        printf "${green}Installing Custom Boot Display for K1...${white}\n"
                			        cd /etc/boot-display
                			        wget --no-check-certificate "$URL1"
                			        if [ $? -eq 0 ]; then
                			            rm -rf part0 boot-display.conf
                			            tar -xvf  k1_boot_display.tar
                			            rm -f k1_boot_display.tar
                			            printf "\n${green} Custom Boot Display ${white}for ${yellow}K1${white} has been installed ${green}successfully${white}!\n\n"
                			        else
                			            printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			        fi
            			        elif [ "$confirm2" = "k1max" ]; then
                			        printf "${green}Installing Custom Boot Display for K1 Max...${white}\n"
                			        cd /etc/boot-display
                			        wget --no-check-certificate "$URL2"
                			        if [ $? -eq 0 ]; then
                			            rm -rf part0 boot-display.conf
                			            tar -xvf k1max_boot_display.tar
                			            rm -f k1max_boot_display.tar
                			            printf "\n${green} Custom Boot Display ${white}for ${yellow}K1 Max${white} has been installed ${green}successfully${white}!\n\n"
                			        else
                			            printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			        fi
                			    else
                			        printf "${darkred} Please select a correct choice!${white}\n\n"
            			        fi
            			    elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    10)
                        FILE1=/usr/share/klipper/klippy/extras/gcode_shell_command.py
                        FILE2=/usr/data/beep.mp3
            			if [ -f "$FILE1" -a -f "$FILE2" ]; then
            				printf "${darkred} Buzzer support files are already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Buzzer Support${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Buzzer Support files...${white}\n"
                			    if [ ! -f "$FILE1" ]; then
                			        wget --no-check-certificate -P /usr/share/klipper/klippy/extras/ https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/buzzer/gcode_shell_command.py
                			    fi
                			    if [ ! -f "$FILE2" ]; then
                			        wget --no-check-certificate -P /usr/data/ https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/buzzer/beep.mp3
                			    fi
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Buzzer Support ${white}files have been installed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to add this in gcode_macro.cfg file:\n"
                			    printf "\n${yellow} [gcode_shell_command beep]"
                			    printf "\n${yellow} command: aplay /usr/data/beep.mp3"
                			    printf "\n${yellow} timeout: 2."
                			    printf "\n${yellow} verbose: False"
                			    printf "\n"
                			    printf "\n${yellow} [gcode_macro BEEP]"
                			    printf "\n${yellow} gcode:"
                			    printf "\n${yellow} RUN_SHELL_COMMAND CMD=beep"
                			    printf "\n${yellow} RUN_SHELL_COMMAND CMD=beep"
                			    printf "\n${yellow} RUN_SHELL_COMMAND CMD=beep"
                			    printf "\n${yellow} RUN_SHELL_COMMAND CMD=beep${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    b)
                    	clear
                        break
                        ;;
                    q)
                        exit
                        ;;
                    *)
            			printf "${darkred} Please select a correct choice!${white}\n\n"
            			;;
                esac
            done
            ;;
        2)
            while [ 1 ]
            do
                uninstall_menu
                case $opt_uninstall_menu in
                    1)
                        DIR1=/usr/data/fluidd/
            			DIR2=/usr/data/mainsail/
            			DIR3=/usr/data/moonraker/
            			if [ ! -d "$DIR1" ]; then
            				printf "${darkred} Fluidd is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Fluidd${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n";
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    rm -rf /usr/data/fluidd
                			    if [ -d "$DIR2" -a -d "$DIR3" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_mainsail.conf
                    			    cp moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker_mainsail.conf
                			    elif [ -d "$DIR3" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker.conf
                    			    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker.conf
                			    fi
                			    printf "\n${green} Fluidd ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    2)
                        DIR1=/usr/data/fluidd/
            			DIR2=/usr/data/mainsail/
            			DIR3=/usr/data/moonraker/
            			if [ ! -d "$DIR2" ]; then
                			printf "${darkred} Mainsail is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mainsail${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    rm -rf /usr/data/mainsail
                			    if [ -d "$DIR1" -a -d "$DIR3" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker_fluidd.conf
                    			    cp moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker_fluidd.conf
                			    elif [ -d "$DIR3" ]; then
                    			    wget --no-check-certificate https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/moonraker/moonraker.conf
                    			    cp moonraker.conf /usr/data/printer_data/config/moonraker.conf
                    			    rm -f moonraker.conf
                			    fi
                			    printf "\n${green} Mainsail ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
                        FILE=/usr/data/moonraker/moonraker/moonraker/components/timelapse.py
            			if [ ! -f "$FILE" ]; then
                			printf "${darkred} Moonraker Timelapse is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker Timelapse${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    rm -rf /usr/data/moonraker/moonraker/moonraker/components/timelapse.py /usr/data/moonraker/moonraker/moonraker/components/timelapse.pyc /usr/data/printer_data/config/timelapse.cfg
                			    printf "\n${green} Moonraker Timelapse ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    4)
                        DIR1=/usr/data/moonraker/
            			DIR2=/usr/data/nginx/
            			if [[ ! -d "$DIR1" -a ! -d "$DIR2" ]]; then
            				printf "${darkred} Moonraker and Nginx are not installed!\n"
            				printf "${white}\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker and Nginx${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n";
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${white}"
                			    cd /overlay/upper
                			    /etc/init.d/S50nginx stop
                			    /etc/init.d/S56moonraker_service stop
                			    rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service 
                			    rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/printer_data/.moonraker.uuid /usr/data/printer_data/moonraker.asvc /usr/data/nginx /usr/data/moonraker
                			    printf "\n${green} Moonraker ${white}and ${green}Nginx ${white}have been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    5)
                        DIR1=/usr/data/mobileraker_companion/
            			if [[ ! -d "$DIR1" ]]; then
            				printf "${darkred} Mobileraker Companion is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mobileraker Companion${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${white}"
                			    /etc/init.d/S80mobileraker_companion stop
                			    rm -rf /etc/init.d/S80mobileraker_companion /usr/data/mobileraker_companion
                			    pip3 uninstall -y requests websockets pytz coloredlogs
                			    printf "\n${green} Mobileraker Companion ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    6)
                        DIR1=/usr/data/Klipper-Adaptive-Meshing-Purging
            			if [[ ! -d "$DIR1" ]]; then
            				printf "${darkred} Klipper Adaptive Meshing & Purging is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Klipper Adaptive Meshing & Purging${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${white}"
                			    rm -rf /usr/data/Klipper-Adaptive-Meshing-Purging /usr/data/printer_data/config/KAMP /usr/data/printer_data/config/KAMP_Settings.cfg
                			    printf "\n${green} Klipper Adaptive Meshing & Purging ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
                			fi
           				fi
                        ;;
                    7)
                        FILE=/etc/init.d/S00hostname
            			if [ ! -f "$FILE" ]; then
            				printf "${darkred} Hotsname Service file is not already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Hotsname Service${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        printf "${white}"
                			    rm -rf /etc/init.d/S00hostname
                			    printf "\n${green} Hotsname Service ${white}file has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
            			;;
            	    8)
                        DIR=/etc/boot-display
                        URL="https://github.com/Guilouz/Creality-K1-and-K1-Max/raw/main/Scripts/files/boot-display/stock_boot_display.tar"
            			if [ ! -d "$DIR" ]; then
            				printf "${darkred} Please use latest firmware to restore Stock Boot Display!${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Custom Boot Display${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    cd /etc/boot-display
                			    wget --no-check-certificate "$URL"
                                if [ $? -eq 0 ]; then
                			        rm -rf part0 boot-display.conf
                			        tar -xvf  stock_boot_display.tar
                			        rm -f stock_boot_display.tar
                			        printf "\n${green} Custom Boot Display ${white}has been removed ${green}successfully${white}!\n\n"
                			    else
                			        printf "${darkred} Download failed. Exit code: $?${white}\n\n"
                			    fi
            			    elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    9)
                        FILE1=/usr/share/klipper/klippy/extras/gcode_shell_command.py
                        FILE2=/usr/data/beep.mp3
            			if [[ ! -f "$FILE1" -a ! -f "$FILE2" ]]; then
            				printf "${darkred} Buzzer Support files are not installed!\n"
            				printf "${white}\n"
            			else
                            printf " Are you sure you want to remove ${green}Buzzer Support${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    rm -rf /usr/share/klipper/klippy/extras/gcode_shell_command.py /usr/share/klipper/klippy/extras/gcode_shell_command.pyc /usr/data/beep.mp3
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Buzzer Support ${white}files have been removed ${green}successfully${white}!\n\n"
            			    elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    b)
                    	clear
                        break
                        ;;
                    q)
                        exit
                        ;;
                    *)
            			printf "${darkred} Please select a correct choice!${white}\n\n"
            		;;
                esac
            done
            ;;
        3)
            while [ 1 ]
            do
                backup_menu
                case $opt_backup_menu in
                    1)
                        printf " Are you sure you want to backup ${green}Klipper configuration${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			read confirm
            			printf "${white}\n"
                        if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                            FILE=/root/backup_config.tar
            			    if [[ -f "$FILE" ]]; then
                			    rm -f /root/backup_config.tar
            			    fi
            			    cd /usr/data/printer_data
            			    tar -czvf /root/backup_config.tar config/
            			    printf "\n${green} Klipper configuration ${white}files have been saved ${green}successfully${white} in ${yellow}/root ${white}folder!\n\n"
            			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			printf "${darkred} Backup canceled!${white}\n\n"
                		else
                		    printf "${darkred} Please select a correct choice!${white}\n\n"
            			fi
                        ;;
                    2)
                        DIR1=/usr/data/printer_data/config/
            			FILE=/root/backup_config.tar
            			if [[ ! -f "$FILE" ]]; then
                			printf "${darkred} Please backup configuration files before restore!${white}\n\n"
            			else
            			    printf " Are you sure you want to backup ${green}Klipper configuration${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        if [[ -d "$DIR1" ]]; then
                    			    rm -rf /usr/data/printer_data/config
                			    fi
                			    cp /root/backup_config.tar /usr/data/printer_data/
                			    cd /usr/data/printer_data
                			    tar -xvf backup_config.tar
                			    rm -f backup_config.tar
                			    printf "\n${green} Klipper configuration ${white}files have been restored ${green}successfully${white}!\n\n"
                			    backup_menu
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Restoration canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    b)
                    	clear
                        break
                        ;;
                    q)
                        exit
                        ;;
                    *)
            			printf "${darkred} Please select a correct choice!${white}\n\n"
                        ;;
                esac
            done
            ;;
        r)
            DIR1=/usr/data/moonraker/
            DIR2=/usr/data/nginx/
            if [[ ! -d "$DIR1" -a ! -d "$DIR2" ]]; then
            	printf "${darkred} Moonraker is not installed!${white}\n\n"
            else
                printf " Do you want to reload ${green}Moonraker and Nginx${white} services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	read confirm
            	printf "${white}\n"
                if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                    /etc/init.d/S50nginx stop
                    /etc/init.d/S56moonraker_service stop
                    /etc/init.d/S56moonraker_service start
                    sleep 1
                    /etc/init.d/S50nginx start
                    sleep 1
                    printf "\n${green} Moonraker and Nginx${white} services have been reloaded!\n\n"
                elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                	printf "${darkred} Reload canceled!${white}\n\n"
                else
                	printf "${darkred} Please select a correct choice!${white}\n\n"
                fi
            fi
            ;;
        q)
            exit
            ;;
        *)
            printf "${darkred} Please select a correct choice!${white}\n\n"
            ;;
    esac
done