#!/bin/sh

VERSION=v4.4.0

white=`echo -en "\033[m"`
blue=`echo -en "\033[36m"`
cyan=`echo -en "\033[1;36m"`
yellow=`echo -en "\033[1;33m"`
green=`echo -en "\033[01;32m"`
darkred=`echo -en "\033[31m"`
red=`echo -en "\033[01;31m"`
download_URL="https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/"
helper_script="/usr/data/printer_data/config/Helper-Script"
printer_config="/usr/data/printer_data/config/printer.cfg"
macro_config="/usr/data/printer_data/config/gcode_macro.cfg"
klipper_extra_folder="/usr/share/klipper/klippy/extras/"
moonraker_config="/usr/data/printer_data/config/moonraker.conf"
moonraker_config_URL="${download_URL}moonraker/moonraker.conf"
moonraker_folder="/usr/data/moonraker/"
moonraker_URL="${download_URL}moonraker/moonraker.tar"
nginx_folder="/usr/data/nginx/"
fluidd_folder="/usr/data/fluidd"
fluidd_URL="https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip"
mainsail_folder="/usr/data/mainsail/"
mainsail_URL="https://github.com/mainsail-crew/mainsail/releases/latest/download/mainsail.zip"
moonraker_obico_folder="/usr/data/moonraker-obico/"
moonraker_obico_URL="https://github.com/TheSpaghettiDetective/moonraker-obico.git"
octoeverywhere_folder="/usr/data/octoeverywhere/"
octoeverywhere_URL="https://github.com/QuinnDamerell/OctoPrint-OctoEverywhere.git"
timelapse_file="/usr/data/moonraker/moonraker/moonraker/components/timelapse.py"
timelapse_URL1="${download_URL}timelapse/timelapse.py"
timelapse_URL2="${download_URL}timelapse/timelapse.cfg"
entware_file="/opt/bin/opkg"
entware_URL="${download_URL}entware/generic.sh"
mobileraker_folder="/usr/data/mobileraker_companion/"
mobileraker_URL1="https://github.com/Clon1998/mobileraker_companion"
mobileraker_URL2="${download_URL}mobileraker/mobileraker-companion-k1-no-tzlocal.patch"
kamp_folder="/usr/data/KAMP-for-K1-Series/"
kamp_URL="https://github.com/Guilouz/KAMP-for-K1-Series.git"
hostname_file="/etc/init.d/S01hostname"
hostname_URL="${download_URL}services/S01hostname"
systemctl_file="/usr/bin/systemctl"
systemctl_URL="${download_URL}fixes/systemctl"
sudo_file="/usr/bin/sudo"
sudo_URL="${download_URL}fixes/sudo"
shellcommand_file="${klipper_extra_folder}gcode_shell_command.py"
shellcommand_URL="${download_URL}shell-command/gcode_shell_command.py"
buzzer_file="/usr/data/beep.mp3"
buzzer_URL1="${download_URL}buzzer/beep.mp3"
buzzer_URL2="${download_URL}buzzer/buzzer-support.cfg"
prtouch_folder="${klipper_extra_folder}prtouch_v2_fan"
prtouch_URL1="${download_URL}nozzle-cleaning-fan-control/__init__.py"
prtouch_URL2="${download_URL}nozzle-cleaning-fan-control/prtouch_v2_fan.pyc"
prtouch_URL3="${download_URL}nozzle-cleaning-fan-control/nozzle-cleaning-fan-control.cfg"
camera_file="${helper_script}/camera-settings.cfg"
camera_URL="${download_URL}camera/camera-settings.cfg"
bootdisplay_folder="/etc/boot-display"
bootdisplay_file="/etc/boot-display/part0/pic_100.jpg"
bootdisplay_URL1="${download_URL}boot-display/k1_boot_display.tar"
bootdisplay_URL2="${download_URL}boot-display/k1max_boot_display.tar"
bootdisplay_URL3="${download_URL}boot-display/stock_boot_display.tar"
crealityweb_file="/usr/bin/web-server"
guppyscreen_folder="/usr/data/guppyscreen/"
guppyscreen_URL1="${download_URL}guppyscreen/guppy_update.cfg"
guppyscreen_URL2="${download_URL}guppyscreen/guppy-update.sh"
shaperconfig_folder="/usr/data/shapers-configs/"
shaperconfig_URL1="${download_URL}shapers-configs/shapers-configs.tar"
shaperconfig_URL2="${download_URL}shapers-configs/shapers-configs.cfg"
fancontrols_URL1="${download_URL}macros/fans-control-not-upgrade.cfg"
fancontrols_URL2="${download_URL}macros/fans-control-upgrade.cfg"
fancontrols_file="${helper_script}/fans-control.cfg"
usefullmacros_URL="${download_URL}macros/usefull-macros.cfg"
usefullmacros_file="${helper_script}/usefull-macros.cfg"
savezoffset_URL="${download_URL}macros/save-zoffset.cfg"
savezoffset_file="${helper_script}/save-zoffset.cfg"
screwsadjust_URL1="${download_URL}screws-tilt-adjust/screws_tilt_adjust.py"
screwsadjust_URL2="${download_URL}screws-tilt-adjust/screws-tilt-adjust-k1.cfg"
screwsadjust_URL3="${download_URL}screws-tilt-adjust/screws-tilt-adjust-k1max.cfg"
screwsadjust_file="${helper_script}/screws-tilt-adjust.cfg"
fluiddlogo_URL1="${download_URL}fluidd/logo_creality_v1.svg"
fluiddlogo_URL2="${download_URL}fluidd/logo_creality_v2.svg"
fluiddlogo_URL3="${download_URL}fluidd/config.json"
fluiddlogo_file="/usr/data/fluidd/logo_creality_v2.svg"
supervisor_file="/usr/bin/supervisorctl"
supervisor_URL="${download_URL}fixes/supervisorctl"
klipperservice_URL="${download_URL}services/S55klipper_service"
firmware_version="$(cat /usr/data/creality/userdata/config/system_version.json | jq -r '.sys_version')"

rm -rf /root/.cache

if /usr/bin/get_sn_mac.sh model 2>&1 | grep -iq "K1"; then K1=1; else K1=0; fi

if [ ! -f /tmp/curl ]; then
    printf "${white}\n"
    printf " Downloading curl package needed for the script..."
    printf "${white}\n\n"
    wget -q --no-check-certificate https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/files/fixes/curl -O /tmp/curl >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        printf "${darkred} ✗ Download failed!"
        printf "${white}\n"
        printf "   Make sure your system date and time are correct.\n"
        printf "   You can check this with the command: ${yellow}date\n"
        printf "${white}   To change the date use the following command in this format: ${yellow}date -s \"YYYY-MM-DD HH:MM:SS\""
        printf "${white}\n\n"
        exit 1
    else
        chmod +x /tmp/curl >/dev/null 2>&1 &
        clear
    fi
fi

wait() {
    i=3
    while [ $i -ge 1 ]; do
        printf " ${yellow}$i${white}..."
        sleep 1
        i=$((i - 1))
    done
}

startup_update() {
    github_script=$(/tmp/curl -s -f -L https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/installer.sh)
    current_script=$(cat /root/installer.sh)
    if [ "$github_script" != "$current_script" ]; then
        current_version=$(echo "$github_script" | sed -n '3s/VERSION=//p')
        printf "${white}\n"
        printf "${green} A new script version is available!\n\n"
        printf "${white} See changelog here: ${yellow}https://tinyurl.com/w7d9k5bt\n\n"
        printf "${white} Do you want to update ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
        read confirm
        printf "${white}\n"
        while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
            printf "${darkred} ✗ Please select a correct choice!"
            printf "${white}\n\n"
            printf " Do you want to update to the latest version ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            read confirm
            printf "${white}\n"
        done
        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            /tmp/curl -s -f -L https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/installer.sh -o /root/installer.sh
            if [ $? -eq 0 ]; then
                printf "${green} ✓ The script has been updated!"
                read -p "${white} Press Enter to start the new version! "
                printf "${white}\n\n"
                exec sh /root/installer.sh
            else
                printf "${darkred} ✗ Error: Unable to retrieve script from GitHub.\n"
                printf "${white}   Please update it manually by visiting the Wiki: ${yellow}http://tinyurl.com/684r9bt9"
                printf "${white}\n\n"
                exit 1
            fi
        elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
            printf "${darkred} ✗ Update canceled! ${white}Starting old script version in"
            wait
            printf "${white}\n\n"
        fi
    fi
}

if [ -f /tmp/curl ]; then
    startup_update
fi

check_updates() {
    github_script=$(/tmp/curl -s -L https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/installer.sh)
    current_script=$(cat /root/installer.sh)
    if [ "$github_script" != "$current_script" ]; then   
        current_version=$(echo "$github_script" | sed -n '3s/VERSION=//p')
        printf "${green} A new script version is available!\n\n"
        printf "${white} See changelog here: ${yellow}https://tinyurl.com/w7d9k5bt\n\n"
        printf "${white} Do you want to update ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
        read confirm
        printf "${white}\n"
        while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
            printf "${darkred} ✗ Please select a correct choice!"
            printf "${white}\n\n"
            printf " Do you want to update to the latest version ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            read confirm
            printf "${white}\n"
        done
        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            /tmp/curl -s -f -L https://raw.githubusercontent.com/Guilouz/Creality-K1-and-K1-Max/main/Scripts/installer.sh -o /root/installer.sh
            if [ $? -eq 0 ]; then
                printf "${green} ✓ The script has been updated! ${white}Do you want to run the new version ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                read run_confirm
                printf "${white}\n"
                while [ "$run_confirm" != "y" ] && [ "$run_confirm" != "Y" ] && [ "$run_confirm" != "n" ] && [ "$run_confirm" != "N" ]; do
                    printf "${darkred} ✗ Please select a correct choice!"
                    printf "${white}\n\n"
                    printf " Do you want to run the new version ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                    read run_confirm
                    printf "${white}\n"
                done
                if [ "$run_confirm" = "y" -o "$run_confirm" = "Y" ]; then
                    exec sh /root/installer.sh
                elif [ "$run_confirm" = "n" -o "$run_confirm" = "N" ]; then
                    printf " You can run it next time with this command: ${yellow}cd && sh ./installer.sh"
                    printf "${white}\n\n"
                    exit
                fi
            else
                printf "${darkred} ✗ Error: Unable to retrieve script from GitHub.\n"
                printf "${white}   Please update it manually by visiting the Wiki: ${yellow}http://tinyurl.com/684r9bt9"
                printf "${white}\n\n"
                exit 1
            fi
        elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
            printf "${darkred} ✗ Update canceled!"
            printf "${white}\n\n"
        fi
    else
        printf "${green} ✓ Your script is already up to date!"
        wait
        printf "${white}\n\n"
    fi
}

check_folder() {
    local folder_path="$1"
    if [ -d "$folder_path" ]; then
        printf "${green}✓"
    else
        printf "${red}✗"
    fi
}

check_file() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        printf "${green}✓"
    else
        printf "${red}✗"
    fi
}

check_ipaddress() {
    eth0_ip=$(ip -4 addr show eth0 2>/dev/null | grep -o -E '(inet\s)([0-9]+\.){3}[0-9]+' | cut -d ' ' -f 2 | head -n 1)
    wlan0_ip=$(ip -4 addr show wlan0 | grep -o -E '(inet\s)([0-9]+\.){3}[0-9]+' | cut -d ' ' -f 2 | head -n 1)
    if [ -n "$eth0_ip" ]; then
        printf "$eth0_ip"
    elif [ -n "$wlan0_ip" ]; then
        printf "$wlan0_ip"
    else
        printf "xxx.xxx.xxx.xxx"
    fi
}

check_connection() {
    eth0_ip=$(ip -4 addr show eth0 2>/dev/null | grep -o -E '(inet\s)([0-9]+\.){3}[0-9]+' | cut -d ' ' -f 2 | head -n 1)
    wlan0_ip=$(ip -4 addr show wlan0 | grep -o -E '(inet\s)([0-9]+\.){3}[0-9]+' | cut -d ' ' -f 2 | head -n 1)
    if [ -n "$eth0_ip" ]; then
        printf "$eth0_ip (ETHERNET)"
    elif [ -n "$wlan0_ip" ]; then
        printf "$wlan0_ip (WLAN)"
    else
        printf "xxx.xxx.xxx.xxx"
    fi
}

check_version() {
  file="/usr/data/creality/userdata/config/system_version.json"
  if [ -e "$file" ]; then
    cat "$file" | jq -r '.sys_version'
  else
    printf "N/A"
  fi
}

topline() {
    printf ' %s\n' '┌──────────────────────────────────────────────────────────────┐'
}

bottomline() {
    printf ' %s\n' '└──────────────────────────────────────────────────────────────┘'
}

innerline() {
    printf ' %s\n' '├──────────────────────────────────────────────────────────────┤'
}

hr() {
    printf ' %s\n' '│                                                              │'
}

title() {
    local text=$1
    local color=$2
    local max_length=62
    local text_length=${#text}
    local padding_left=$(((max_length - text_length) / 2))
    local padding_right=$((max_length - text_length - padding_left))
    printf " │%*s$color%s${white}%*s│\n" $padding_left '' "$text" $padding_right ''
}

subtitle() {
    local menu_text1=$1
    local max_length=61
    local padding=$((max_length - ${#menu_text1}))
    printf " │ ${blue}${menu_text1}%-${padding}s${white}│ \n" ''
}

main_menu_option() {
    local menu_number=$1
    local menu_text1=$2
    local menu_text2=$3
    local max_length=56
    local total_text_length=$(( ${#menu_text1} + ${#menu_text2} ))
    local padding=$((max_length - total_text_length))
    printf " │  ${yellow}${menu_number}${white}) ${green}${menu_text1} ${white}${menu_text2}%-${padding}s${white}│ \n" ''
}

menu_option() {
    local menu_number=$1
    local menu_text1=$2
    local menu_text2=$3
    local max_length=60
    local total_text_length=$(( ${#menu_text1} + ${#menu_text2} + ${#menu_number} + 4 ))
    local padding=$((max_length - total_text_length))
    printf " │   ${yellow}${menu_number}${white}) ${white}${menu_text1} ${green}${menu_text2}%-${padding}s${white}│ \n" ''
}

bottom_menu_option() {
    local menu_number=$1
    local menu_text=$2
    local color=$3
    local max_length=57
    local padding=$((max_length - ${#menu_text}))
    printf " │  $color${menu_number}${white}) ${white}${menu_text}%-${padding}s${white}│ \n" ''
}

infoline() {
    local status=$1
    local text=$2
    local color=$3
    local max_length=66
    local total_text_length=$(( ${#status} + ${#text} ))
    local padding=$((max_length - total_text_length))
    printf " │   $color${status} ${white}${text}%-${padding}s${white}│ \n" ''
}

system_line() {
    local title="$1"
    local value="$2"
    local max_length=61
    local title_length=${#title}
    local separator=": "
    local value_length=${#value}
    local value_padding=$((max_length - title_length - ${#separator} - value_length))
    printf " │ ${green}%s${white}%s${white}\e[97m%s%-*s%s${white}│\n" "$title" "$separator" "$value" $value_padding ''
}


main_menu(){
    clear
    topline
    title 'INSTALLATION HELPER FOR CREALITY K1 SERIES' "${blue}"
    title 'Copyright © Cyril Guislain (Guilouz)' "${white}"
    innerline
    title "/!\\ ONLY USE THIS SCRIPT WITH FIRMWARE 1.3.2.1 AND ABOVE /!\\" "${darkred}"
    innerline
    hr
    main_menu_option '1' '[Install]' 'Menu'
    main_menu_option '2' '[Remove]' 'Menu'
    main_menu_option '3' '[Customize]' 'Menu'
    main_menu_option '4' '[Backup & Restore]' 'Menu'
    main_menu_option '5' '[Tools]' 'Menu'
    main_menu_option '6' '[Informations]' 'Menu'
    main_menu_option '7' '[System]' 'Menu'
    hr
    innerline
    hr
    bottom_menu_option 'u' 'Check Script Updates' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    printf " │%*s${cyan}%s ${white}│\n" $((max_length + 55)) '' "$VERSION"
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_main_menu
    opt_main_menu=$(echo "$opt_main_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

install_menu(){
    topline
    title '[ INSTALL MENU ]' "${yellow}"
    innerline
    hr
    subtitle '•ESSENTIALS:'
    menu_option ' 1' 'Install' 'Moonraker and Nginx'
    menu_option ' 2' 'Install' 'Fluidd (port 4408)'
    menu_option ' 3' 'Install' 'Mainsail (port 4409)'
    hr
    subtitle '•UTILITIES:'
    menu_option ' 4' 'Install' 'Entware'
    menu_option ' 5' 'Install' 'Klipper Gcode Shell Command'
    menu_option ' 6' 'Install' 'Hostname Service'
    menu_option ' 7' 'Install' 'Supervisor Lite'
    menu_option ' 8' 'Install' 'Host Controls Support'
    hr
    subtitle '•IMPROVEMENTS:'
    menu_option ' 9' 'Install' 'Klipper Adaptive Meshing & Purging'
    menu_option '10' 'Install' 'Buzzer Support'
    menu_option '11' 'Install' 'Nozzle Cleaning Fan Control'
    menu_option '12' 'Install' 'Fans Control Macros'
    menu_option '13' 'Install' 'Improved Shapers Calibrations'
    menu_option '14' 'Install' 'Usefull Macros'
    menu_option '15' 'Install' 'Save Z-Offset Macros'
    menu_option '16' 'Install' 'Screws Tilt Adjust Support'
    hr
    subtitle '•CAMERA:'
    menu_option '17' 'Install' 'Moonraker Timelapse '
    menu_option '18' 'Install' 'Camera Settings Control'
    hr
    subtitle '•REMOTE ACCESS AND AI DETECTION:'
    menu_option '19' 'Install' 'OctoEverywhere'
    menu_option '20' 'Install' 'Obico'
    menu_option '21' 'Install' 'Mobileraker Companion'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_install_menu
    opt_install_menu=$(echo "$opt_install_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

uninstall_menu(){
    topline
    title '[ REMOVE MENU ]' "${yellow}"
    innerline
    hr
    subtitle '•ESSENTIALS:'
    menu_option ' 1' 'Remove' 'Moonraker and Nginx'
    menu_option ' 2' 'Remove' 'Fluidd (port 4408)'
    menu_option ' 3' 'Remove' 'Mainsail (port 4409)'
    hr
    subtitle '•UTILITIES:'
    menu_option ' 4' 'Remove' 'Entware'
    menu_option ' 5' 'Remove' 'Klipper Gcode Shell Command'
    menu_option ' 6' 'Remove' 'Hostname Service'
    menu_option ' 7' 'Remove' 'Supervisor Lite'
    menu_option ' 8' 'Remove' 'Host Controls Support'
    hr
    subtitle '•IMPROVEMENTS:'
    menu_option ' 9' 'Remove' 'Klipper Adaptive Meshing & Purging'
    menu_option '10' 'Remove' 'Buzzer Support'
    menu_option '11' 'Remove' 'Nozzle Cleaning Fan Control'
    menu_option '12' 'Remove' 'Fans Control Macros'
    menu_option '13' 'Remove' 'Improved Shapers Calibrations'
    menu_option '14' 'Remove' 'Usefull Macros'
    menu_option '15' 'Remove' 'Save Z-Offset Macros'
    menu_option '16' 'Remove' 'Screws Tilt Adjust Support'
    hr
    subtitle '•CAMERA:'
    menu_option '17' 'Remove' 'Moonraker Timelapse'
    menu_option '18' 'Remove' 'Camera Settings Control'
    hr
    subtitle '•REMOTE ACCESS AND AI DETECTION:'
    menu_option '19' 'Remove' 'OctoEverywhere'
    menu_option '20' 'Remove' 'Obico'
    menu_option '21' 'Remove' 'Mobileraker Companion'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_uninstall_menu
    opt_uninstall_menu=$(echo "$opt_uninstall_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

backup_menu(){
    topline
    title '[ BACKUP & RESTORE MENU ]' "${yellow}"
    innerline
    hr
    menu_option '1' 'Backup Klipper configuration files'
    menu_option '2' 'Restore Klipper configuration files'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_backup_menu
    opt_backup_menu=$(echo "$opt_backup_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

customize_menu(){
    topline
    title '[ CUSTOMIZE MENU ]' "${yellow}"
    innerline
    hr
    menu_option '1' 'Install' 'Custom Boot Display'
    menu_option '2' 'Remove' 'Custom Boot Display'
    hr
    menu_option '3' 'Remove' 'Creality Web Interface'
    menu_option '4' 'Restore' 'Creality Web Interface'
    hr
    menu_option '5' 'Install' 'Guppy Screen'
    menu_option '6' 'Remove' 'Guppy Screen'
    hr
    menu_option '7' 'Install' 'Creality Dynamic Logos for Fluidd'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_customize_menu
    opt_customize_menu=$(echo "$opt_customize_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

tools_menu(){
    topline
    title '[ TOOLS MENU ]' "${yellow}"
    innerline
    hr
    menu_option '1' 'Restart Moonraker and Nginx services'
    menu_option '2' 'Restart Klipper service'
    hr
    menu_option '3' 'Prevent updating Klipper configuration files'
    menu_option '4' 'Allow updating Klipper configuration files'
    hr
    menu_option '5' 'Restore a previous firmware'
    hr
    menu_option '6' 'Clear cache'
    menu_option '7' 'Clear logs files'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_tools_menu
    opt_tools_menu=$(echo "$opt_tools_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

info_menu(){
    topline
    title '[ INFORMATIONS MENU ]' "${yellow}"
    innerline
    hr
    subtitle '•ESSENTIALS:'
    infoline "$(check_folder "$moonraker_folder")" 'Moonraker & Nginx'
    infoline "$(check_folder "$fluidd_folder")" 'Fluidd'
    infoline "$(check_folder "$mainsail_folder")" 'Mainsail'
    hr
    subtitle '•UTILITIES:'
    infoline "$(check_file "$entware_file")" 'Entware'
    infoline "$(check_file "$shellcommand_file")" 'Klipper Gcode Shell Command'
    infoline "$(check_file "$hostname_file")" 'Hostname Service'
    infoline "$(check_file "$supervisor_file")" 'Supervisor Lite'
    infoline "$(check_file "$systemctl_file")" 'Host Controls Support'
    hr
    subtitle '•IMPROVEMENTS:'
    infoline "$(check_folder "$kamp_folder")" 'Klipper Adaptive Meshing & Purging'
    infoline "$(check_file "$buzzer_file")" 'Buzzer Support'
    infoline "$(check_folder "$prtouch_folder")" 'Nozzle Cleaning Fan Control'
    infoline "$(check_file "$fancontrols_file")" 'Fans Control Macros' 
    infoline "$(check_folder "$shaperconfig_folder")" 'Improved Shapers Calibrations'
    infoline "$(check_file "$usefullmacros_file")" 'Usefull Macros'
    infoline "$(check_file "$savezoffset_file")" 'Save Z-Offset Macros'
    infoline "$(check_file "$screwsadjust_file")" 'Screws Tilt Adjust Support'
    hr
    subtitle '•CAMERA:'
    infoline "$(check_file "$timelapse_file")" 'Moonraker Timelapse'
    infoline "$(check_file "$camera_file")" 'Camera Settings Control'
    hr
    subtitle '•REMOTE ACCESS AND AI DETECTION:'
    infoline "$(check_folder "$octoeverywhere_folder")" 'OctoEverywhere'
    infoline "$(check_folder "$moonraker_obico_folder")" 'Obico'
    infoline "$(check_folder "$mobileraker_folder")" 'Mobileraker Companion'
    hr
    subtitle '•CUSTOMIZATION:'
    infoline "$(check_file "$bootdisplay_file")" 'Custom Boot Display'
    infoline "$(check_file "$crealityweb_file")" 'Creality Web Interface'
    infoline "$(check_folder "$guppyscreen_folder")" 'Guppy Screen'
    infoline "$(check_file "$fluiddlogo_file")" 'Creality Dynamic Logos for Fluidd'
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_info_menu
    opt_info_menu=$(echo "$opt_info_menu" | tr '[:lower:]' '[:upper:]')
    printf "${white}\n"
}

system_menu(){
    memfree=`cat /proc/meminfo | grep MemFree | awk {'print $2'}`
    memtotal=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`
    pourcent=$((($memfree * 100)/$memtotal))
    diskused=`df -h | grep /dev/mmcblk0p10 | awk {'print $3 " / " $2 " (" $4 " available)" '}`
    process=`ps ax | wc -l | tr -d " "`
    uptime=`cat /proc/uptime | cut -f1 -d.`
    upDays=$((uptime/60/60/24))
    upHours=$((uptime/60/60%24))
    upMins=$((uptime/60%60))
    load=`cat /proc/loadavg | awk {'print $1 " (1 min.) / " $2 " (5 min.) / " $3 " (15 min.)"'}`
    device_sn=$(cat /usr/data/creality/userdata/config/system_config.json | grep -o '"device_sn":"[^"]*' | awk -F '"' '{print $4}')
    mac_address=$(cat /usr/data/creality/userdata/config/system_config.json | grep -o '"device_mac":"[^"]*' | awk -F '"' '{print $4}' | sed 's/../&:/g; s/:$//')
    topline
    title '[ SYSTEM MENU ]' "${yellow}"
    innerline
    hr
    system_line "     System" "$(uname -s) (Kernel $(uname -r))" "${green}"
    system_line "   Firmware" "$(check_version)"
    system_line "   Hostname" "$(uname -n)"
    system_line "  Device SN" "$device_sn"
    system_line " IP Address" "$(check_connection)"
    system_line "MAC Address" "$mac_address"
    system_line "  RAM Usage" "$(($memfree/1024)) MB / $(($memtotal/1024)) MB ($pourcent% available)"
    system_line " Disk Usage" "$diskused"
    system_line "     Uptime" "$upDays days $upHours hours $upMins minutes"
    system_line "  Processes" "$process running process"
    system_line "System Load" "$load"
    hr
    innerline
    hr
    bottom_menu_option 'b' 'Back to [Main Menu]' "${yellow}"
    bottom_menu_option 'q' 'Exit' "${darkred}"
    hr
    bottomline
    printf "\n"
    printf " ${white}Type your choice and validate with Enter: ${yellow}"
    read -rp "" opt_system_menu
    opt_system_menu=$(echo "$opt_system_menu" | tr '[:lower:]' '[:upper:]')
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
            				printf "${darkred} ✗ Moonraker and Nginx are already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Moonraker is a Python 3 based web server that exposes APIs with"
            			    printf "\n"
            			    printf " which client applications may use to interact with Klipper firmware."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Moonraker and Nginx ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Moonraker and Nginx ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Moonraker and Nginx..."
                			    printf "${white}\n\n"
                			    cd /usr/data
                			    if [ -f "moonraker.tar" ]; then
                			        rm -f moonraker.tar
                			    fi
                			    printf "Downloading Moonraker and Nginx file... Please wait...\n"
                			    /tmp/curl -s -L "$moonraker_URL" -o moonraker.tar
                			    if [ $? -eq 0 ]; then
                			        printf "Installing files...\n"
                			        tar -xvf moonraker.tar
                			        [ ! -e /etc/init.d/S50nginx ] && cp nginx/S50nginx /etc/init.d/
                			        [ ! -e /etc/init.d/S56moonraker_service ] && cp moonraker/S56moonraker_service /etc/init.d/
                			        printf "Removing file...\n"
                			        rm -f moonraker.tar
                			        if grep -q "send_timeout 1600" /usr/data/nginx/nginx/nginx.conf; then
                                        printf "Nginx configurations are already fixed.\n"
                                    else
                                        printf "Fixing Nginx configurations...\n"
                                        sed -i '/keepalive_timeout  65;/a \    proxy_connect_timeout 1600;\n    proxy_send_timeout 1600;\n    proxy_read_timeout 1600;\n    send_timeout 1600;' /usr/data/nginx/nginx/nginx.conf
                                    fi
                			        printf "Downloading Moonraker configuration file...\n"
                    			    /tmp/curl -L "$moonraker_config_URL" -o "$moonraker_config"
                			        printf "Applying changes...\n"
                			        cd /usr/data/moonraker/moonraker
                			        git stash; git checkout master; git pull
                			        printf "Installing necessary package...\n"
                			        python3 -m pip install pyserial-asyncio==0.6
                			        printf "Restarting services...\n"
                			        /etc/init.d/S50nginx start
                			        sleep 1
                			        /etc/init.d/S56moonraker_service start
                			        sleep 1
                			        printf "\n"
                			        printf "${green} ✓ Moonraker and Nginx have been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    2)
            			if [ -d "$fluidd_folder" ]; then
            				printf "${darkred} ✗ Fluidd is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} ✗ Please install Moonraker and Nginx first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Fluidd is a free and open-source Klipper Web interface for"
            			    printf "\n"
            			    printf " managing your 3d printer."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Fluidd..."
                			    printf "${white}\n\n"
	            			    cd /usr/data
	            			    if [ -f "fluidd.zip" ]; then
                			        rm -f fluidd.zip
                			    fi
                			    printf "Downloading Fluidd file... Please wait...\n"
	            			    /tmp/curl -s -L "$fluidd_URL" -o fluidd.zip
	            			    if [ $? -eq 0 ]; then
	            			        printf "Copying files...\n"
	            			        mkdir -p /usr/data/fluidd
	            			        mv fluidd.zip fluidd
                			        cd /usr/data/fluidd
                			        unzip fluidd.zip
                			        printf "Removing file...\n"
                			        rm -f fluidd.zip
                			        if grep -q "#\[update_manager fluidd\]" "$moonraker_config" ; then
                                        printf "Enabling Fluidd configurations in moonraker.conf file...\n"
                                        sed -i -e 's/^\s*#[[:space:]]*\[update_manager fluidd\]/[update_manager fluidd]/' -e '/^\[update_manager fluidd\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$moonraker_config"
                                    else
                                        printf "Fluidd configurations are already enabled in moonraker.conf file.\n"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n"
                			        printf "${green} ✓ Fluidd has been installed successfully!"
                			        printf "${white}\n\n"
                			        printf " You can now connect to Fluidd Web Interface with ${yellow}http://$(check_ipaddress):4408"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
            			if [ -d "$mainsail_folder" ]; then
            				printf "${darkred} ✗ Mainsail is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} ✗ Please install Moonraker and Nginx first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Mainsail is the popular Web interface for managing and"
            			    printf "\n"
            			    printf " controlling 3D printers with Klipper."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Mainsail ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Mainsail ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Mainsail..."
                			    printf "${white}\n\n"
                			    cd /usr/data
                			    if [ -f "mainsail.zip" ]; then
                			        rm -f mainsail.zip
                			    fi
                			    printf "Downloading Mainsail file... Please wait...\n"
                			    /tmp/curl -s -L "$mainsail_URL" -o mainsail.zip
	            			    if [ $? -eq 0 ]; then
	            			        printf "Copying files...\n"
	            			        mkdir -p /usr/data/mainsail
	            			        mv mainsail.zip mainsail
                			        cd /usr/data/mainsail
                			        unzip mainsail.zip
                			        printf "Removing file...\n"
                			        rm -f mainsail.zip
                			        if grep -q "#\[update_manager mainsail\]" "$moonraker_config" ; then
                                        printf "Enabling Mainsail configurations in moonraker.conf file...\n"
                                        sed -i -e 's/^\s*#[[:space:]]*\[update_manager mainsail\]/[update_manager mainsail]/' -e '/^\[update_manager mainsail\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$moonraker_config"
                                    else
                                        printf "Mainsail configurations are already enabled in moonraker.conf file.\n"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n"
                			        printf "${green} ✓ Mainsail has been installed successfully!"
                			        printf "${white}\n\n"
                			        printf " You can now connect to Mainsail Web Interface with ${yellow}http://$(check_ipaddress):4409"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    4)
                        printf "${cyan} Entware is a software repository for devices which use the Linux kernel."
                        printf "\n"
                        printf " It allows packages to be added to your printer."
            			printf "${white}\n\n"
                        printf " Are you sure you want to install ${green}Entware ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			read confirm
            			printf "${white}\n"
            			while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Entware ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
            			if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                            printf "${green} Installing Entware..."
                            printf "${white}\n\n"
            			    echo "Making /opt directory on data partition where there is space, and adding a symbolic link..."
            			    rm -rf /opt /usr/data/opt
            			    mkdir -p /usr/data/opt
            			    ln -nsf /usr/data/opt /opt
            			    echo "Downloading generic installer script..."
            			    wget --no-check-certificate -O - "$entware_URL" | /bin/sh
            			    if [ $? -eq 0 ]; then
            			        echo "Adding /opt/bin and /opt/sbin to the start of the PATH in the system profile..."
            			        echo 'export PATH="/opt/bin:/opt/sbin:$PATH"' > /etc/profile.d/entware.sh
            			        echo "Adding startup script..."
            			        echo -e '#!/bin/sh\n/opt/etc/init.d/rc.unslung "$1"' > /etc/init.d/S50unslung
            			        chmod 755 /etc/init.d/S50unslung
            			        printf "\n"
            			        printf "${green} ✓ Entware has been installed successfully!"
            			        printf "${white}\n\n"
            			        printf " Log out and log back in, and you can now install packages with: ${yellow}opkg install <packagename>"
            			        printf "${white}\n\n"
            			    else
            			        printf "${white}\n\n"
                			    printf "${darkred} ✗ Download failed!"
                			    wait
                			    printf "${white}\n\n"
                			fi
            			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			printf "${darkred} ✗ Installation canceled!"
                			printf "${white}\n\n"
            			fi
                        ;;
                    5)
            			if [ -f "$shellcommand_file" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to run Linux commands or even scripts from Klipper."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Klipper Gcode Shell Command ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Klipper Gcode Shell Command ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Installing Klipper Gcode Shell Command..."
            			        printf "${white}\n\n"
                			    printf "Downloading Klipper Gcode Shell Command...\n"
                			    /tmp/curl -s -L "$shellcommand_URL" -o "$shellcommand_file"
                			    if [ $? -eq 0 ]; then
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        printf "\n"
                			        printf "${green} ✓ Klipper Gcode Shell Command has been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    6)
            			if [ -f "$hostname_file" ]; then
            				printf "${darkred} ✗ Hostname Service is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ $K1 -eq 0 ]; then
                            printf "${darkred} ✗ This feature is not compatible with your printer."
                            wait
                            printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to change the hostname of the machine for firmwares < 1.3.2.20."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Hostname Service ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Hostname Service ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Hostname Service..."
                			    printf "${white}\n\n"
                			    printf "Downloading Hostname Service file...\n"
                			    /tmp/curl -s -L "$hostname_URL" -o "$hostname_file"
                			    if [ $? -eq 0 ]; then
                			        printf "Applying permissions...\n"
                			        chmod 755 "$hostname_file"
                			        printf "\n"
                			        printf "${green} ✓ Hostname Service has been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    7)
            			if [ -f "$supervisor_file" ]; then
            				printf "${darkred} ✗ Supervisor Lite is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows managing services with Moonraker."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Supervisor Lite ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Supervisor Lite ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Supervisor Lite..."
                			    printf "${white}\n\n"
								printf "Downloading supervisorctl file...\n"
								/tmp/curl -s -L "$supervisor_URL" -o "$supervisor_file"
								if [ $? -eq 0 ]; then
								    printf "Applying permissions...\n"
                			        chmod 755 /usr/bin/supervisorctl
                			        if grep -q "provider: none" "$moonraker_config" && ! grep -q "provider: supervisord_cli" "$moonraker_config"; then
                                        printf "Replacing provider in moonraker.conf file...\n"
                                        sed -i 's/provider: none/provider: supervisord_cli/' "$moonraker_config"
                                    else
                                        printf "Provider is already replaced in moonraker.conf file.\n"
                                    fi
                                    if grep -q "is_system_service: False" "$moonraker_config" && ! grep -q "managed_services: klipper" "$moonraker_config"; then
                                        printf "Replacing managed services in moonraker.conf file...\n"
                                        sed -i 's/is_system_service: False/managed_services: klipper/' "$moonraker_config"
                                    else
                                        printf "Managed services are already replaced in moonraker.conf file.\n"
                                    fi
                                    printf "Restarting services...\n"
                			        /etc/init.d/S56moonraker_service restart
                                    sleep 1
                                    /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n"
                			        printf "${green} ✓ Supervisor Lite has been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    8)
            			if [ -f "$systemctl_file" ] && [ -f "$sudo_file" ]; then
            				printf "${darkred} ✗ Host Controls Support is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to use Reboot and Shutdown buttons on Fluidd or Mainsail."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Host Controls Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Host Controls Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Host Controls Support..."
                			    printf "${white}\n\n"
								printf "Downloading systemctl file...\n"
								/tmp/curl -s -L "$sudo_URL" -o "$sudo_file"
								if [ $? -eq 0 ]; then
								    printf "Applying permissions...\n"
                			        chmod 755 /usr/bin/sudo
								    printf "Downloading sudo file...\n"
								    /tmp/curl -s -L "$systemctl_URL" -o "$systemctl_file"
								    if [ $? -eq 0 ]; then
								        printf "Applying permissions...\n"
                			            chmod 755 /usr/bin/systemctl
                			            printf "\n"
                			            printf "${green} ✓ Host Controls Support has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            rm -f "$sudo_file"
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        rintf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    9)
            			if [ -d "$kamp_folder" ]; then
            				printf "${darkred} ✗ Klipper Adaptive Meshing & Purging is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Klipper Adaptive Meshing & Purging is an extension that allows"
            			    printf "\n"
            			    printf " you to generate a mesh only in the area you really need it."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Klipper Adaptive Meshing & Purging ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                rintf " Are you sure you want to install ${green}Klipper Adaptive Meshing & Purging ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Klipper Adaptive Meshing & Purging..."
                			    printf "${white}\n\n"
                			    cd /usr/data
                			    printf "Cloning repository...\n"
                			    git clone "$kamp_URL"
                			    if [ $? -eq 0 ]; then
                			        if [ -d "$helper_script"/KAMP ]; then
                			            rm -rf "$helper_script"/KAMP
                			        fi
                			        if [ -f "$helper_script"/KAMP_Settings.cfg ]; then
                			            rm -f "$helper_script"/KAMP_Settings.cfg
                			        fi
                			        if [ ! -d "$helper_script" ]; then
                			            mkdir -p "$helper_script"
                			        fi
                			        printf "Linking files...\n"
                			        ln -s ../../../KAMP-for-K1-Series/Configuration /usr/data/printer_data/config/Helper-Script/KAMP
                                    printf "Moving file...\n"
                			        cp KAMP-for-K1-Series/Configuration/KAMP_Settings.cfg "$helper_script"/KAMP_Settings.cfg
                			        if grep -q "#\[include .*/KAMP/Start_Print.cfg\]" "$helper_script"/KAMP_Settings.cfg ; then
                                        printf "Enabling [include .*/KAMP/Start_Print.cfg] in KAMP_Settings.cfg file...\n"
                                        sed -i 's/^#\[include \.\/KAMP\/Start_Print\.cfg\]/[include .\/KAMP\/Start_Print.cfg]/' "$helper_script"/KAMP_Settings.cfg
                                    else
                                        printf "[include .*/KAMP/Start_Print.cfg] is already enabled in KAMP_Settings.cfg file.\n"
                                    fi
                			        if grep -q "include KAMP_Settings" "$printer_config" ; then
                                        printf "KAMP configurations are already enabled in printer.cfg file.\n"
                                    else
                                        printf "Adding KAMP configurations in printer.cfg file...\n"
                                        sed -i '/\[include printer_params\.cfg\]/a [include Helper-Script/KAMP_Settings.cfg]' "$printer_config"
                                    fi
                                    if grep -q "enable_object_processing: False" "$moonraker_config" && ! grep -q "enable_object_processing: True" "$moonraker_config"; then
                                        printf "Enabling object processing in moonraker.conf file...\n"
                                        sed -i 's/enable_object_processing: False/enable_object_processing: True/' "$moonraker_config"
                                    else
                                        printf "Object processing is already enabled in moonraker.conf file.\n"
                                    fi
                                    if grep -q "#\[update_manager KAMP-for-K1-Series\]" "$moonraker_config" ; then
                                        printf "Enabling KAMP configurations in moonraker.conf file...\n"
                                        sed -i -e 's/^\s*#[[:space:]]*\[update_manager KAMP-for-K1-Series\]/[update_manager KAMP-for-K1-Series]/' -e '/^\[update_manager KAMP-for-K1-Series\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$moonraker_config"
                                    else
                                        printf "KAMP configurations are already enabled in moonraker.conf file.\n"
                                    fi
                                    if grep -q "\[gcode_macro START_PRINT\]" "$macro_config" ; then
                                        printf "Disabling [gcode_macro START_PRINT] in gcode_macro.cfg file...\n"
                                        sed -i '/\[gcode_macro START_PRINT\]/,/^\s*CX_PRINT_DRAW_ONE_LINE/ { /^\s*$/d }' "$macro_config"
                                        sed -i '/^\[gcode_macro START_PRINT\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$macro_config"
                                    else
                                        printf "[gcode_macro START_PRINT] is already disabled in gcode_macro.cfg file.\n"
                                    fi
                                    printf "${white}\n"
                                    printf " Do you use Prusa Slicer ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                    read confirm_prusa
                                    printf "${white}\n"
                                    while [ "$confirm_prusa" != "y" ] && [ "$confirm_prusa" != "Y" ] && [ "$confirm_prusa" != "n" ] && [ "$confirm_prusa" != "N" ]; do
                                        printf "${darkred} ✗ Please select a correct choice!"
                                        printf "${white}\n\n"
                                        printf " Do you use Prusa Slicer ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                        read confirm_prusa
                                        printf "${white}\n"
                                    done
                                    if [ "$confirm_prusa" = "y" ] || [ "$confirm_prusa" = "Y" ]; then
                                        if grep -q "#\[include .*/KAMP/Prusa_Slicer.cfg\]" "$helper_script"/KAMP_Settings.cfg ; then
                                            printf "Enabling [include .*/KAMP/Prusa_Slicer.cfg] in KAMP_Settings.cfg file...\n"
                                            sed -i 's/^#\[include \.\/KAMP\/Prusa_Slicer\.cfg\]/[include .\/KAMP\/Prusa_Slicer.cfg]/' "$helper_script"/KAMP_Settings.cfg
                                        else
                                            printf "[include .*/KAMP/Prusa_Slicer.cfg] is already enabled in KAMP_Settings.cfg file.\n"
                                        fi
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        /etc/init.d/S56moonraker_service restart
                                    sleep 1
                                    /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        printf "\n"
                			        printf "${green} ✓ Klipper Adaptive Meshing & Purging has been installed successfully!"
                			        printf "${white}\n\n"
                			        printf " Make sure Label Objects setting is enabled in your slicer."
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    10)
            			if [ -f "$buzzer_file" ]; then
            				printf "${darkred} ✗ Buzzer Support is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ $K1 -eq 0 ]; then
                            printf "${darkred} ✗ This feature is not compatible with your printer."
                            wait
                            printf "${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} ✗ Please install Klipper Gcode Shell Command first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows sounds to be played using the motherboard buzzer."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Buzzer Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Buzzer Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Buzzer Support..."
                			    printf "${white}\n\n"
                			    printf "Downloading Buzzer Support files...\n"
                			    if [ -f "$helper_script"/buzzer-support.cfg ]; then
                			        rm -f "$helper_script"/buzzer-support.cfg
                			    fi
                			    /tmp/curl -s -L "$buzzer_URL1" -o "$buzzer_file"
                			    if [ $? -eq 0 ]; then
                			        if [ ! -d "$helper_script" ]; then
                			            mkdir -p "$helper_script"
                			        fi
                			        /tmp/curl -s -L "$buzzer_URL2" -o "$helper_script"/buzzer-support.cfg
                			        if [ $? -eq 0 ]; then
                			            if grep -q "include Helper-Script/buzzer-support" "$printer_config" ; then
                                            printf "Buzzer Support configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Buzzer Support configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/buzzer-support\.cfg\]' "$printer_config"
                                        fi
                			            printf "Restarting services...\n"
                			            /etc/init.d/S55klipper_service restart
                			            printf "\n"
                			            printf "${green} ✓ Buzzer Support has been installed successfully!"
                			            printf "${white}\n\n"
                			            printf " You can now use ${yellow}BEEP ${white}command in your macros to play sound."
                			            printf "${white}\n\n"
                			        else
                			            rm -f "$buzzer_file" 2>/dev/null
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    11)
            			if [ -d "$prtouch_folder" ]; then
            				printf "${darkred} ✗ Nozzle Cleaning Fan Control is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ $K1 -eq 0 ]; then
                            printf "${darkred} ✗ This feature is not compatible with your printer."
                            wait
                            printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to control fans during nozzle cleaning."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Nozzle Cleaning Fan Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Nozzle Cleaning Fan Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Nozzle Cleaning Fan Control..."
                			    printf "${white}\n\n"
                			    mkdir -p "$klipper_extra_folder"prtouch_v2_fan
                			    printf "Downloading Nozzle Cleaning Fan Control files...\n"
                			    /tmp/curl -s -L "$prtouch_URL1" -o "$klipper_extra_folder"prtouch_v2_fan/__init__.py
                			    /tmp/curl -s -L "$prtouch_URL2" -o "$klipper_extra_folder"prtouch_v2_fan/prtouch_v2_fan.pyc
                			    if [ $? -eq 0 ]; then
                			        if [ -f "$helper_script"/nozzle-cleaning-fan-control.cfg ]; then
                			            rm -f "$helper_script"/nozzle-cleaning-fan-control.cfg
                			        fi
                			        if [ ! -d "$helper_script" ]; then
                			            mkdir -p "$helper_script"
                			        fi
                			        /tmp/curl -s -L "$prtouch_URL3" -o "$helper_script"/nozzle-cleaning-fan-control.cfg
                			        if [ $? -eq 0 ]; then
                			            if grep -q "include Helper-Script/nozzle-cleaning-fan-control" "$printer_config" ; then
                                            printf "Nozzle Cleaning Fan Control configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Nozzle Cleaning Fan Control configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/nozzle-cleaning-fan-control\.cfg\]' "$printer_config"
                                        fi
                			            printf "Restarting services...\n"
                                        /etc/init.d/S55klipper_service restart
                                        printf "\n"
                			            printf "${green} ✓ Nozzle Cleaning Fan Control has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            rm -rf "$klipper_extra_folder"prtouch_v2_fan 2>/dev/null
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        rm -rf "$klipper_extra_folder"prtouch_v2_fan 2>/dev/null
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf " ${darkred}✗ Installation canceled! ${white}\n\n"
            			    fi
            			fi
                        ;;
                    12)
            			if [ -f "$fancontrols_file" ]; then
            				printf "${darkred} ✗ Fans Control Macros are already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    if [ "$firmware_version" == "1.3.2.1" ] || [ "$firmware_version" == "1.3.2.20" ]; then
            			        printf "${cyan} This allows to control Chamber and Motherboard fans with slicers."
            			    else
            			        printf "${cyan} This allows to control Motherboard fan with slicers."
            			    fi
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Fans Control Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Fans Control Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Fans Control Macros..."
                			    printf "${white}\n\n"
                                printf "Downloading Fans Control Macros...\n"
                                if [ -f "$helper_script"/fans-control.cfg ]; then
                                    rm -f "$helper_script"/fans-control.cfg
                                fi
                                if [ ! -d "$helper_script" ]; then
                			        mkdir -p "$helper_script"
                			    fi
                			    if [ "$firmware_version" == "1.3.2.1" ] || [ "$firmware_version" == "1.3.2.20" ]; then
                			        /tmp/curl -s -L "$fancontrols_URL1" -o "$helper_script"/fans-control.cfg
                			    else
                			        /tmp/curl -s -L "$fancontrols_URL2" -o "$helper_script"/fans-control.cfg
                			    fi
                			    if [ $? -eq 0 ]; then
                			        if grep -q "include Helper-Script/fans-control" "$printer_config" ; then
                                        printf "Fans Control Macros configurations are already enabled in printer.cfg file.\n"
                                    else
                                        printf "Adding Fans Control Macros configurations in printer.cfg file...\n"
                                        sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/fans-control\.cfg\]' "$printer_config"
                                    fi
                                    if grep -q "\[duplicate_pin_override\]" "$printer_config" ; then
                                        printf "Disabling [duplicate_pin_override] configuration in printer.cfg file...\n"
                                        sed -i '/^\[duplicate_pin_override\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$printer_config"
                                    else
                                        printf "[duplicate_pin_override] configuration is already disabled in printer.cfg file.\n"
                                    fi
                                    if grep -q "\[temperature_fan chamber_fan\]" "$printer_config" ; then
                                        printf "Disabling [temperature_fan chamber_fan] configuration in printer.cfg file...\n"
                                        sed -i '/^\[temperature_fan chamber_fan\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$printer_config"
                                    else
                                        printf "[temperature_fan chamber_fan] configuration is already disabled in printer.cfg file.\n"
                                    fi
                                    if grep -q "\[gcode_macro M106\]" "$macro_config" ; then
                                        printf "Disabling [gcode_macro M106] in gcode_macro.cfg file...\n"
                                        sed -i '/^\[gcode_macro M106\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$macro_config"
                                    else
                                        printf "[gcode_macro M106] macro is already disabled in gcode_macro.cfg file.\n"
                                    fi
                                    if grep -q "\[gcode_macro M141\]" "$macro_config" ; then
                                        printf "Disabling [gcode_macro M141] in gcode_macro.cfg file...\n"
                                        sed -i '/^\[gcode_macro M141\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$macro_config"
                                    else
                                        printf "[gcode_macro M141] macro is already disabled in gcode_macro.cfg file.\n"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        printf "\n"
                			        printf "${green} ✓ Fans Control Macros have been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        rmdir "$helper_script" 2>/dev/null
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    13)
            			if [ -d "$shaperconfig_folder" ]; then
            				printf "${darkred} ✗ Improved Shapers Calibrations are already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ -d "$guppyscreen_folder" ]; then
            				printf "${darkred} ✗ GuppyScreen already have this functionalities!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f /lib/ld-2.29.so ]; then
            			    printf "${darkred} ✗ Make sure you're running 1.3.x.x firmware version!"
            			    wait
            			    printf "${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} ✗ Please install Klipper Gcode Shell Command first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Improved Shapers Calibrations allows to calibrate"
            			    printf "\n"
            			    printf " Input Shaper, Belts Tension and Generate Graphs."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Improved Shapers Calibrations ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Improved Shapers Calibrations ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Installing Improved Shapers Calibrations..."
                			    printf "${white}\n\n"
                			    cd /usr/data
                			    if [ -f "shapers-configs.tar" ]; then
                			        rm -f shapers-configs.tar
                			    fi
                			    printf "Downloading Improved Shapers Calibrations file...\n"
                			    /tmp/curl -s -L "$shaperconfig_URL1" -o shapers-configs.tar
                			    if [ $? -eq 0 ]; then
                			        tar -xvf shapers-configs.tar
                			        rm -f shapers-configs.tar
                			        printf "Backing up original files...\n"
                			        if [ ! -f /usr/data/shapers-configs/backup/ft2font.cpython-38-mipsel-linux-gnu.so ]; then
                                        mv /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so /usr/data/shapers-configs/backup
                                    fi
                			        printf "Configuring files...\n"
                			        cp "$shaperconfig_folder"calibrate_shaper_config.py "$klipper_extra_folder"
                			        if [ ! -d "/usr/lib/python3.8/site-packages/matplotlib-2.2.3-py3.8.egg-info" ]; then
                                        printf "mathplotlib ft2font module is not replaced. PSD graphs might not work.\n"
                                    else
                                        printf "Replacing mathplotlib ft2font module to generate PSD graphs...\n"
                                        cp "$shaperconfig_folder"ft2font.cpython-38-mipsel-linux-gnu.so /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so
                                    fi
                                    printf "Downloading configurations file...\n"
                			        /tmp/curl -s -L "$shaperconfig_URL2" -o "$shaperconfig_folder"scripts/shapers-configs.cfg
                			        if [ $? -eq 0 ]; then
                                        if [ -f "$helper_script"/shapers-configs/shapers-configs.cfg ]; then
                                            rm -f "$helper_script"/shapers-configs/shapers-configs.cfg
                                        fi
                			            if [ ! -d "$helper_script"/shapers-configs/scripts ]; then
                			                mkdir -p "$helper_script"/shapers-configs/scripts
                			            fi
                			            cp "$shaperconfig_folder"scripts/*.cfg "$helper_script"/shapers-configs
                                        cp "$shaperconfig_folder"scripts/*.py "$helper_script"/shapers-configs/scripts
                                        if grep -q 'variable_autotune_shapers:' "$macro_config" ; then
                                            sed -i 's/variable_autotune_shapers:/#&/' "$macro_config"
                                            printf "Disabling stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already disabled in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q '\[gcode_macro INPUTSHAPER\]' "$macro_config" ; then
                                            sed -i 's/SHAPER_CALIBRATE AXIS=y/SHAPER_CALIBRATE/' "$macro_config"
                                            printf "Replacing stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already replaced in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q "include Helper-Script/shapers-configs/shapers-configs" "$printer_config" ; then
                                            printf "Improved Shapers Calibration configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Improved Shapers Calibration configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/shapers-configs/shapers-configs\.cfg\]' "$printer_config"
                                        fi
                			            printf "Restarting services...\n"
                			            /etc/init.d/S55klipper_service restart
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            printf "\n"
                			            printf "${green} ✓ Improved Shapers Calibrations have been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            cp -f "$shaperconfig_folder"backup/ft2font.cpython-38-mipsel-linux-gnu.so /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so
                			            rm -rf "$shaperconfig_folder"
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    14)
            			if [ -f "$usefullmacros_file" ]; then
            				printf "${darkred} ✗ Usefull Macros are already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to install usefull macros like Bed Leveling and PID."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Usefull Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Usefull Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Usefull Macros..."
                			    printf "${white}\n\n"
                                printf "Downloading Usefull Macros...\n"
                                if [ -f "$helper_script"/usefull-macros.cfg ]; then
                                    rm -f "$helper_script"/usefull-macros.cfg
                                fi
                                if [ ! -d "$helper_script" ]; then
                			        mkdir -p "$helper_script"
                			    fi
                			    /tmp/curl -s -L "$usefullmacros_URL" -o "$helper_script"/usefull-macros.cfg
                			    if [ $? -eq 0 ]; then
                			        if grep -q "include Helper-Script/usefull-macros" "$printer_config" ; then
                                        printf "Usefull Macros configurations are already enabled in printer.cfg file.\n"
                                    else
                                        printf "Adding Usefull Macros configurations in printer.cfg file...\n"
                                        sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/usefull-macros\.cfg\]' "$printer_config"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        printf "\n"
                			        printf "${green} ✓ Usefull Macros have been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        rmdir "$helper_script" 2>/dev/null
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    15)
            			if [ -f "$savezoffset_file" ]; then
            				printf "${darkred} ✗ Save Z-Offset Macros are already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows the Z-Offset to be automatically saved and loaded."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Save Z-Offset Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Save Z-Offset Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Save Z-Offset Macros..."
                			    printf "${white}\n\n"
                                printf "Downloading Save Z-Offset Macros...\n"
                                if [ -f "$helper_script"/save-zoffset.cfg ]; then
                                    rm -f "$helper_script"/save-zoffset.cfg
                                fi
                                if [ ! -d "$helper_script" ]; then
                			        mkdir -p "$helper_script"
                			    fi
                			    /tmp/curl -s -L "$savezoffset_URL" -o "$helper_script"/save-zoffset.cfg
                			    if [ $? -eq 0 ]; then
                			        if grep -q "include Helper-Script/save-zoffset" "$printer_config" ; then
                                        printf "Save Z-Offset Macros configurations are already enabled in printer.cfg file.\n"
                                    else
                                        printf "Adding Save Z-Offset Macros configurations in printer.cfg file...\n"
                                        sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/save-zoffset\.cfg\]' "$printer_config"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        printf "\n"
                			        printf "${green} ✓ Save Z-Offset Macros have been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        rmdir "$helper_script" 2>/dev/null
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    16)
            			if [ -f "$screwsadjust_file" ]; then
            				printf "${darkred} ✗ Screws Tilt Adjust Support is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to add support for Screws Tilt Adjust functionality."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Screws Tilt Adjust Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Screws Tilt Adjust Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf " Do you want install ${green}Screws Tilt Adjust Support ${white}for ${yellow}K1${white} or ${yellow}K1 Max ${white}? (${yellow}k1${white}/${yellow}k1max${white}): ${yellow}"
            			        read confirm2
            			        printf "${white}\n"
            			        while [ "$confirm2" != "k1" ] && [ "$confirm2" != "K1" ] && [ "$confirm2" != "k1max" ] && [ "$confirm2" != "K1MAX" ]; do
                                    printf "${darkred} ✗ Please select a correct choice!"
                                    printf "${white}\n\n"
                                    printf " Do you want install ${green}Screws Tilt Adjust Support ${white}for ${yellow}K1${white} or ${yellow}K1 Max ${white}? (${yellow}k1${white}/${yellow}k1max${white}): ${yellow}"
                                    read confirm2
                                    printf "${white}\n"
                                done
            			        if [ "$confirm2" = "k1" ] || [ "$confirm2" = "K1" ]; then
                			        printf "${green} Installing Screws Tilt Adjust Support for K1..."
                			        printf "${white}\n\n"
                			        printf "Downloading Screws Tilt Adjust Support files...\n"
                			        if [ -f "$klipper_extra_folder"screws_tilt_adjust.py ]; then
                			            rm -rf "$klipper_extra_folder"screws_tilt_adjust.py "$klipper_extra_folder"screws_tilt_adjust.pyc
                			        fi
                			        /tmp/curl -s -L "$screwsadjust_URL1" -o "$klipper_extra_folder"screws_tilt_adjust.py
                			        if [ $? -eq 0 ]; then
                			            if [ -f "$helper_script"/screws-tilt-adjust.cfg ]; then
                                            rm -f "$helper_script"/screws-tilt-adjust.cfg
                                        fi
                                        if [ ! -d "$helper_script" ]; then
                			                mkdir -p "$helper_script"
                			            fi
                			            /tmp/curl -s -L "$screwsadjust_URL2" -o "$helper_script"/screws-tilt-adjust.cfg
                			                if [ $? -eq 0 ]; then
                			                    if grep -q "include Helper-Script/screws-tilt-adjust" "$printer_config" ; then
                                                    printf "Screws Tilt Adjust Support configurations are already enabled in printer.cfg file.\n"
                                                else
                                                    printf "Adding Screws Tilt Adjust Support configurations in printer.cfg file...\n"
                                                    sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/screws-tilt-adjust\.cfg\]' "$printer_config"
                                                fi
                			                    printf "Restarting services...\n"
                			                    /etc/init.d/S55klipper_service restart
                			                    printf "\n"
                			                    printf "${green} ✓ Screws Tilt Adjust Support for ${yellow}K1 ${green}has been installed successfully!"
                			                    printf "${white}\n\n"
                			                else
                			                    rm -rf "$klipper_extra_folder"screws_tilt_adjust.py "$klipper_extra_folder"screws_tilt_adjust.pyc 2>/dev/null
                			                    rmdir "$helper_script" 2>/dev/null
                			                    printf "${white}\n\n"
                			                    printf "${darkred} ✗ Download failed!"
                			                    wait
                			                    printf "${white}\n\n"
                			                fi
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
            			        elif [ "$confirm2" = "k1max" ] || [ "$confirm2" = "K1MAX" ]; then
                			        printf "${green} Installing Screws Tilt Adjust Support for K1 Max..."
                			        printf "${white}\n\n"
                			        printf "Downloading Screws Tilt Adjust Support files...\n"
                			        if [ -f "$klipper_extra_folder"screws_tilt_adjust.py ]; then
                			            rm -rf "$klipper_extra_folder"screws_tilt_adjust.py "$klipper_extra_folder"screws_tilt_adjust.pyc
                			        fi
                			        /tmp/curl -s -L "$screwsadjust_URL1" -o "$klipper_extra_folder"screws_tilt_adjust.py
                			        if [ $? -eq 0 ]; then
                                        if [ -f "$helper_script"/screws-tilt-adjust.cfg ]; then
                                            rm -f "$helper_script"/screws-tilt-adjust.cfg
                                        fi
                                        if [ ! -d "$helper_script" ]; then
                			                mkdir -p "$helper_script"
                			            fi
                			            /tmp/curl -s -L "$screwsadjust_URL3" -o "$helper_script"/screws-tilt-adjust.cfg
                			                if [ $? -eq 0 ]; then
                			                    if grep -q "include Helper-Script/screws-tilt-adjust" "$printer_config" ; then
                                                    printf "Screws Tilt Adjust Support configurations are already enabled in printer.cfg file.\n"
                                                else
                                                    printf "Adding Screws Tilt Adjust Support configurations in printer.cfg file...\n"
                                                    sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/screws-tilt-adjust\.cfg\]' "$printer_config"
                                                fi
                			                    printf "Restarting services...\n"
                			                    /etc/init.d/S55klipper_service restart
                			                    printf "\n"
                			                    printf "${green} ✓ Screws Tilt Adjust Support for ${yellow}K1 Max ${green}has been installed successfully!"
                			                    printf "${white}\n\n"
                			                else
                			                    rm -rf "$klipper_extra_folder"screws_tilt_adjust.py "$klipper_extra_folder"screws_tilt_adjust.pyc 2>/dev/null
                			                    rmdir "$helper_script" 2>/dev/null
                			                    printf "${white}\n\n"
                			                    printf "${darkred} ✗ Download failed!"
                			                    wait
                			                    printf "${white}\n\n"
                			                fi
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
            			        fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled! ${white}\n\n"
            			    fi
            			fi
                        ;;
                    17)
            			if [ -f "$timelapse_file" ]; then
            				printf "${darkred} ✗ Moonraker Timelapse is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f "$entware_file" ]; then
            				printf "${darkred} ✗ Please install Entware first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Moonraker Timelapse is a 3rd party Moonraker component"
            			    printf "\n"
            			    printf " to create timelapse of 3D prints."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Moonraker Timelapse ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Moonraker Timelapse ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Installing Moonraker Timelapse..."
            			        printf "${white}\n\n"
                			    printf "Downloading Moonraker Timelapse files...\n"
                			    /tmp/curl -s -L "$timelapse_URL1" -o "$timelapse_file"
                			    if [ $? -eq 0 ]; then
                			        if [ -f "$helper_script"/timelapse.cfg ]; then
                			            rm -f "$helper_script"/timelapse.cfg
                			        fi
                			        if [ ! -d "$helper_script" ]; then
                			            mkdir -p "$helper_script"
                			        fi
                			        /tmp/curl -s -L "$timelapse_URL2" -o "$helper_script"/timelapse.cfg
                			        if [ $? -eq 0 ]; then
                			            if grep -q "include Helper-Script/timelapse" "$printer_config" ; then
                                            printf "Moonraker Timelapse configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Moonraker Timelapse configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/timelapse\.cfg\]' "$printer_config"
                                        fi
                                        if grep -q "#\[timelapse\]" "$moonraker_config" ; then
                                            printf "Enabling Moonraker Timelapse configurations in moonraker.conf file...\n"
                                            sed -i -e 's/^\s*#[[:space:]]*\[timelapse\]/[timelapse]/' -e '/^\[timelapse\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$moonraker_config"
                                        else
                                            printf "Moonraker Timelapse configurations are already enabled in moonraker.conf file.\n"
                                        fi
                                        printf "Updating ffmpeg...\n"
                                        /opt/bin/opkg update && /opt/bin/opkg upgrade ffmpeg
                			            printf "Restarting services...\n"
                			            /etc/init.d/S55klipper_service restart
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            printf "\n"
                			            printf "${green} ✓ Moonraker Timelapse has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            rmdir "$helper_script" 2>/dev/null
                			            rm -rf "$timelapse_file" /usr/data/moonraker/moonraker/moonraker/components/timelapse.pyc
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    18)
            			if [ -f "$camera_file" ]; then
            				printf "${darkred} ✗ Camera Settings Control is already installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ $K1 -eq 0 ]; then
                            printf "${darkred} ✗ This feature is not compatible with your printer."
                            wait
                            printf "${white}\n\n"
            		    elif v4l2-ctl --list-devices | grep -q 'CCX2F3299'; then
            		        printf "${darkred} ✗ You have the new hardware version of the camera and it's not compatible!"
            		        wait
            				printf "${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} ✗ Please install Klipper Gcode Shell Command first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to install macros needed to control camera settings."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Camera Settings Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Camera Settings Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Camera Settings Control..."
                			    printf "${white}\n\n"
                			    if [ -f "$helper_script"/camera-settings.cfg ]; then
                			        rm -f "$helper_script"/camera-settings.cfg
                			    fi
                			    if [ ! -d "$helper_script" ]; then
                			        mkdir -p "$helper_script"
                			    fi
                			    printf "Downloading Camera Settings Control file...\n"
                			    /tmp/curl -s -L "$camera_URL" -o "$camera_file"
                			    if [ $? -eq 0 ]; then
                			        if grep -q "include Helper-Script/camera-settings" "$printer_config" ; then
                                        printf "Camera Settings configurations are already enabled in printer.cfg file.\n"
                                    else
                                        printf "Adding Camera Settings configurations in printer.cfg file...\n"
                                        sed -i '/\[include printer_params\.cfg\]/a \[include Helper-Script/camera-settings\.cfg\]' "$printer_config"
                                    fi
                			        printf "Restarting services...\n"
                			        /etc/init.d/S55klipper_service restart
                			        printf "\n"
                			        printf "${green} ✓ Camera Settings Control has been installed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        rmdir "$helper_script" 2>/dev/null
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    19)
						if [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} ✗ Please install Moonraker and Nginx first!"
            				wait
            				printf "${white}\n\n"
						elif [ ! -d "$fluidd_folder" ] && [ ! -d "$mainsail_folder" ]; then
            				printf "${darkred} ✗ Please install Fluidd and/or Mainsail first!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f "$entware_file" ]; then
            				printf "${darkred} ✗ Please install Entware first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Cloud empower your Klipper printers with free, private,"
            			    printf "\n"
            			    printf " and unlimited remote access to your full web control portal from anywhere!"
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}OctoEverywhere ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}OctoEverywhere ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing OctoEverywhere..."
                			    printf "${white}\n\n"
                			    cd /usr/data
								if [ -d "$octoeverywhere_folder" ]; then
									printf "OctoEverywhere is already installed. Download skipped."
								else
                			    	printf "Downloading OctoEverywhere for Klipper..."
                			    	git clone $octoeverywhere_URL octoeverywhere
								fi
                			    cd octoeverywhere
                			    printf "Running the OctoEverywhere installer..."
								sh ./install.sh
                			    printf "\n"
                			    printf "${green} ✓ OctoEverywhere has been installed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    20)
            			if [ ! -d "$moonraker_folder" ]; then
            				printf "${darkred} ✗ Please install Moonraker and Nginx first!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f "$entware_file" ]; then
            				printf "${darkred} ✗ Please install Entware first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Obico is a Moonraker plugin that allows you to monitor"
            			    printf "\n"
            			    printf " and control your 3D printer from anywhere."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Obico ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Obico ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Obico..."
                			    printf "${white}\n\n"
                			    cd /usr/data
								if [ -d "$moonraker_obico_folder" ]; then
                			        printf "Obico is already installed. Download skipped."
                			    else
                			        printf "Downloading Obico..."
                			        git clone $moonraker_obico_URL moonraker-obico
                			    fi
                			    cd moonraker-obico
                			    printf "Installing dependencies and configuring Obico..."
                			    sh ./scripts/install_creality.sh -k
                			    printf "\n"
                			    printf "${green} ✓ Obico has been installed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    21)
            			if [ -d "$mobileraker_folder" ]; then
            				printf "${darkred} ✗ Mobileraker Companion is already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Mobileraker Companion allows to push notification"
            			    printf "\n"
            			    printf " for Klipper using Moonraker for Mobileraker phone App."
            			    printf "${white}\n\n"
            			    printf " Are you sure you want to install ${green}Mobileraker Companion ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Mobileraker Companion ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Installing Mobileraker Companion..."
                			    printf "${white}\n\n"
                			    cd /usr/data
                			    printf "Installing prerequisite python packages...\n"
                			    pip3 install requests websockets pytz coloredlogs
                			    printf "Downloading Mobileraker Companion...\n"
                			    git clone --depth 1 "$mobileraker_URL1"
                			    if [ $? -eq 0 ]; then
                			        cd mobileraker_companion
                			        printf "Downloading K1 compatibility patches...\n"
                			        /tmp/curl -s -L "$mobileraker_URL2" -o mobileraker-companion-k1-no-tzlocal.patch
                			        if [ $? -eq 0 ]; then
                			            printf "Applying K1 compatibility patches...\n"
                			            patch -p1 < mobileraker-companion-k1-no-tzlocal.patch
                			            printf "Adding startup script...\n"
                			            cp S80mobileraker_companion /etc/init.d/S80mobileraker_companion
                			            chmod 755 /etc/init.d/S80mobileraker_companion
                			            if grep -q -v "mobileraker_companion" "/usr/data/printer_data/moonraker.asvc"; then
                                            printf "Adding Mobileraker Companion to Moonraker services file...\n"
                                            sed -i '/mobileraker_companion/!{ $a\mobileraker_companion' "/usr/data/printer_data/moonraker.asvc"
                                        else
                                            printf "Mobileraker Companion is already added to Moonraker services file...\n"
                                        fi
                			            printf "Restarting services...\n"
                			            /etc/init.d/S80mobileraker_companion restart
                			            /etc/init.d/S55klipper_service restart
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            printf "\n"
                			            printf "${green} ✓ Mobileraker Companion has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            rm -rf /usr/data/mobileraker_companion 2>/dev/null
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
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
            			if [ ! -d "$moonraker_folder" ] && [ ! -d "$nginx_folder" ]; then
            				printf "${darkred} ✗ Moonraker and Nginx are not installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker and Nginx ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n";
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Moonraker and Nginx ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "${green} Removing Moonraker and Nginx..."
                			    printf "${white}\n\n"
                			    printf "Stopping services...\n"
                			    cd /overlay/upper
                			    /etc/init.d/S50nginx stop
                			    /etc/init.d/S56moonraker_service stop
                			    printf "Removing files...\n"
                			    rm -rf /etc/init.d/S50nginx /etc/init.d/S56moonraker_service
                			    rm -rf /usr/data/printer_data/config/moonraker.conf /usr/data/printer_data/config/.moonraker.conf.bkp /usr/data/printer_data/.moonraker.uuid /usr/data/printer_data/moonraker.asvc /usr/data/nginx /usr/data/moonraker
                			    printf "\n"
                			    printf "${green} ✓ Moonraker and Nginx }have been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    2)
            			if [ ! -d "$fluidd_folder" ]; then
            				printf "${darkred} ✗ Fluidd is not installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f "$crealityweb_file" ]; then
            			    printf "${darkred} ✗ Creality Web Interface is removed!"
            			    printf "\n"
            			    printf "${darkred} If you want to remove Fluidd please restore Creality Web Interface first."
            			    wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n";
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf " ${darkred}✗ Please select a correct choice! ${white}\n\n"
                                printf " Are you sure you want to remove ${green}Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Fluidd..."
                			    printf "${white}\n\n"
                                printf "Removing files...\n"
                			    rm -rf /usr/data/fluidd
                			    if grep -q "\[update_manager fluidd\]" "$moonraker_config" ; then
                                    printf "Disabling Fluidd configurations in moonraker.conf file...\n"
                                    sed -i '/^\[update_manager fluidd\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$moonraker_config"
                                    printf "Restarting services...\n"
                                    /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                                else
                                    printf "Fluidd configurations are already disabled in moonraker.conf file.\n"
                                fi
                			    printf "\n"
                			    printf "${green} ✓ Fluidd has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
            			if [ ! -d "$mainsail_folder" ]; then
                			printf "${darkred} ✗ Mainsail is not installed!"
                			wait
                			printf "${white}\n\n"
            			elif [ ! -f "$crealityweb_file" ]; then
            			    printf "${darkred} ✗ Creality Web Interface is removed!"
            			    printf "\n"
            			    printf "${darkred} If you want to remove Mainsail please restore Creality Web Interface first."
            			    wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mainsail ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Mainsail ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Mainsail..."
                			    printf "${white}\n\n"
                                printf "Removing files...\n"
                			    rm -rf /usr/data/mainsail
                			    if grep -q "\[update_manager mainsail\]" "$moonraker_config" ; then
                                    printf "Disabling Mainsail configurations in moonraker.conf file...\n"
                                    sed -i '/^\[update_manager mainsail\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$moonraker_config"
                                    printf "Restarting services...\n"
                                    /etc/init.d/S50nginx restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                			        /etc/init.d/S56moonraker_service restart
                			        sleep 1
                                else
                                    printf "Mainsail configurations are already disabled in moonraker.conf file.\n"
                                fi
                			    printf "\n"
                			    printf "${green} ✓ Mainsail has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    4)
                        printf " Are you sure you want to remove ${green}Entware${white}, it will also remove all installed packages ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			read confirm
            			printf "${white}\n"
            			while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Are you sure you want to remove ${green}Entware${white}, it will also remove all installed packages ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
            			if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			    printf "${green} Removing Entware..."
                			printf "${white}\n\n"
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
                            rm -f /etc/profile.d/entware.sh
                            sed -i 's/\/opt\/bin:\/opt\/sbin:\/bin:/\/bin:/' /etc/profile
                            printf "\n"
            			    printf "${green} ✓ Entware has been removed successfully!"
            			    printf "${white}\n\n"
            			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			printf "${darkred} ✗ Deletion canceled!"
                			printf "${white}\n\n"
            			fi
                        ;;
					5)
            			if [ ! -f "$shellcommand_file" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is not installed!"
            				wait
            				printf "${white}\n\n"
            			elif [ -f "$buzzer_file" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is needed to use Buzzer Support, please uninstall it first!"
            				wait
            				printf "${white}\n\n"
            			elif [ -f "$camera_file" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is needed to use Camera Settings Control, please uninstall it first!"
            				wait
            				printf "${white}\n\n"
            			elif [ -d "$guppyscreen_folder" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is needed to use Guppy Screen, please uninstall it first!"
            				wait
            				printf "${white}\n\n"
            			elif [ -d "$shaperconfig_folder" ]; then
            				printf "${darkred} ✗ Klipper Gcode Shell Command is needed to use Improved Shapers Calibrations, please uninstall it first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Klipper Gcode Shell Command ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Klipper Gcode Shell Command ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Klipper Gcode Shell Command..."
                			    printf "${white}\n\n"
            			        printf "Removing file...\n"
                			    rm -rf "$klipper_extra_folder"gcode_shell_command.py "$klipper_extra_folder"gcode_shell_command.pyc
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Klipper Gcode Shell Command has been removed successfully!"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
            			;;
                    6)
            			if [ ! -f "$hostname_file" ]; then
            				printf "${darkred} ✗ Hostname Service is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Hostname Service ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Hostname Service ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Hostname Service..."
                			    printf "${white}\n\n"
            			        printf "Removing file...\n"
                			    rm -f /etc/init.d/S01hostname
                			    printf "\n"
                			    printf "${green} ✓ Hostname Service has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
            			;;
            		7)
            			if [ ! -f "$supervisor_file" ]; then
            				printf "${darkred} ✗ Supervisor Lite is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Supervisor Lite ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Supervisor Lite ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Supervisor Lite..."
                			    printf "${white}\n\n"
                			    printf "Removing files...\n"
                			    rm -f "$supervisor_file"
                			    if grep -q "provider: supervisord_cli" "$moonraker_config" && ! grep -q "provider: none" "$moonraker_config"; then
                                    printf "Replacing provider in moonraker.conf file...\n"
                                    sed -i 's/provider: supervisord_cli/provider: none/' "$moonraker_config"
                                else
                                    printf "Provider is already replaced in moonraker.conf file.\n"
                                fi
                                if grep -q "managed_services: klipper" "$moonraker_config" && ! grep -q "is_system_service: False" "$moonraker_config"; then
                                    printf "Replacing managed services in moonraker.conf file...\n"
                                    sed -i 's/managed_services: klipper/is_system_service: False/' "$moonraker_config"
                                else
                                    printf "Managed services are already replaced in moonraker.conf file.\n"
                                fi
                                printf "Restarting services...\n"
                			    /etc/init.d/S56moonraker_service restart
                                sleep 1
                                /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Supervisor Lite has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
            		8)
            			if [ ! -f "$systemctl_file" ] && [ ! -f "$sudo_file" ]; then
            				printf "${darkred} ✗ Host Controls Support is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Host Controls Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Host Controls Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Host Controls Support..."
                			    printf "${white}\n\n"
                			    printf "Removing files...\n"
                			    rm -f /usr/bin/sudo /usr/bin/systemctl
                			    printf "\n"
                			    printf "${green} ✓ Host Controls Support has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    9)
            			if [ ! -d "$kamp_folder" ]; then
            				printf "${darkred} ✗ Klipper Adaptive Meshing & Purging is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Klipper Adaptive Meshing & Purging ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Klipper Adaptive Meshing & Purging ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Klipper Adaptive Meshing & Purging..."
                			    printf "${white}\n\n"
                                printf "Removing files...\n"
                			    rm -rf "$kamp_folder" "$helper_script"/KAMP "$helper_script"/KAMP_Settings.cfg
                			    if grep -q "include Helper-Script/KAMP_Settings" "$printer_config" ; then
                                    printf "Removing KAMP configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/KAMP_Settings\.cfg/d' "$printer_config"
                                else
                                    printf "KAMP configurations are already removed in printer.cfg file.\n"
                                fi
                                if grep -q "enable_object_processing: True" "$moonraker_config" && ! grep -q "enable_object_processing: False" "$moonraker_config"; then
                                    printf "Disabling object processing in moonraker.conf file...\n"
                                    sed -i 's/enable_object_processing: True/enable_object_processing: False/' "$moonraker_config"
                                else
                                    printf "Object processing is already disabled in moonraker.conf file.\n"
                                fi
                                if grep -q "\[update_manager KAMP-for-K1-Series\]" "$moonraker_config" ; then
                                    printf "Disabling KAMP configurations in moonraker.conf file...\n"
                                    sed -i '/^\[update_manager KAMP-for-K1-Series\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$moonraker_config"
                                else
                                    printf "KAMP configurations are already disabled in moonraker.conf file.\n"
                                fi
                                if grep -q "#\[gcode_macro START_PRINT\]" "$macro_config" ; then
                                    printf "Enabling [gcode_macro START_PRINT] in gcode_macro.cfg file...\n"
                                    sed -i -e 's/^\s*#[[:space:]]*\[gcode_macro START_PRINT\]/[gcode_macro START_PRINT]/' -e '/^\[gcode_macro START_PRINT\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$macro_config"
                                else
                                    printf "[gcode_macro START_PRINT] is already enabled in gcode_macro.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                                /etc/init.d/S56moonraker_service restart
                                sleep 1
                                /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Klipper Adaptive Meshing & Purging has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
                			fi
           				fi
                        ;;
					10)
            			if [ ! -f "$buzzer_file" ]; then
            				printf "${darkred} ✗ Buzzer Support is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Buzzer Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Buzzer Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Buzzer Support..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -rf "$buzzer_file" "$helper_script"/buzzer-support.cfg
                			    if grep -q "include Helper-Script/buzzer-support" "$printer_config" ; then
                                    printf "Removing Buzzer Support configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/buzzer-support\.cfg/d' "$printer_config"
                                else
                                    printf "Buzzer Support configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Buzzer Support has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
					11)
            			if [ ! -d "$prtouch_folder" ]; then
            				printf "${darkred} ✗ Nozzle Cleaning Fan Control is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Nozzle Cleaning Fan Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Nozzle Cleaning Fan Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Nozzle Cleaning Fan Control..."
                			    printf "${white}\n\n"
            			        printf "Removing files...\n"
                			    rm -rf "$prtouch_folder" "$helper_script"/nozzle-cleaning-fan-control.cfg
                			    if grep -q "include Helper-Script/nozzle-cleaning-fan-control" "$printer_config" ; then
                                    printf "Removing Nozzle Cleaning Fan Control configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/nozzle-cleaning-fan-control\.cfg/d' "$printer_config"
                                else
                                    printf "Nozzle Cleaning Fan Control configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Nozzle Cleaning Fan Control has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    12)
            			if [ ! -f "$fancontrols_file" ]; then
            				printf "${darkred} ✗ Fans Control Macros are not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Fans Control Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Fans Control Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Fans Control Macros..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -f "$helper_script"/fans-control.cfg
                			    if grep -q "include Helper-Script/fans-control" "$printer_config" ; then
                                    printf "Removing Fans Control Macros configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/fans-control\.cfg/d' "$printer_config"
                                else
                                    printf "Fans Control Macros configurations are already removed in printer.cfg file.\n"
                                fi
                                if grep -q "#\[duplicate_pin_override\]" "$printer_config" ; then
                                    printf "Enabling [duplicate_pin_override] in printer.cfg file...\n"
                                    sed -i -e 's/^\s*#[[:space:]]*\[duplicate_pin_override\]/[duplicate_pin_override]/' -e '/^\[duplicate_pin_override\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$printer_config"
                                else
                                    printf "[duplicate_pin_override] is already enabled in printer.cfg file.\n"
                                fi
                                if grep -q "#\[temperature_fan chamber_fan\]" "$printer_config" ; then
                                    printf "Enabling [temperature_fan chamber_fan] in printer.cfg file...\n"
                                    sed -i -e 's/^\s*#[[:space:]]*\[temperature_fan chamber_fan\]/[temperature_fan chamber_fan]/' -e '/^\[temperature_fan chamber_fan\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$printer_config"
                                else
                                    printf "[temperature_fan chamber_fan] is already enabled in printer.cfg file.\n"
                                fi
                                if grep -q "#\[gcode_macro M106\]" "$macro_config" ; then
                                    printf "Enabling [gcode_macro M106] in gcode_macro.cfg file...\n"
                                    sed -i -e 's/^\s*#[[:space:]]*\[gcode_macro M106\]/[gcode_macro M106]/' -e '/^\[gcode_macro M106\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$macro_config"
                                else
                                    printf "[gcode_macro M106] is already enabled in gcode_macro.cfg file.\n"
                                fi
                                if grep -q "#\[gcode_macro M141\]" "$macro_config" ; then
                                    printf "Enabling [gcode_macro M141] in gcode_macro.cfg file...\n"
                                    sed -i -e 's/^\s*#[[:space:]]*\[gcode_macro M141\]/[gcode_macro M141]/' -e '/^\[gcode_macro M141\]/,/^\s*$/ s/^\(\s*\)#/\1/' "$macro_config"
                                else
                                    printf "[gcode_macro M141] is already enabled in gcode_macro.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Fans Control Macros have been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    13)
            			if [ ! -d "$shaperconfig_folder" ]; then
                			printf "${darkred} ✗ Improved Shapers Calibrations are not installed!"
                			wait
                			printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Improved Shapers Calibrations ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Improved Shapers Calibrations ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Improved Shapers Calibrations..."
                			    printf "${white}\n\n"
                                printf "Restoring files...\n"
                			    cp -f "$shaperconfig_folder"backup/ft2font.cpython-38-mipsel-linux-gnu.so /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so
                			    printf "Removing files...\n"
                                rm -rf "$shaperconfig_folder" "$helper_script"/shapers-configs "$klipper_extra_folder"calibrate_shaper_config.py "$klipper_extra_folder"calibrate_shaper_config.pyc
                                if grep -q "#variable_autotune_shapers:" "$macro_config"; then
                                    printf "Enabling stock configuration in gcode_macro.cfg file...\n"
                                    sed -i 's/#variable_autotune_shapers:/variable_autotune_shapers:/' "$macro_config"
                                else
                                    printf "Stock configuration is already enabled in gcode_macro.cfg file.\n"
                                fi
                                if grep -q '\[gcode_macro INPUTSHAPER\]' "$macro_config" ; then
                                    sed -i 's/SHAPER_CALIBRATE/SHAPER_CALIBRATE AXIS=y/' "$macro_config"
                                    printf "Restoring stock configuration in gcode_macro.cfg file...\n"
                                else
                                    printf "Stock configuration is already restored in gcode_macro.cfg file.\n"
                                fi
                                if grep -q "include Helper-Script/shapers-configs/shapers-configs" "$printer_config" ; then
                                    printf "Removing Improved Shapers Calibrations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/shapers-configs\/shapers-configs\.cfg/d' "$printer_config"
                                else
                                    printf "Improved Shapers Calibrations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Improved Shapers Calibrations have been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    14)
            			if [ ! -f "$usefullmacros_file" ]; then
            				printf "${darkred} ✗ Usefull Macros are not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Usefull Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Usefull Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Usefull Macros..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -f "$helper_script"/usefull-macros.cfg
                			    if grep -q "include Helper-Script/usefull-macros" "$printer_config" ; then
                                    printf "Removing Usefull Macros configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/usefull-macros\.cfg/d' "$printer_config"
                                else
                                    printf "Usefull Macros configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Usefull Macros have been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    15)
            			if [ ! -f "$savezoffset_file" ]; then
            				printf "${darkred} ✗ Save Z-Offset Macros are not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Save Z-Offset Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Save Z-Offset Macros ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Save Z-Offset Macros..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -f "$helper_script"/save-zoffset.cfg "$helper_script"/variables.cfg
                			    if grep -q "include Helper-Script/save-zoffset" "$printer_config" ; then
                                    printf "Removing Save Z-Offset Macros configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/save-zoffset\.cfg/d' "$printer_config"
                                else
                                    printf "Save Z-Offset Macros configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Save Z-Offset Macros have been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    16)
            			if [ ! -f "$screwsadjust_file" ]; then
            				printf "${darkred} ✗ Screws Tilt Adjust Support is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Screws Tilt Adjust Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Screws Tilt Adjust Support ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Screws Tilt Adjust Support files..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -f "$helper_script"/screws-tilt-adjust.cfg
                			    if grep -q "include Helper-Script/screws-tilt-adjust" "$printer_config" ; then
                                    printf "Removing Screws Tilt Adjust Support configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/screws-tilt-adjust\.cfg/d' "$printer_config"
                                else
                                    printf "Screws Tilt Adjust Support configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Screws Tilt Adjust Support has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    17)
            			if [ ! -f "$timelapse_file" ]; then
                			printf "${darkred} ✗ Moonraker Timelapse is not installed!"
                			wait
                			printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Moonraker Timelapse ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Moonraker Timelapse ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Moonraker Timelapse..."
                			    printf "${white}\n\n"
                                printf "Removing files...\n"
                			    rm -f "$helper_script"/timelapse.cfg
                			    rm -f /usr/data/moonraker/moonraker/moonraker/components/timelapse.py
                			    rm -f /usr/data/moonraker/moonraker/moonraker/components/timelapse.pyc
                			    if [ -f /opt/bin/ffmpeg ]; then
                			        /opt/bin/opkg remove ffmpeg
                			    fi
                			    if grep -q "include Helper-Script/timelapse" "$printer_config" ; then
                                    printf "Removing Moonraker Timelapse configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/timelapse\.cfg/d' "$printer_config"
                                else
                                    printf "Moonraker Timelapse configurations are already removed in printer.cfg file.\n"
                                fi
                                if grep -q "\[timelapse\]" "$moonraker_config" ; then
                                    printf "Disabling Moonraker Timelapse configurations in moonraker.conf file...\n"
                                    sed -i '/^\[timelapse\]/,/^\s*$/ s/^\(\s*\)\([^#]\)/#\1\2/' "$moonraker_config"
                                else
                                    printf "Moonraker Timelapse configurations are already disabled in moonraker.conf file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Moonraker Timelapse has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    18)
            			if [ ! -f "$camera_file" ]; then
            				printf "${darkred} ✗ Camera Settings Control is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
                            printf " Are you sure you want to remove ${green}Camera Settings Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Camera Settings Control ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Camera Settings Control..."
                			    printf "${white}\n\n"
                			    printf "Removing file...\n"
                			    rm -f "$helper_script"/camera-settings.cfg
                			    if grep -q "include Helper-Script/camera-settings" "$printer_config" ; then
                                    printf "Removing Camera Settings configurations in printer.cfg file...\n"
                                    sed -i '/include Helper-Script\/camera-settings\.cfg/d' "$printer_config"
                                else
                                    printf "Camera Settings configurations are already removed in printer.cfg file.\n"
                                fi
                                rmdir "$helper_script" 2>/dev/null
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    printf "\n"
                			    printf "${green} ✓ Camera Settings Control has been removed successfully!"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
					19)
            			if [ ! -d "$octoeverywhere_folder" ]; then
            				printf "${darkred} ✗ OctoEverywhere is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}OctoEverywhere ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}OctoEverywhere ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing OctoEverywhere..."
                			    printf "${white}\n\n"
								cd $octoeverywhere_folder
								printf "Running the OctoEverywhere uninstaller..."
								sh ./uninstall.sh
                			    printf "${green} ✓ OctoEverywhere has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    20)
            			if [ ! -d "$moonraker_obico_folder" ]; then
                			printf "${darkred} ✗ Obico is not installed!"
                			wait
                			printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Obico ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Obico ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Obico..."
                			    printf "${white}\n\n"
                                printf "Removing files...\n"
                			    rm -rf $moonraker_obico_folder
                			    rm -rf /usr/data/moonraker-obico-env
                			    printf "Removing service file...\n"
                    			rm -f /etc/init.d/S99moonraker_obico
                    			if grep -q "include moonraker_obico_macros" "$printer_config" ; then
                                    printf "Removing Obico configurations in printer.cfg file...\n"
                                    sed -i '/include moonraker_obico_macros\.cfg/d' "$printer_config"
                                else
                                    printf "Obico configurations are already removed in printer.cfg file.\n"
                                fi
                                if grep -q "\[include moonraker-obico-update.cfg\]" "$moonraker_config" ; then
                                    printf "Removing Obico configurations in moonraker.conf file...\n"
                                    sed -i '/include moonraker-obico-update\.cfg/d' "$moonraker_config"
                                else
                                    printf "Obico configurations are already removed in moonraker.conf file.\n"
                                fi
                    			printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Obico has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    21)
            			if [ ! -d "$mobileraker_folder" ]; then
            				printf "${darkred} ✗ Mobileraker Companion is not installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Mobileraker Companion ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Mobileraker Companion ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Mobileraker Companion..."
                			    printf "${white}\n\n"
                			    printf "Stopping services...\n"
                			    /etc/init.d/S80mobileraker_companion stop
                			    printf "Removing files...\n"
                			    if grep -q "mobileraker_companion" "/usr/data/printer_data/moonraker.asvc"; then
                                    printf "Removing Mobileraker Companion from Moonraker services file...\n"
                                    sed -i "/mobileraker_companion/d" "/usr/data/printer_data/moonraker.asvc"
                                else
                                    printf "Mobileraker Companion is already removed from Moonraker services files...\n"
                                fi
                			    rm -rf /etc/init.d/S80mobileraker_companion /usr/data/mobileraker_companion
                			    printf "Removing dependencies...\n"
                			    pip3 uninstall -y requests websockets pytz coloredlogs
                			    printf "Restarting services...\n"
                			    /etc/init.d/S55klipper_service restart
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    printf "\n"
                			    printf "${green} ✓ Mobileraker Companion has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
            		;;
                esac
            done
            ;;
        3)
            while [ 1 ]
            do
                customize_menu
                case $opt_customize_menu in
                    1)
            			if [ ! -d "$bootdisplay_folder" ]; then
            				printf "${darkred} ✗ Please use latest firmware to install Custom Boot Display!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to install a custom Creality-themed boot display."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Custom Boot Display ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Custom Boot Display ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf " Do you want install ${green}Custom Boot Display ${white}for ${yellow}K1${white} or ${yellow}K1 Max ${white}? (${yellow}k1${white}/${yellow}k1max${white}): ${yellow}"
            			        read confirm2
            			        printf "${white}\n"
            			        while [ "$confirm2" != "k1" ] && [ "$confirm2" != "K1" ] && [ "$confirm2" != "k1max" ] && [ "$confirm2" != "K1MAX" ]; do
                                    printf "${darkred} ✗ Please select a correct choice!"
                                    printf "${white}\n\n"
                                    printf " Do you want install ${green}Custom Boot Display ${white}for ${yellow}K1${white} or ${yellow}K1 Max ${white}? (${yellow}k1${white}/${yellow}k1max${white}): ${yellow}"
                                    read confirm2
                                    printf "${white}\n"
                                done
            			        if [ "$confirm2" = "k1" ] || [ "$confirm2" = "K1" ]; then
                			        printf "${green} Installing Custom Boot Display for K1..."
                			        printf "${white}\n\n"
                			        cd /etc/boot-display
                			        printf "Downloading Custom Boot Display file... Please wait...\n"
                			        /tmp/curl -s -L "$bootdisplay_URL1" -o k1_boot_display.tar
                			        if [ $? -eq 0 ]; then
                			            printf "Copying files...\n"
                			            rm -rf part0 boot-display.conf
                			            tar -xvf k1_boot_display.tar
                			            rm -f k1_boot_display.tar
                			            printf "\n"
                			            printf "${green} ✓ Custom Boot Display for ${yellow}K1 ${green}has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
            			        elif [ "$confirm2" = "k1max" ] || [ "$confirm2" = "K1MAX" ]; then
                			        printf "${green} Installing Custom Boot Display for K1 Max..."
                			        printf "${white}\n\n"
                			        cd /etc/boot-display
                			        printf "Downloading Custom Boot Display file... Please wait...\n"
                			        /tmp/curl -s -L "$bootdisplay_URL2" -o k1max_boot_display.tar
                			        if [ $? -eq 0 ]; then
                			            printf "Copying files...\n"
                			            rm -rf part0 boot-display.conf
                			            tar -xvf k1max_boot_display.tar
                			            rm -f k1max_boot_display.tar
                			            printf "\n"
                			            printf "${green} ✓ Custom Boot Display for ${yellow}K1 Max ${green}has been installed successfully!"
                			            printf "${white}\n\n"
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
            			        fi
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled! ${white}\n\n"
            			    fi
            			fi
                        ;;
            	    2)
            			if [ ! -d "$bootdisplay_folder" ]; then
            				printf "${darkred} ✗ Please use latest firmware to restore Stock Boot Display!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to restore stock boot display."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to remove ${green}Custom Boot Display ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Custom Boot Display ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Removing Custom Boot Display..."
                			    printf "${white}\n\n"
                			    cd /etc/boot-display
                			    printf "Downloading Stock Boot Display file... Please wait...\n"
                			    /tmp/curl -s -L "$bootdisplay_URL3" -o stock_boot_display.tar
                                if [ $? -eq 0 ]; then
                                    printf "Copying files...\n"
                			        rm -rf part0 boot-display.conf
                			        tar -xvf stock_boot_display.tar
                			        rm -f stock_boot_display.tar
                			        printf "\n"
                			        printf "${green} ✓ Custom Boot Display has been removed successfully!"
                			        printf "${white}\n\n"
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    3)
            			if [ ! -d "$fluidd_folder" ] && [ ! -d "$mainsail_folder" ]; then
            				printf "${darkred} ✗ Please install Fluidd and/or Mainsail first!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f "$crealityweb_file" ]; then
            			    printf "${darkred} ✗ Creality Web Interface is already removed!"
            			    printf "\n"
            			    printf "${darkred} If you want to change the default Web Interface please restore Creality Web Interface first."
            			    wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to remove Creality Web Interface"
            			    printf "\n"
            			    printf " and replace it with Fluidd or Mainsail on port 80."
            			    printf "${white}\n"
            			    printf "${darkred} Note that you will no longer be able to print via WiFi with Creality Print."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to remove ${green}Creality Web Interface ${white}? ${white}(${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Creality Web Interface ${white}? ${white}(${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        if [ -d "$fluidd_folder" ] && [ ! -d "$mainsail_folder" ]; then
            			            printf "${green} Removing Creality Web Interface..."
                			        printf "${white}\n\n"
                			        if [ -f /usr/bin/web-server ]; then
                			            mv /usr/bin/web-server /usr/bin/web-server.disabled
                			        fi
                			        if [ -f /usr/bin/Monitor ]; then
                                        mv /usr/bin/Monitor /usr/bin/Monitor.disabled
                                    fi
                                    killall -q Monitor
                                    killall -q web-server
                                    sed -i '/listen 4408 default_server;/a \        listen 80;' /usr/data/nginx/nginx/nginx.conf
                                    /etc/init.d/S50nginx restart
                                    printf "\n"
                                    printf "${green} ✓ Creality Web Interface has been removed successfully!"
                			        printf "${white}\n\n"
                			        printf " You can now connect to Fluidd Web Interface with ${yellow}http://$(check_ipaddress)"
                			        printf "${white}\n\n"
            			        elif [ ! -d "$fluidd_folder" ] && [ -d "$mainsail_folder" ]; then
            			            printf "${green} Removing Creality Web Interface..."
                			        printf "${white}\n\n"
                			        if [ -f /usr/bin/web-server ]; then
                			            mv /usr/bin/web-server /usr/bin/web-server.disabled
                			        fi
                			        if [ -f /usr/bin/Monitor ]; then
                                        mv /usr/bin/Monitor /usr/bin/Monitor.disabled
                                    fi
                			        killall -q Monitor
                                    killall -q web-server
                                    sed -i '/listen 4409 default_server;/a \        listen 80;' /usr/data/nginx/nginx/nginx.conf
                                    /etc/init.d/S50nginx restart
                                    printf "\n"
                                    printf "${green} ✓ Creality Web Interface has been removed successfully!"
                			        printf "${white}\n\n"
                			        printf " You can now connect to Mainsail Web Interface with ${yellow}http://$(check_ipaddress)"
                			        printf "${white}\n\n"
            			        elif [ -d "$fluidd_folder" ] && [ -d "$mainsail_folder" ]; then
            			            printf " Which Web Interface do you want to set as default (on port 80) ? (${yellow}fluidd${white}/${yellow}mainsail${white}): ${yellow}"
            			            read confirm2
            			            printf "${white}\n"
            			            while [ "$confirm2" != "FLUIDD" ] && [ "$confirm2" != "MAINSAIL" ] && [ "$confirm2" != "fluidd" ] && [ "$confirm2" != "mainsail" ]; do
                                        printf "${darkred} ✗ Please select a correct choice!"
                                        printf "${white}\n\n"
                                        printf " Which Web Interface do you want to set as default (on port 80) ? (${yellow}fluidd${white}/${yellow}mainsail${white}): ${yellow}"
                                        read confirm2
                                        printf "${white}\n"
                                    done
            			            if [ "$confirm2" = "fluidd" ] || [ "$confirm2" = "FLUIDD" ]; then
                			            printf "${green} Removing Creality Web Interface..."
                			            printf "${white}\n\n"
                			            if [ -f /usr/bin/web-server ]; then
                			                mv /usr/bin/web-server /usr/bin/web-server.disabled
                			            fi
                			            if [ -f /usr/bin/Monitor ]; then
                                            mv /usr/bin/Monitor /usr/bin/Monitor.disabled
                                        fi
                                        killall -q Monitor
                                        killall -q web-server
                                        sed -i '/listen 4408 default_server;/a \        listen 80;' /usr/data/nginx/nginx/nginx.conf
                                        /etc/init.d/S50nginx restart
                                        printf "\n"
                                        printf "${green} ✓ Creality Web Interface has been removed successfully!"
                			            printf "${white}\n\n"
                			            printf " You can now connect to Fluidd Web Interface with ${yellow}http://$(check_ipaddress) ${white}or ${yellow}http://$(check_ipaddress):4408"
                			            printf "${white}\n\n"
            			            elif [ "$confirm2" = "mainsail" ] || [ "$confirm2" = "MAINSAIL" ]; then
                			            printf "${green} Removing Creality Web Interface..."
                			            printf "${white}\n\n"
                			            if [ -f /usr/bin/web-server ]; then
                			                mv /usr/bin/web-server /usr/bin/web-server.disabled
                			            fi
                			            if [ -f /usr/bin/Monitor ]; then
                                            mv /usr/bin/Monitor /usr/bin/Monitor.disabled
                                        fi
                                        killall -q Monitor
                                        killall -q web-server
                                        sed -i '/listen 4409 default_server;/a \        listen 80;' /usr/data/nginx/nginx/nginx.conf
                                        /etc/init.d/S50nginx restart
                                        printf "\n"
                                        printf "${green} ✓ Creality Web Interface has been removed successfully!"
                			            printf "${white}\n\n"
                			            printf " You can now connect to Mainsail Web Interface with ${yellow}http://$(check_ipaddress) ${white}or ${yellow}http://$(check_ipaddress):4409"
                			            printf "${white}\n\n"
                			        fi
            			        fi
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled! ${white}\n\n"
            			    fi
            			fi
                        ;;
            	    4)
            			if [ -f "$crealityweb_file" ]; then
            				printf "${darkred} ✗ Creality Web Interface is already present!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows to restore Creality Web Interface on port 80."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to restore ${green}Creality Web Interface ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to restore ${green}Creality Web Interface ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Restoring Creality Web Interface..."
                			    printf "${white}\n\n"
                			    if [ -f /usr/bin/web-server.disabled ] && [ -f /etc/init.d/S99start_app ]; then
                			        mv /usr/bin/web-server.disabled /usr/bin/web-server
                			    fi
                			    if [ -f /usr/bin/Monitor.disabled ] && [ ! -d "$guppyscreen_folder" ]; then
                                    mv /usr/bin/Monitor.disabled /usr/bin/Monitor
                                fi
                                sed -i '/listen 80;/d' /usr/data/nginx/nginx/nginx.conf
                                /etc/init.d/S50nginx restart
                                killall -q Monitor
                                killall -q web-server
                                if [ -f /usr/bin/web-server.disabled ] && [ -f /etc/init.d/S99start_app ]; then
                                    /usr/bin/web-server > /dev/null 2>&1 &
                                fi
                                if [ -f /usr/bin/Monitor.disabled ] && [ ! -d "$guppyscreen_folder" ]; then
                                    /usr/bin/Monitor > /dev/null 2>&1 &
                                fi
                                printf "\n"
                                printf "${green} Creality Web Interface has been restored successfully!"
                                printf "${white}\n\n"
                			    printf " You can now connect to Creality Web Interface with ${yellow}http://$(check_ipaddress) ${white}and with ${yellow}Creality Print"
                			    printf "${white}\n\n"
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} Restoration canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    5)
            			if [ -d "$guppyscreen_folder" ]; then
            				printf "${darkred} ✗ Guppy Screen is already installed!"
            				printf "\n"
            			    printf "${darkred} If you want to change the theme please remove Guppy Screen first."
            			    wait
            				printf "${white}\n\n"
            			elif [ -d "$shaperconfig_folder" ]; then
            				printf "${darkred} Please remove Improved Shapers Calibrations before, Guppy Screen already use it!"
            				wait
            				printf "${white}\n\n"
            			elif [ ! -f /lib/ld-2.29.so ]; then
            			    printf "${darkred} Make sure you're running 1.3.x.x firmware version!"
            			    wait
            			    printf "${white}\n\n"
            			elif [ ! -f "$shellcommand_file" ]; then
            				printf " ${darkred}Please install Klipper Gcode Shell Command first!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} Guppy Screen is a touch UI for Klipper using APIs"
            			    printf "\n"
            			    printf " exposed by Moonraker. It replace Creality touch UI."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Guppy Screen ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Guppy Screen ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf " Do you want install ${green}Guppy Screen ${white}with ${yellow}Material Design${white} or ${yellow}Z-Bolt ${white}theme ? (${yellow}material${white}/${yellow}zbolt${white}): ${yellow}"
            			        read confirm2
            			        printf "${white}\n"
            			        while [ "$confirm2" != "material" ] && [ "$confirm2" != "MATERIAL" ] && [ "$confirm2" != "zbolt" ] && [ "$confirm2" != "ZBOLT" ]; do
                                    printf "${darkred} ✗ Please select a correct choice!"
                                    printf "${white}\n\n"
                                    printf " Do you want install ${green}Guppy Screen ${white}with ${yellow}Material Design${white} or ${yellow}Z-Bolt ${white}theme ? (${yellow}material${white}/${yellow}zbolt${white}): ${yellow}"
                                    read confirm2
                                    printf "${white}\n"
                                done
            			        if [ "$confirm2" = "material" ] || [ "$confirm2" = "MATERIAL" ]; then
                			        printf "${green} Installing Guppy Screen with Material Design theme..."
                			        printf "${white}\n\n"
                			        printf "Downloading Guppy Screen...\n"
                			        /tmp/curl -s -L https://github.com/ballaswag/guppyscreen/releases/latest/download/guppyscreen.tar.gz -o /tmp/guppyscreen.tar.gz
                			        if [ $? -eq 0 ]; then
                			            printf "Installing files...\n"
	            			            tar xf /tmp/guppyscreen.tar.gz -C /usr/data/
	            			            if [ ! -d "/usr/data/guppyscreen-backup" ]; then
                                            printf "Backing up original files...\n"
                                            mkdir -p /usr/data/guppyscreen-backup
                                            mv /etc/init.d/S12boot_display /usr/data/guppyscreen-backup
                                            cp /etc/init.d/S50dropbear /usr/data/guppyscreen-backup
                                            cp /etc/init.d/S99start_app /usr/data/guppyscreen-backup
                                        fi
                                        if [ ! -f /usr/data/guppyscreen-backup/ft2font.cpython-38-mipsel-linux-gnu.so ]; then
                                            mv /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so /usr/data/guppyscreen-backup
                                        fi
                                        printf "${white}\n"
                                        printf "${white} Do you want to disable all Creality services ?\n"
                                        printf "${yellow} Benefits: ${white}\e[97mFrees up system resources on your K1 for critical services such as Klipper (recommended)\n"
                                        printf "${yellow} Disadvantages: ${white}\e[97mDisabling all Creality services breaks Creality Cloud and Creality Print\n\n"
                                        printf "${white} Do you want to disable all Creality Services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                        read confirm_decreality
                                        printf "${white}\n"
                                        while [ "$confirm_decreality" != "y" ] && [ "$confirm_decreality" != "Y" ] && [ "$confirm_decreality" != "n" ] && [ "$confirm_decreality" != "N" ]; do
                                            printf "${darkred} ✗ Please select a correct choice!"
                                            printf "${white}\n\n"
                                            printf " Do you want to disable all Creality Services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                            read confirm_decreality
                                            printf "${white}\n"
                                        done
                                        if [ "$confirm_decreality" = "y" ] || [ "$confirm_decreality" = "Y" ]; then
                                            printf "Disabling Creality services...\n"
                                            rm -f /etc/init.d/S99start_app
                                        fi
                                        printf "Setting up Guppy Screen...\n"
                                        cp "$guppyscreen_folder"k1_mods/S50dropbear /etc/init.d/S50dropbear
                                        cp "$guppyscreen_folder"k1_mods/S99guppyscreen /etc/init.d/S99guppyscreen
                                        cp "$guppyscreen_folder"k1_mods/calibrate_shaper_config.py "$klipper_extra_folder"calibrate_shaper_config.py
                                        if [ ! -d "/usr/lib/python3.8/site-packages/matplotlib-2.2.3-py3.8.egg-info" ]; then
                                            printf "mathplotlib ft2font module is not replaced. PSD graphs might not work.\n"
                                        else
                                            printf "Replacing mathplotlib ft2font module to generate PSD graphs...\n"
                                            cp "$guppyscreen_folder"k1_mods/ft2font.cpython-38-mipsel-linux-gnu.so /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so
                                        fi
                                        ln -sf "$guppyscreen_folder"k1_mods/respawn/libeinfo.so.1 /lib/libeinfo.so.1
                                        ln -sf "$guppyscreen_folder"k1_mods/respawn/librc.so.1 /lib/librc.so.1
                                        printf "Downloading Guppy Screen configurations files...\n"
                			            /tmp/curl -s -L "$guppyscreen_URL1" -o "$guppyscreen_folder"scripts/guppy_update.cfg
                			            /tmp/curl -s -L "$guppyscreen_URL2" -o "$guppyscreen_folder"guppy-update.sh
                			            chmod 775 "$guppyscreen_folder"guppy-update.sh
                			            printf "Copying files...\n"
                                        mkdir -p /usr/data/printer_data/config/GuppyScreen/scripts
                                        cp "$guppyscreen_folder"scripts/*.cfg /usr/data/printer_data/config/GuppyScreen
                                        cp "$guppyscreen_folder"scripts/*.py /usr/data/printer_data/config/GuppyScreen/scripts
                                        if grep -q "include GuppyScreen" "$printer_config" ; then
                                            printf "Guppy Screen configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Guppy Screen configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include GuppyScreen/*\.cfg\]' "$printer_config"
                                        fi
                                        if grep -q 'variable_autotune_shapers:' "$macro_config" ; then
                                            sed -i 's/variable_autotune_shapers:/#&/' "$macro_config"
                                            printf "Disabling stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already disabled in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q '\[gcode_macro INPUTSHAPER\]' "$macro_config" ; then
                                            sed -i 's/SHAPER_CALIBRATE AXIS=y/SHAPER_CALIBRATE/' "$macro_config"
                                            printf "Replacing stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already replaced in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q -v "guppyscreen" "/usr/data/printer_data/moonraker.asvc"; then
                                            printf "Adding Guppy Screen to Moonraker services file...\n"
                                            sed -i '/guppyscreen/!{ $a\guppyscreen' "/usr/data/printer_data/moonraker.asvc"
                                        else
                                            printf "Guppy Screen is already added to Moonraker services file...\n"
                                        fi
                                        sync
                                        printf "Restarting services...\n"
                                        /etc/init.d/S55klipper_service restart
                                        /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                                        if [ -f /usr/bin/Monitor ]; then
                                            mv /usr/bin/Monitor /usr/bin/Monitor.disable
                                        fi
                                        if [ -f /usr/bin/display-server ]; then
                                            mv /usr/bin/display-server /usr/bin/display-server.disable
                                        fi
                                        killall -q Monitor
                                        killall -q display-server
                                        if [ "$confirm_decreality" = "y" -o "$confirm_decreality" = "Y" ]; then
                                            killall -q master-server
                                            killall -q audio-server
                                            killall -q wifi-server
                                            killall -q app-server
                                            killall -q upgrade-server
                                            killall -q web-server
                                        fi
                                        printf "${white}Starting Guppy Screen...\n"
                                        /etc/init.d/S99guppyscreen restart &> /dev/null
                                        sleep 1
                                        ps auxw | grep guppyscreen | grep -v sh | grep -v grep
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			        printf "\n"
                			        printf "${green} ✓ Guppy Screen with ${yellow}Material Design ${green}theme has been installed successfully!"
                			        printf "${white}\n\n"
            			        elif [ "$confirm2" = "zbolt" ] || [ "$confirm2" = "ZBOLT" ]; then
                			        printf "${green} Installing Guppy Screen with Z-Bolt theme..."
                			        printf "${white}\n\n"
                			        printf "Downloading Guppy Screen...\n"
                			        /tmp/curl -s -L https://github.com/ballaswag/guppyscreen/releases/latest/download/guppyscreen-zbolt.tar.gz -o /tmp/guppyscreen.tar.gz
                			        if [ $? -eq 0 ]; then
                			            printf "Installing files...\n"
	            			            tar xf /tmp/guppyscreen.tar.gz -C /usr/data/
	            			            if [ ! -d "/usr/data/guppyscreen-backup" ]; then
                                            printf "Backing up original files...\n"
                                            mkdir -p /usr/data/guppyscreen-backup
                                            mv /etc/init.d/S12boot_display /usr/data/guppyscreen-backup
                                            cp /etc/init.d/S50dropbear /usr/data/guppyscreen-backup
                                            cp /etc/init.d/S99start_app /usr/data/guppyscreen-backup
                                        fi
                                        if [ ! -f /usr/data/guppyscreen-backup/ft2font.cpython-38-mipsel-linux-gnu.so ]; then
                                            mv /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so /usr/data/guppyscreen-backup
                                        fi
                                        printf "${white}\n"
                                        printf "${white} Do you want to disable all Creality services ?\n"
                                        printf "${yellow} Benefits: ${white}\e[97mFrees up system resources on your K1 for critical services such as Klipper (recommended)\n"
                                        printf "${yellow} Disadvantages: ${white}\e[97mDisabling all Creality services breaks Creality Cloud and Creality Print\n\n"
                                        printf "${white} Do you want to disable all Creality services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                        read confirm_decreality
                                        printf "${white}\n"
                                        while [ "$confirm_decreality" != "y" ] && [ "$confirm_decreality" != "Y" ] && [ "$confirm_decreality" != "n" ] && [ "$confirm_decreality" != "N" ]; do
                                            printf "${darkred} ✗ Please select a correct choice!"
                                            printf "${white}\n\n"
                                            printf " Do you want to disable all Creality Services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                            read confirm_decreality
                                            printf "${white}\n"
                                        done
                                        if [ "$confirm_decreality" = "y" ] || [ "$confirm_decreality" = "Y" ]; then
                                            printf "Disabling Creality services...\n"
                                            rm -f /etc/init.d/S99start_app
                                        fi
                                        printf "Setting up Guppy Screen...\n"
                                        cp "$guppyscreen_folder"k1_mods/S50dropbear /etc/init.d/S50dropbear
                                        cp "$guppyscreen_folder"k1_mods/S99guppyscreen /etc/init.d/S99guppyscreen
                                        cp "$guppyscreen_folder"k1_mods/calibrate_shaper_config.py "$klipper_extra_folder"calibrate_shaper_config.py
                                        if [ ! -d "/usr/lib/python3.8/site-packages/matplotlib-2.2.3-py3.8.egg-info" ]; then
                                            printf "mathplotlib ft2font module is not replaced. PSD graphs might not work.\n"
                                        else
                                            printf "Replacing mathplotlib ft2font module to generate PSD graphs...\n"
                                            cp "$guppyscreen_folder"/k1_mods/ft2font.cpython-38-mipsel-linux-gnu.so /usr/lib/python3.8/site-packages/matplotlib/ft2font.cpython-38-mipsel-linux-gnu.so
                                        fi
                                        ln -sf "$guppyscreen_folder"k1_mods/respawn/libeinfo.so.1 /lib/libeinfo.so.1
                                        ln -sf "$guppyscreen_folder"k1_mods/respawn/librc.so.1 /lib/librc.so.1
                                        printf "Downloading Guppy Screen configurations files...\n"
                			            /tmp/curl -s -L "$guppyscreen_URL1" -o "$guppyscreen_folder"scripts/guppy_update.cfg
                			            /tmp/curl -s -L "$guppyscreen_URL2" -o "$guppyscreen_folder"guppy-update.sh
                			            chmod 775 "$guppyscreen_folder"guppy-update.sh
                			            printf "Copying files...\n"
                                        mkdir -p /usr/data/printer_data/config/GuppyScreen/scripts
                                        cp "$guppyscreen_folder"scripts/*.cfg /usr/data/printer_data/config/GuppyScreen
                                        cp "$guppyscreen_folder"scripts/*.py /usr/data/printer_data/config/GuppyScreen/scripts
                                        if grep -q "include GuppyScreen" "$printer_config" ; then
                                            printf "Guppy Screen configurations are already enabled in printer.cfg file.\n"
                                        else
                                            printf "Adding Guppy Screen configurations in printer.cfg file...\n"
                                            sed -i '/\[include printer_params\.cfg\]/a \[include GuppyScreen/*\.cfg\]' "$printer_config"
                                        fi
                                        if grep -q 'variable_autotune_shapers:' "$macro_config" ; then
                                            sed -i 's/variable_autotune_shapers:/#&/' "$macro_config"
                                            printf "Disabling stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already disabled in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q '\[gcode_macro INPUTSHAPER\]' "$macro_config" ; then
                                            sed -i 's/SHAPER_CALIBRATE AXIS=y/SHAPER_CALIBRATE/' "$macro_config"
                                            printf "Replacing stock configuration in gcode_macro.cfg file...\n"
                                        else
                                            printf "Stock configuration is already replaced in gcode_macro.cfg file.\n"
                                        fi
                                        if grep -q -v "guppyscreen" "/usr/data/printer_data/moonraker.asvc"; then
                                            printf "Adding Guppy Screen to Moonraker services file...\n"
                                            sed -i '/guppyscreen/!{ $a\guppyscreen' "/usr/data/printer_data/moonraker.asvc"
                                        else
                                            printf "Guppy Screen is already added to Moonraker services file...\n"
                                        fi
                                        sync
                                        printf "Restarting services...\n"
                                        /etc/init.d/S55klipper_service restart
                                        /etc/init.d/S56moonraker_service restart
                			            sleep 1
                			            /etc/init.d/S56moonraker_service restart
                			            sleep 1
                                        if [ -f /usr/bin/Monitor ]; then
                                            mv /usr/bin/Monitor /usr/bin/Monitor.disable
                                        fi
                                        if [ -f /usr/bin/display-server ]; then
                                            mv /usr/bin/display-server /usr/bin/display-server.disable
                                        fi
                                        killall -q Monitor
                                        killall -q display-server
                                        if [ "$confirm_decreality" = "y" ] || [ "$confirm_decreality" = "Y" ]; then
                                            killall -q master-server
                                            killall -q audio-server
                                            killall -q wifi-server
                                            killall -q app-server
                                            killall -q upgrade-server
                                            killall -q web-server
                                        fi
                                        printf "${white}Starting Guppy Screen...\n"
                                        /etc/init.d/S99guppyscreen restart &> /dev/null
                                        sleep 1
                                        ps auxw | grep [g]uppyscreen | grep -v sh
                			        else
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			        printf "\n"
                			        printf "${green} ✓ Guppy Screen with ${yellow}Z-Bolt ${green}theme has been installed successfully!"
                			        printf "${white}\n\n"
            			        fi
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled! ${white}\n\n"
            			    fi
            			fi
                        ;;
                    6)
            			if [ ! -d "$guppyscreen_folder" ]; then
                			printf "${darkred} ✗ Guppy Screen is not installed!"
                			wait
                			printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to remove ${green}Guppy Screen ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to remove ${green}Guppy Screen ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "${green} Removing Guppy Screen..."
                			    printf "${white}\n\n"
                			    printf "Restoring backup files...\n"
                			    if [ -d "/usr/data/guppyscreen-backup" ]; then
                                    cp /usr/data/guppyscreen-backup/S12boot_display /etc/init.d/S12boot_display
                                    cp /usr/data/guppyscreen-backup/S50dropbear /etc/init.d/S50dropbear
                                    cp /usr/data/guppyscreen-backup/S99start_app /etc/init.d/S99start_app
                                    rm -rf /usr/data/guppyscreen-backup
                                fi
                                [ -f /etc/init.d/S99guppyscreen ] && /etc/init.d/S99guppyscreen stop &> /dev/null
                                killall -q guppyscreen
                                rm -f /etc/init.d/S99guppyscreen /lib/libeinfo.so.1 /lib/librc.so.1
                                rm -rf /usr/data/guppyscreen /usr/data/printer_data/config/GuppyScreen "$klipper_extra_folder"calibrate_shaper_config.py "$klipper_extra_folder"calibrate_shaper_config.pyc
                                if grep -q "include GuppyScreen/*" "$printer_config" ; then
                                    printf "Removing Guppy Screen configurations in printer.cfg file...\n"
                                    sed -i '/\[include GuppyScreen\/\*\.cfg\]/d' "$printer_config"
                                else
                                    printf "Guppy Screen configurations are already removed in printer.cfg file.\n"
                                fi
                                if grep -q "#variable_autotune_shapers:" "$macro_config"; then
                                    printf "Enabling stock configuration in gcode_macro.cfg file...\n"
                                    sed -i 's/#variable_autotune_shapers:/variable_autotune_shapers:/' "$macro_config"
                                else
                                    printf "Stock configuration is already enabled in gcode_macro.cfg file.\n"
                                fi
                                if grep -q '\[gcode_macro INPUTSHAPER\]' "$macro_config" ; then
                                    sed -i 's/SHAPER_CALIBRATE/SHAPER_CALIBRATE AXIS=y/' "$macro_config"
                                    printf "Restoring stock configuration in gcode_macro.cfg file...\n"
                                else
                                    printf "Stock configuration is already restored in gcode_macro.cfg file.\n"
                                fi
                                if grep -q "guppyscreen" "/usr/data/printer_data/moonraker.asvc"; then
                                    printf "Removing Guppy Screen from Moonraker services file...\n"
                                    sed -i '/guppyscreen/d' "/usr/data/printer_data/moonraker.asvc"
                                else
                                    printf "Guppy Screen is already removed from Moonraker services files...\n"
                                fi
                                printf "Restarting services...\n"
                                /etc/init.d/S55klipper_service restart
                                /etc/init.d/S56moonraker_service restart
                			    sleep 1
                			    /etc/init.d/S56moonraker_service restart
                			    sleep 1
                                if [ -f /usr/bin/Monitor.disable ]; then
                                    mv /usr/bin/Monitor.disable /usr/bin/Monitor
                                fi
                                if [ -f /usr/bin/display-server.disable ]; then
                                    mv /usr/bin/display-server.disable /usr/bin/display-server
                                fi
                                /usr/bin/Monitor > /dev/null 2>&1 &
                                /usr/bin/display-server > /dev/null 2>&1 &
                                /usr/bin/master-server > /dev/null 2>&1 &
                                /usr/bin/audio-server > /dev/null 2>&1 &
                                /usr/bin/wifi-server > /dev/null 2>&1 &
                                /usr/bin/app-server > /dev/null 2>&1 &
                                /usr/bin/upgrade-server > /dev/null 2>&1 &
                                if [ -f /usr/bin/web-server ]; then
                                    /usr/bin/web-server > /dev/null 2>&1 &
                                fi
                			    printf "\n"
                			    printf "${green} ✓ Guppy Screen has been removed successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Deletion canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    7)
            			if [ -f "$fluiddlogo_file" ]; then
            				printf "${darkred} ✗ Creality Dynamic Logos for Fluidd are already installed!"
            				wait
            				printf "${white}\n\n"
            			else
            			    printf "${cyan} This allows you to have the dynamic Creality logos on the Fluidd Web interface."
            			    printf "${white}\n\n"
                            printf " Are you sure you want to install ${green}Creality Dynamic Logos for Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to install ${green}Creality Dynamic Logos for Fluidd ${white}? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
            			    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            			        printf "${green} Installing Creality Dynamic Logos for Fluidd..."
                			    printf "${white}\n\n"
                                printf "Downloading files...\n"
                			    /tmp/curl -s -L "$fluiddlogo_URL1" -o /usr/data/fluidd/logo_creality_v1.svg
                			    if [ $? -eq 0 ]; then
                			        /tmp/curl -s -L "$fluiddlogo_URL2" -o /usr/data/fluidd/logo_creality_v2.svg
                			        if [ $? -eq 0 ]; then
                			            /tmp/curl -s -L "$fluiddlogo_URL3" -o /usr/data/fluidd/config.json
                			            if [ $? -eq 0 ]; then
                			                printf "\n"
                                            printf "${green} ✓ Creality Dynamic Logos for Fluidd have been installed successfully!"
                			                printf "${white}\n\n"
                			                printf " You can now select Creality V1 or V2 theme in Fluidd settings."
                			                printf "${white}\n\n"
                			            else
                			                rm -f /usr/data/fluidd/logo_creality_v1.svg
                			                rm -f /usr/data/fluidd/logo_creality_v2.svg
                			                printf "${white}\n\n"
                			                printf "${darkred} ✗ Download failed!"
                			                wait
                			                printf "${white}\n\n"
                			            fi
                			        else
                			            rm -f /usr/data/fluidd/logo_creality_v1.svg
                			            printf "${white}\n\n"
                			            printf "${darkred} ✗ Download failed!"
                			            wait
                			            printf "${white}\n\n"
                			        fi
                			    else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
            			    elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Installation canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
                        ;;
                esac
            done
            ;;
        4)
            while [ 1 ]
            do
                backup_menu
                case $opt_backup_menu in
                    1)
                        printf " Are you sure you want to backup ${green}Klipper configuration ${white}files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			read confirm
            			printf "${white}\n"
            			while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Are you sure you want to backup ${green}Klipper configuration ${white}files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
                        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                            cd /usr/data/printer_data
            			    if [ -f config/backup_config.tar.gz ]; then
                			    rm -f config/backup_config.tar.gz
            			    fi
            			    printf "Compressing files...\n"
            			    tar -czvf backup_config.tar.gz config/
            			    mv backup_config.tar.gz config/backup_config.tar.gz
            			    printf "\n"
            			    printf "${green} ✓ Klipper configuration files have been saved successfully in ${yellow}/usr/data/printer_data/config/ ${green}folder!"
            			    printf "${white}\n\n"
            			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			printf "${darkred} Backup canceled!"
                			printf "${white}\n\n"
            			fi
                        ;;
                    2)
            			if [ ! -f /usr/data/printer_data/config/backup_config.tar.gz ]; then
                			printf "${darkred} Please backup Klipper configuration files before restore!"
                			wait
                			printf "${white}\n\n"
            			else
            			    printf " Are you sure you want to restore ${green}Klipper configuration ${white}files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            			    read confirm
            			    printf "${white}\n"
            			    while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Are you sure you want to restore ${green}Klipper configuration ${white}files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                cd /usr/data/printer_data
                                mv config/backup_config.tar.gz backup_config.tar.gz
            			        if [[ -d config/ ]]; then
                    			    rm -rf config/
                			    fi
                			    printf "Restoring files...\n"
                			    tar -xvf backup_config.tar.gz
                			    mv backup_config.tar.gz config/backup_config.tar.gz
                			    printf "\n"
                			    printf "${green} ✓ Klipper configuration files have been restored successfully!"
                			    printf "${white}\n\n"
                			elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                			    printf "${darkred} ✗ Restoration canceled!"
                			    printf "${white}\n\n"
            			    fi
            			fi
                        ;;
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
                        ;;
                esac
            done
            ;;
        5)
            while [ 1 ]
            do
                tools_menu
                case $opt_tools_menu in
                    1)
                        if [ ! -d "$moonraker_folder" ] && [ ! -d "$nginx_folder" ]; then
            	            printf "${darkred} ✗ Moonraker and Nginx are not installed!"
            	            wait
            	            printf "${white}\n\n"
                        else
                            printf " Do you want to restart ${green}Moonraker and Nginx ${white}services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	            read confirm
            	            printf "${white}\n"
            	            while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Do you want to restart ${green}Moonraker and Nginx ${white}services ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "Restarting services...\n"
                                /etc/init.d/S50nginx stop
                                /etc/init.d/S56moonraker_service stop
                                /etc/init.d/S50nginx start
                                sleep 1
                                /etc/init.d/S56moonraker_service start
                                sleep 1
                                printf "\n"
                                printf "${green} ✓ Moonraker and Nginx services have been restarted!"
                                printf "${white}\n\n"
                            elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	            printf "${darkred} ✗ Restart canceled!"
                	            printf "${white}\n\n"
                            fi
                        fi
                        ;;
                    2)
                        if [ ! -f /etc/init.d/S55klipper_service ]; then
            	            printf "${darkred} ✗ Klipper service is not present!"
            	            wait
            	            printf "${white}\n\n"
                        else
                            printf " Do you want to restart ${green}Klipper ${white}service ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	            read confirm
            	            printf "${white}\n"
            	            while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Do you want to restart ${green}Klipper ${white}service ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "Restarting service...\n"
                                /etc/init.d/S55klipper_service restart
                                printf "\n"
                                printf "${green} ✓ Klipper service has been restarted!"
                                printf "${white}\n\n"
                            elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	            printf "${darkred} ✗ Restart canceled!"
                	            printf "${white}\n\n"
                            fi
                        fi
                        ;;
                    3)
                        if [ ! -f /etc/init.d/S55klipper_service ]; then
            	            printf "${darkred} ✗ Klipper service is not present!"
            	            wait
            	            printf "${white}\n\n"
                        else
                            printf "${cyan} This prevents updating Klipper configuration files when it restarts."
            			    printf "${white}\n\n"
                            printf " Do you want to prevent updating Klipper configuration files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	            read confirm
            	            printf "${white}\n"
            	            while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Do you want to prevent updating Klipper configuration files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                			    printf "Backup file...\n"
                                mv /etc/init.d/S55klipper_service /etc/init.d/disabled.S55klipper_service
                                printf "Downloading file...\n"
                			    /tmp/curl -s -L "$klipperservice_URL" -o /etc/init.d/S55klipper_service
                			    if [ $? -eq 0 ]; then
                			        printf "Applying permissions...\n"
                			        chmod 755 /etc/init.d/S55klipper_service
                                    printf "Restarting service...\n"
                                    /etc/init.d/S55klipper_service restart
                                    printf "\n"
                                    printf "${green} ✓ Klipper configuration files will no longer be updated when Klipper restarts!"
                                    printf "${white}\n\n"
                                else
                			        printf "${white}\n\n"
                			        printf "${darkred} ✗ Download failed!"
                			        wait
                			        printf "${white}\n\n"
                			    fi
                            elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	            printf "${darkred} ✗ Restart canceled!"
                	            printf "${white}\n\n"
                            fi
                        fi
                        ;;
                    4)
                        if [ ! -f /etc/init.d/disabled.S55klipper_service ]; then
            	            printf "${darkred} ✗ This is already applied!"
            	            wait
            	            printf "${white}\n\n"
                        else
                            printf "${cyan} This allows updating Klipper configuration files when it restarts."
            			    printf "${white}\n\n"
                            printf " Do you want to allow updating Klipper configuration files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	            read confirm
            	            printf "${white}\n"
            	            while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                                printf "${darkred} ✗ Please select a correct choice!"
                                printf "${white}\n\n"
                                printf " Do you want to allow updating Klipper configuration files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                                read confirm
                                printf "${white}\n"
                            done
                            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                                printf "Restoring file...\n"
                                rm -f /etc/init.d/S55klipper_service
                                mv /etc/init.d/disabled.S55klipper_service /etc/init.d/S55klipper_service
                                printf "Restarting service...\n"
                                /etc/init.d/S55klipper_service restart
                                printf "\n"
                                printf "${green} ✓ Klipper configuration files will be updated when Klipper restarts!"
                                printf "${white}\n\n"
                            elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	            printf "${darkred} ✗ Restart canceled!"
                	            printf "${white}\n\n"
                            fi
                        fi
                        ;;
                    5)
                        printf "${cyan} To restore a previous firmware, follow these steps and validate your choice:"
                        printf "\n\n"
                        printf "${cyan} 1. ${white}Copy the firmware (.img) you want to update to the root of a USB drive."
                        printf "\n"
                        printf "    Make sure there is only this file on the USB drive."
                        printf "\n\n"
                        printf "${cyan} 2. ${white}Insert the USB drive into the printer."
                        printf "\n\n"
                        printf " Do you want to restore a previous firmware ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	        read confirm
            	        printf "${white}\n"
            	        while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Do you want to restore a previous firmware ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
                        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                            if ls /tmp/udisk/sda1/*.img 1> /dev/null 2>&1; then
                                printf "Restoring firmware...\n"
                                rm -rf /overlay/upper/*
                                /etc/ota_bin/local_ota_update.sh /tmp/udisk/sda1/*.img
                                printf "\n"
                                printf "${green} ✓ Firmware has been restored! Please reboot your printer."
                                printf "${white}\n\n"
                                printf " After reboot, perform a reset to factory settings (see Wiki)."
                                printf "${white}\n\n"
                            else
                                printf "${darkred} ✗ No .img file found on the USB drive. Restoration canceled!"
                                wait
                                printf "${white}\n\n"
                            fi
                        elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	        printf "${darkred} ✗ Restoration canceled!"
                	        printf "${white}\n\n"
                        fi
                        ;;
                    6)
                        printf " Do you want to clear the cache ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	        read confirm
            	        printf "${white}\n"
            	        while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Do you want to clear the cache ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
                        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                            printf "Clearing cache...\n"
                            rm -rf /root/.cache
                            printf "\n"
                            printf "${green} ✓ Cache has been cleared!"
                            printf "${white}\n\n"
                        elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	        printf "${darkred} ✗ Clearing cache canceled!"
                	        printf "${white}\n\n"
                        fi
                        ;;
                    7)
                        printf " Do you want to clear logs files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
            	        read confirm
            	        printf "${white}\n"
            	        while [ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && [ "$confirm" != "n" ] && [ "$confirm" != "N" ]; do
                            printf "${darkred} ✗ Please select a correct choice!"
                            printf "${white}\n\n"
                            printf " Do you want to clear logs files ? (${yellow}y${white}/${yellow}n${white}): ${yellow}"
                            read confirm
                            printf "${white}\n"
                        done
                        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                            printf "Clearing logs files...\n"
                            rm -f /usr/data/creality/userdata/log/*.log
                            rm -f /usr/data/creality/userdata/log/*.gz
                            rm -f /usr/data/creality/userdata/fault_code/*
                            rm -f /usr/data/printer_data/logs/*
                            printf "\n"
                            printf "${green} ✓ Logs files has been cleared!"
                            printf "${white}\n\n"
                        elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
                	        printf "${darkred} ✗ Clearing logs files canceled!"
                	        printf "${white}\n\n"
                        fi
                        ;;
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
                        ;;
                esac
            done
            ;;
        6)
            while [ 1 ]
            do
                info_menu
                case $opt_info_menu in
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
                        ;;
                esac
            done
            ;;
        7)
            while [ 1 ]
            do
                system_menu
                case $opt_system_menu in
                    B)
                    	clear
                        break
                        ;;
                    Q)
                        exit
                        ;;
                    *)
            			printf "${darkred} ✗ Please select a correct choice!"
            			printf "${white}\n\n"
                        ;;
                esac
            done
            ;;
        U)
            check_updates
            ;;
        Q)
            exit
            ;;
        *)
            printf "${darkred} ✗ Please select a correct choice!"
            printf "${white}\n\n"
            ;;
    esac
done
wait
