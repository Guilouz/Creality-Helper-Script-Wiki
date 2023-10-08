#!/bin/sh

white=`echo "\033[m"`
blue=`echo "\033[36m"`
cyan=`echo "\033[1;36m"`
yellow=`echo "\033[1;33m"`
green=`echo "\033[01;32m"`
red=`echo "\033[01;31m"`
darkred=`echo "\033[31m"`
moonraker_folder="/usr/data/moonraker/"
moonraker_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/moonraker/moonraker.tar"
moonraker_mainsail_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/moonraker/moonraker_mainsail.conf"
moonraker_fluidd_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/moonraker/moonraker_fluidd.conf"
moonraker_both_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/moonraker/moonraker_both.conf"
moonraker_default_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/moonraker/moonraker.conf"
nginx_folder="/usr/data/nginx/"
fluidd_folder="/usr/data/fluidd/"
fluidd_URL="https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip"
mainsail_folder="/usr/data/mainsail/"
mainsail_URL="https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip"
timelapse_file="/usr/data/moonraker/moonraker/moonraker/components/timelapse.py"
timelapse_URL1="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/timelapse/timelapse.py"
timelapse_URL2="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/timelapse/timelapse.cfg"
entware_folder="/usr/data/opt/"
mobileraker_folder="/usr/data/mobileraker_companion/"
mobileraker_URL1="https://github.com/Clon1998/mobileraker_companion"
mobileraker_URL2="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/mobileraker/mobileraker-companion-k1-no-tzlocal.patch"
kamp_folder="/usr/data/printer_data/config/KAMP/"
kamp_URL1="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/kamp/kamp.tar"
kamp_URL2="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/kamp/custom_macro_kamp.py"
kamp_URL3="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/kamp/custom_macro.py"
hostname_file="/etc/init.d/S00hostname"
hostname_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/services/S00hostname"
shellcommand_file="/usr/share/klipper/klippy/extras/gcode_shell_command.py"
shellcommand_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/shell-command/gcode_shell_command.py"
buzzer_file="/usr/data/beep.mp3"
buzzer_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/buzzer/beep.mp3"
prtouch_folder="/usr/share/klipper/klippy/extras/prtouch_v2_fan"
prtouch_URL1="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/prtouch_v2_fan/__init__.py"
prtouch_URL2="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/prtouch_v2_fan/prtouch_v2_fan.pyc"
camera_file="/usr/data/printer_data/config/camera-settings.cfg"
camera_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/camera/camera-settings.cfg"
bootdisplay_folder="/etc/boot-display"
bootdisplay_file="/etc/boot-display/part0/pic_100.jpg"
bootdisplay_URL1="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/boot-display/k1_boot_display.tar"
bootdisplay_URL2="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/boot-display/k1max_boot_display.tar"
bootdisplay_URL3="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/boot-display/stock_boot_display.tar"

check_folder() {
    local folder_path="$1"
    if [ -d "$folder_path" ]; then
        printf "${green}Installed                  ${white}| \n"
    else
        printf "${darkred}Not Installed              ${white}| \n"
    fi
}
check_file() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        printf "${green}Installed                  ${white}| \n"
    else
        printf "${darkred}Not Installed              ${white}| \n"
    fi
}

clear

main_menu(){
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
    printf " |  ${yellow} 4)${white} Open ${green}[Customize] ${white}Menu                                 | \n"
    printf " |  ${yellow} 5)${white} Open ${green}[Informations] ${white}Menu                              | \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} r)${white} Reload Moonraker and Nginx                            ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_main_menu
    printf "${white}\n"
}

install_menu(){
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
    printf " |                                                            | \n"
    printf " |  ${yellow} 4)${white} Install ${green}Moonraker Timelapse                           ${white}| \n"
    printf " |  ${yellow} 5)${white} Install ${green}Entware                                       ${white}| \n"
    printf " |  ${yellow} 6)${white} Install ${green}Mobileraker Companion                         ${white}| \n"
    printf " |  ${yellow} 7)${white} Install ${green}Klipper Adaptive Meshing & Purging            ${white}| \n"
    printf " |  ${yellow} 8)${white} Install ${green}Hostname Service ${white}file                         ${white}| \n"
    printf " |  ${yellow} 9)${white} Install ${green}Klipper Gcode Shell Command ${white}file              ${white}| \n"
    printf " | ${yellow} 10)${white} Install ${green}Buzzer Support ${white}files                          ${white}| \n"
    printf " | ${yellow} 11)${white} Install ${green}Nozzle Cleaning Fan Control ${white}files             ${white}| \n"
    printf " | ${yellow} 12)${white} Install ${green}Camera Settings Control ${white}files                 ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_install_menu
    printf "${white}\n"
}

uninstall_menu(){
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                     ${yellow} [ Remove Menu ]                       ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Remove ${green}Moonraker ${white}and ${green}Nginx                            ${white}| \n"
    printf " |  ${yellow} 2)${white} Remove ${green}Fluidd                                         ${white}| \n"
    printf " |  ${yellow} 3)${white} Remove ${green}Mainsail                                       ${white}| \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 4)${white} Remove ${green}Moonraker Timelapse                            ${white}| \n"
    printf " |  ${yellow} 5)${white} Remove ${green}Entware                                        ${white}| \n"
    printf " |  ${yellow} 6)${white} Remove ${green}Mobileraker Companion                          ${white}| \n"
    printf " |  ${yellow} 7)${white} Remove ${green}Klipper Adaptive Meshing & Purging             ${white}| \n"
    printf " |  ${yellow} 8)${white} Remove ${green}Hostname Service ${white}file                          ${white}| \n"
    printf " |  ${yellow} 9)${white} Remove ${green}Klipper Gcode Shell Command ${white}file               ${white}| \n"
    printf " | ${yellow} 10)${white} Remove ${green}Buzzer Support ${white}files                           ${white}| \n"
    printf " | ${yellow} 11)${white} Remove ${green}Nozzle Cleaning Fan Control ${white}files              ${white}| \n"
    printf " | ${yellow} 12)${white} Remove ${green}Camera Settings Control ${white}files                  ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_uninstall_menu
    printf "${white}\n"
}

backup_menu(){
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
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_backup_menu
    printf "${white}\n"
}

customize_menu(){
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                    ${yellow} [ Customize Menu ]                     ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} 1)${white} Install ${green}Custom Boot Display ${white}                          ${white}| \n"
    printf " |  ${yellow} 2)${white} Remove ${green}Custom Boot Display ${white}                           ${white}| \n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_customize_menu
    printf "${white}\n"
}

info_menu(){
    printf " ============================================================== \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " |         ${blue}Installation Helper for Creality K1 Series         ${white}| \n"
    printf " |            ${cyan}Copyright © Cyril Guislain (Guilouz)            ${white}| \n"
    printf " |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     | \n"
    printf " [============================================================] \n"
    printf " |                  ${yellow} [ Informations Menu ]                    ${white}| \n"
    printf " [============================================================] \n"
    printf " |                                                            | \n"
    printf " |             Moonraker & Nginx${white} → $(check_folder "$moonraker_folder")\n"
    printf " |                        Fluidd${white} → $(check_folder "$fluidd_folder")\n"
    printf " |                      Mainsail${white} → $(check_folder "$mainsail_folder")\n"
    printf " |                                                            | \n"
    printf " |           Moonraker Timelapse${white} → $(check_file "$timelapse_file")\n"
    printf " |                       Entware${white} → $(check_folder "$entware_folder")\n"
    printf " |         Mobileraker Companion${white} → $(check_folder "$mobileraker_folder")\n"
    printf " |                          KAMP${white} → $(check_folder "$kamp_folder")\n"
    printf " |              Hostname Service${white} → $(check_file "$hostname_file")\n"
    printf " |   Klipper Gcode Shell Command${white} → $(check_file "$shellcommand_file")\n"
    printf " |                Buzzer Support${white} → $(check_file "$buzzer_file")\n"
    printf " |   Nozzle Cleaning Fan Control${white} → $(check_folder "$prtouch_folder")\n"
    printf " |       Camera Settings Control${white} → $(check_file "$camera_file")\n"
    printf " |                                                            | \n"
    printf " |           Custom Boot Display${white} → $(check_file "$bootdisplay_file")\n"
    printf " |                                                            | \n"
    printf " ============================================================== \n"
    printf " |                                                            | \n"
    printf " |  ${yellow} b)${white} Back to ${yellow}[Main Menu]                                   ${white}| \n"
    printf " |  ${red} q)${white} Exit                                                  ${white}| \n"
    printf " |                                                            | \n"
    printf " |                                                       ${cyan}v2.5 ${white}| \n"
    printf " ============================================================== \n"
    printf "\n"
    printf " ${white}Please enter your choice and validate with Enter: ${yellow}"
    read opt_info_menu
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
            			if [ -d "$moonraker_folder" ]; then
            				printf "${darkred} Moonraker and Nginx are already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Moonraker and Nginx${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Moonraker and Nginx...${white}\n"
                			    cd /usr/data
                			    if [ -f "moonraker.tar" ]; then
                			        rm -f moonraker.tar
                			    fi
                			    printf "Downloading Moonraker and Nginx file...\n"
                			    wget --no-check-certificate "$moonraker_URL"
                			    if [ $? -eq 0 ]; then
                			        printf "Installing files...\n"
                			        tar -xvf moonraker.tar
                			        [ ! -e /etc/init.d/S50nginx ] && cp nginx/S50nginx /etc/init.d/
                			        [ ! -e /etc/init.d/S56moonraker_service ] && cp moonraker/S56moonraker_service /etc/init.d/
                			        printf "Deleting file...\n"
                			        rm -f moonraker.tar
                			        if [ ! -d "$fluidd_folder" -a -d "$mainsail_folder" ]; then
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_mainsail_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                			        elif [ -d "$fluidd_folder" -a ! -d "$mainsail_folder" ]; then
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_fluidd_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                			        elif [ -d "$fluidd_folder" -a -d "$mainsail_folder" ]; then
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_both_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                			        else
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_default_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker.conf /usr/data/printer_data/config/moonraker.conf
                			        fi
                			        cd /usr/data/moonraker/moonraker
                			        printf "Applying changes...\n"
                			        git stash; git checkout master; git pull
                			        printf "Restarting services...\n"
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
            			if [ -d "$fluidd_folder" ]; then
            				printf "${darkred} Fluidd is already installed!${white}\n\n"
            			elif [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} Please install Moonraker and Nginx first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Fluidd${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Fluidd...${white}\n"
	            			    cd /usr/data
	            			    if [ -f "fluidd.zip" ]; then
                			        rm -f fluidd.zip
                			    fi
                			    printf "Downloading Fluidd file...\n"
	            			    wget --no-check-certificate "$fluidd_URL"
	            			    if [ $? -eq 0 ]; then
	            			        printf "Copying files...\n"
	            			        mkdir /usr/data/fluidd
	            			        mv fluidd.zip fluidd
                			        cd /usr/data/fluidd
                			        unzip fluidd.zip
                			        printf "Deleting file...\n"
                			        rm -f fluidd.zip
                			        if [ -d "$mainsail_folder" ]; then
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_both_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                			        else
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_fluidd_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                			        fi
                			        printf "Restarting services...\n"
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
            			if [ -d "$mainsail_folder" ]; then
            				printf "${darkred} Mainsail is already installed!${white}\n\n"
            			elif [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} Please install Moonraker and Nginx first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Mainsail${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Mainsail...${white}\n"
                			    cd /usr/data
                			    if [ -f "mainsail.zip" ]; then
                			        rm -f mainsail.zip
                			    fi
                			    printf "Downloading Mainsail file...\n"
                			    wget --no-check-certificate "$mainsail_URL"
	            			    if [ $? -eq 0 ]; then
	            			        printf "Copying files...\n"
	            			        mkdir /usr/data/mainsail
	            			        mv mainsail.zip mainsail
                			        cd /usr/data/mainsail
                			        unzip mainsail.zip
                			        printf "Deleting file...\n"
                			        rm -f mainsail.zip
                			        if [ -d "$fluidd_folder" ]; then
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_both_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                			        else
                			            printf "Downloading Moonraker configuration file...\n"
                    			        wget --no-check-certificate "$moonraker_mainsail_URL"
                    			        printf "Copying file...\n"
                    			        mv moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                			        fi
                			        printf "Restarting services...\n"
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
            			if [ -f "$timelapse_file" ]; then
            				printf "${darkred} Moonraker Timelapse is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Moonraker Timelapse${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    cd /usr/data
                			    printf "Downloading Moonraker Timelapse files...\n"
                			    wget --no-check-certificate "$timelapse_URL1"
                			    wget --no-check-certificate "$timelapse_URL2"
                			    printf "Copying files...\n"
                			    mv timelapse.py moonraker/moonraker/moonraker/components/
                			    mv timelapse.cfg printer_data/config/
                			    if [ ! -d "$fluidd_folder" -a -d "$mainsail_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_mainsail_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                			    elif [ -d "$fluidd_folder" -a ! -d "$mainsail_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_fluidd_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                			    elif [ -d "$fluidd_folder" -a -d "$mainsail_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_both_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker_both.conf /usr/data/printer_data/config/moonraker.conf
                			    else
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_default_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker.conf /usr/data/printer_data/config/moonraker.conf
                			    fi
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
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
            			if [ -d "$mobileraker_folder" ]; then
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
                			    git clone --depth 1 "$mobileraker_URL1"
                			    cd mobileraker_companion
                			    echo 'Getting K1 compatibility patches...'
                			    wget --no-check-certificate "$mobileraker_URL2"
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
            			if [ -d "$kamp_folder" ]; then
            				printf "${darkred} Klipper Adaptive Meshing & Purging is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Klipper Adaptive Meshing & Purging${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Klipper Adaptive Meshing & Purging...${white}\n"
                			    cd /usr/data/printer_data/config
                			    printf "Downloading Klipper Adaptive Meshing & Purging files...\n"
                			    wget --no-check-certificate "$kamp_URL1"
                			    printf "Copying files...\n"
                			    tar -xvf kamp.tar
                			    printf "Deleting file...\n"
                			    rm -f kamp.tar
                			    printf "Moving file...\n"
                			    cp KAMP/KAMP_Settings.cfg /usr/data/printer_data/config/KAMP_Settings.cfg
                			    printf "Downloading fix for K1 Series...\n"
                			    wget --no-check-certificate "$kamp_URL2"
                			    printf "Copying file...\n"
                			    mv custom_macro_kamp.py /usr/share/klipper/klippy/extras/custom_macro.py
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Klipper Adaptive Meshing & Purging ${white}has been installed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to enable ${yellow}enable_object_processing: True ${white}in moonraker.conf file.${white}\n\n"
                			    printf " And add this in printer.cfg file:\n"
                			    printf "\n${yellow} [include KAMP_Settings.cfg]${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    8)
            			if [ -f "$hostname_file" ]; then
            				printf "${darkred} Hotsname Service file is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Hotsname Service${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Hotsname Service file...${white}\n"
                			    cd /etc/init.d/
                			    printf "Downloading Hotsname Service file...\n"
                			    wget --no-check-certificate "$hostname_URL"
                			    printf "Applying permissions...\n"
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
            			if [ -f "$shellcommand_file" ]; then
            				printf "${darkred} Klipper Gcode Shell Command file is already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Klipper Gcode Shell Command${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "Downloading Klipper Gcode Shell Command file...\n"
                			        wget --no-check-certificate -P /usr/share/klipper/klippy/extras/ "$shellcommand_URL"
                			    printf "\n${green} Klipper Gcode Shell Command ${white}file has been installed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    10)
            			if [ -f "$buzzer_file" ]; then
            				printf "${darkred} Buzzer support files are already installed!${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} Please install Klipper Gcode Shell Command file first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Buzzer Support${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Buzzer Support files...${white}\n"
                			    if [ ! -f "$buzzer_file" ]; then
                			        printf "Downloading Buzzer support file...\n"
                			        wget --no-check-certificate -P /usr/data/ "$buzzer_URL"
                			    fi
                			    printf "Restarting services...\n"
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
                			    printf "\n${yellow} RUN_SHELL_COMMAND CMD=beep${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    11)
            			if [ -d "$prtouch_folder" ]; then
            				printf "${darkred} Nozzle Cleaning Fan Control files are already installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Nozzle Cleaning Fan Control${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Nozzle Cleaning Fan Control files...${white}\n"
                			    mkdir -p /usr/share/klipper/klippy/extras/prtouch_v2_fan
                			    printf "${green}Downloading Nozzle Cleaning Fan Control files...${white}\n"
                			    wget --no-check-certificate "$prtouch_URL1" -O /usr/share/klipper/klippy/extras/prtouch_v2_fan/__init__.py
                			    wget --no-check-certificate "$prtouch_URL2" -O /usr/share/klipper/klippy/extras/prtouch_v2_fan/prtouch_v2_fan.pyc
                			    printf "Restarting services...\n"
                                /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Nozzle Cleaning Fan Control ${white}files have been installed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to add this in printer_params.cfg file:\n"
                			    printf "\n${yellow} [prtouch_v2_fan]"
                			    printf "\n${yellow} max_speed: 0.5${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Installation canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    12)
            			if [ -f "$camera_file" ]; then
            				printf "${darkred} Camera Settings Control files are already installed!${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} Please install Klipper Gcode Shell Command file first!${white}\n\n"
            			else
            			    printf " Are you sure you want to install ${green}Camera Settings Control${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${green}Installing Camera Settings Control files...${white}\n"
                			    if [ ! -f "$camera_file" ]; then
                			        printf "Downloading Camera Settings Control file...\n"
                			        wget --no-check-certificate -P /usr/data/printer_data/config/ "$camera_URL"
                			    fi
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Camera Settings Control ${white}files have been installed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to add this in printer.cfg file:\n"
                			    printf "\n${yellow} [include camera-settings.cfg]${white}\n\n"
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
            			if [[ ! -d "$moonraker_folder" -a ! -d "$nginx_folder" ]]; then
            				printf "${darkred} Moonraker and Nginx are not installed!\n"
            				printf "${white}\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker and Nginx${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n";
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "${white}"
                			    printf "Stopping services...\n"
                			    cd /overlay/upper
                			    /etc/init.d/S50nginx stop
                			    /etc/init.d/S56moonraker_service stop
                			    printf "Deleting Moonraker and Nginx files...\n"
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
                    2)
            			if [ ! -d "$fluidd_folder" ]; then
            				printf "${darkred} Fluidd is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Fluidd${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n";
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                                printf "Deleting Fluidd files...\n"
                			    rm -rf /usr/data/fluidd
                			    if [ -d "$mainsail_folder" -a -d "$moonraker_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_mainsail_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker_mainsail.conf /usr/data/printer_data/config/moonraker.conf
                			    elif [ -d "$moonraker_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_default_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker.conf /usr/data/printer_data/config/moonraker.conf
                			    fi
                			    printf "\n${green} Fluidd ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
            			if [ ! -d "$mainsail_folder" ]; then
                			printf "${darkred} Mainsail is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mainsail${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                                printf "Deleting Mainsail files...\n"
                			    rm -rf /usr/data/mainsail
                			    if [ -d "$fluidd_folder" -a -d "$moonraker_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_fluidd_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker_fluidd.conf /usr/data/printer_data/config/moonraker.conf
                			    elif [ -d "$moonraker_folder" ]; then
                			        printf "Downloading Moonraker configuration file...\n"
                    			    wget --no-check-certificate "$moonraker_default_URL"
                    			    printf "Copying file...\n"
                    			    mv moonraker.conf /usr/data/printer_data/config/moonraker.conf
                			    fi
                			    printf "\n${green} Mainsail ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    4)
            			if [ ! -f "$timelapse_file" ]; then
                			printf "${darkred} Moonraker Timelapse is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker Timelapse${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                                printf "Deleting Moonraker Timelapse files...\n"
                			    rm -rf /usr/data/moonraker/moonraker/moonraker/components/timelapse.py /usr/data/moonraker/moonraker/moonraker/components/timelapse.pyc /usr/data/printer_data/config/timelapse.cfg
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Moonraker Timelapse ${white}has been removed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to remove this in moonraker.conf file:\n"
                			    printf "\n${yellow} [timelapse]"
                			    printf "\n${yellow} output_path: /usr/data/printer_data/timelapse/"
                			    printf "\n${yellow} frame_path: /usr/data/printer_data/frames/"
                			    printf "\n${yellow} snapshoturl: http://localhost:4408/webcam/?action=snapshot${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    5)
                        printf " Are you sure you want to remove ${green}Entware${white}, it will also remove all installed packages ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			read confirm
            			printf "${white}\n"
            			if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			    printf "Removing startup script...\n"
                            rm -f /etc/init.d/S50unslung
                            printf "Removing opt directory...\n"
                            rm -rf /usr/data/opt
                            printf "Removing /opt symbolic link and replacing with stock empty directory...\n"
                            if [ -L /opt ]; then
                                rm /opt
                                mkdir -p /opt
                                chmod 755 /opt
                            fi
                            printf "Removing SFTP server symlink if it exists...\n"
                            [ -L /usr/libexec/sftp-server ] && rm /usr/libexec/sftp-server
                            printf "Removing /opt/bin and /opt/sbin from PATH in the system profile...\n"
                            sed -i 's/\/opt\/bin:\/opt\/sbin:\/bin:/\/bin:/' /etc/profile
            			    printf "\n${green} Entware ${white}has been removed ${green}successfully${white}!\n\n"
            			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			printf "${darkred} Deletion canceled!${white}\n\n"
                	    else
                		    printf "${darkred} Please select a correct choice!${white}\n\n"
            			fi
                        ;;
                    6)
            			if [[ ! -d "$mobileraker_folder" ]]; then
            				printf "${darkred} Mobileraker Companion is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mobileraker Companion${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "Stopping services...\n"
                			    /etc/init.d/S80mobileraker_companion stop
                			    printf "Deleting Mobileraker Companion files...\n"
                			    rm -rf /etc/init.d/S80mobileraker_companion /usr/data/mobileraker_companion
                			    printf "Deleting dependencies...\n"
                			    pip3 uninstall -y requests websockets pytz coloredlogs
                			    printf "\n${green} Mobileraker Companion ${white}has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    7)
            			if [[ ! -d "$kamp_folder" ]]; then
            				printf "${darkred} Klipper Adaptive Meshing & Purging is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Klipper Adaptive Meshing & Purging${white} ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
                            if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                                printf "Deleting Klipper Adaptive Meshing & Purging files...\n"
                			    rm -rf /usr/data/Klipper-Adaptive-Meshing-Purging /usr/data/printer_data/config/KAMP /usr/data/printer_data/config/KAMP_Settings.cfg
                			    cd /usr/data
                			    printf "Downloading restoration file...\n"
                			    wget --no-check-certificate "$kamp_URL3"
                			    printf "Copying file...\n"
                			    mv custom_macro.py /usr/share/klipper/klippy/extras/custom_macro.py
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Klipper Adaptive Meshing & Purging ${white}has been removed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to remove this in printer.cfg file:\n"
                			    printf "\n${yellow} [include KAMP_Settings.cfg]${white}\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
                			fi
           				fi
                        ;;
                    8)
            			if [ ! -f "$hostname_file" ]; then
            				printf "${darkred} Hotsname Service file is not installed!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Hotsname Service${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        printf "Deleting Hotsname Service file...\n"
                			    rm -rf /etc/init.d/S00hostname
                			    printf "\n${green} Hotsname Service ${white}file has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
            			;;
                    9)
            			if [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} Klipper Gcode Shell Command file is not installed!${white}\n\n"
            			elif [ -f "$buzzer_file" ]; then
            				printf "${darkred} Klipper Gcode Shell Command is needed to use Buzzer Support, please uninstall it first!${white}\n\n"
            			elif [ -f "$camera_file" ]; then
            				printf "${darkred} Klipper Gcode Shell Command is needed to use Camera Settings Control, please uninstall it first!${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Klipper Gcode Shell Command${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        printf "Deleting Klipper Gcode Shell Command file...\n"
                			        rm -rf /usr/share/klipper/klippy/extras/gcode_shell_command.py /usr/share/klipper/klippy/extras/gcode_shell_command.pyc
                			    printf "\n${green} Klipper Gcode Shell Command ${white}file has been removed ${green}successfully${white}!\n\n"
                			elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
            			;;
                    10)
            			if [[ ! -f "$buzzer_file" ]]; then
            				printf "${darkred} Buzzer Support files are not installed!\n"
            				printf "${white}\n"
            			else
                            printf " Are you sure you want to remove ${green}Buzzer Support${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "Deleting Buzzer Support  file...\n"
                			    rm -rf /usr/data/beep.mp3
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Buzzer Support ${white}files have been removed ${green}successfully${white}!\n\n"
            			    elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    11)
            			if [[ ! -d "$prtouch_folder" ]]; then
            				printf "${darkred} Nozzle Cleaning Fan Control files are not installed!\n"
            				printf "${white}\n"
            			else
                            printf " Are you sure you want to remove ${green}Nozzle Cleaning Fan Control${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
            			        printf "Deleting Nozzle Cleaning Fan Control files...\n"
                			    rm -rf /usr/share/klipper/klippy/extras/prtouch_v2_fan
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Nozzle Cleaning Fan Control ${white}files have been removed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to remove this in printer_params.cfg file:\n"
                			    printf "\n${yellow} [prtouch_v2_fan]"
                			    printf "\n${yellow} max_speed: 0.5${white}\n\n"
            			    elif [ "$confirm" = "n" -o "$confirm" = "N" ]; then
                			    printf "${darkred} Deletion canceled!${white}\n\n"
                		    else
                		        printf "${darkred} Please select a correct choice!${white}\n\n"
            			    fi
            			fi
                        ;;
                    12)
            			if [[ ! -f "$camera_file" ]]; then
            				printf "${darkred} Camera Settings Control files are not installed!\n"
            				printf "${white}\n"
            			else
                            printf " Are you sure you want to remove ${green}Camera Settings Control${white} files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    printf "Deleting Camera Settings Control file...\n"
                			    rm -rf /usr/data/printer_data/config/camera-settings.cfg
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n${green} Camera Settings Control ${white}files have been removed ${green}successfully${white}!\n\n"
                			    printf " Don't miss to remove this in printer.cfg file:\n"
                			    printf "\n${yellow} [include camera-settings.cfg]${white}\n\n"
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
        4)
            while [ 1 ]
            do
                customize_menu
                case $opt_customize_menu in
                    1)
            			if [ ! -d "$bootdisplay_folder" ]; then
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
                			        printf "Downloading Custom Boot Display file...\n"
                			        wget --no-check-certificate "$bootdisplay_URL1"
                			        if [ $? -eq 0 ]; then
                			            printf "Copying files...\n"
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
                			        printf "Downloading Custom Boot Display file...\n"
                			        wget --no-check-certificate "$bootdisplay_URL2"
                			        if [ $? -eq 0 ]; then
                			            printf "Copying files...\n"
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
            	    2)
            			if [ ! -d "$bootdisplay_folder" ]; then
            				printf "${darkred} Please use latest firmware to restore Stock Boot Display!${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Custom Boot Display${white} file ? (${yellow}y${white}/${yellow}n${white}): ${yellow}" 
            			    read confirm
            			    printf "${white}\n"
            			    if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
                			    cd /etc/boot-display
                			    printf "Downloading Stock Boot Display file...\n"
                			    wget --no-check-certificate "$bootdisplay_URL3"
                                if [ $? -eq 0 ]; then
                                    printf "Copying files...\n"
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
        5)
            while [ 1 ]
            do
                info_menu
                case $opt_info_menu in
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
            if [[ ! -d "$moonraker_folder" -a ! -d "$nginx_folder" ]]; then
            	printf "${darkred} Moonraker and Nginx are not installed!${white}\n\n"
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