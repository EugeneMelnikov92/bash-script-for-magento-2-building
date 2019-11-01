#!/usr/bin/env bash
# Сброс
Color_Off='\e[0m'       # Text Reset

# Обычные цвета
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Жирные
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Подчёркнутые
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Фоновые
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# Высоко Интенсивные
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Жирные Высоко Интенсивные
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# Высоко Интенсивные фоновые
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White


echo -e "$IGreen==============[ $IRed START DEPLOY MAGENTO $IGreen]==============$Color_Off\n"

echo -e "$IGreen==============[ $IRed CHMOD - VAR $IGreen]==============$Color_Off\n"
chmod -R 777 var/
echo -e "$IGreen==============[ $IRed CHMOD - PUB $IGreen]==============$Color_Off\n"
chmod -R 777 pub/
echo -e "$IGreen==============[ $IRed CHMOD - GENERATED $IGreen]==============$Color_Off\n"
chmod -R 777 generated/
echo -e "$IGreen==============[ $IRed SETUP UPGRADE $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento setup:upgrade
echo -e "$IGreen==============[ $IRed SETUP DI COMPILE $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento setup:di:compile
echo -e "$IGreen==============[ $IRed INDEX REINDEX $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento index:reindex
echo -e "$IGreen==============[ $IRed CONTENT DEPLOY $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento setup:static-content:deploy -f
echo -e "$IGreen==============[ $IRed CACHE FLUSH $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento c:f
echo -e "$IGreen==============[ $IRed CLEAR CACHE $IGreen]==============$Color_Off\n"
sudo -u evgeniy php bin/magento c:c
echo -e "$IGreen==============[ $IRed CHMOD - VAR $IGreen]==============$Color_Off\n"
chmod -R 777 var/
echo -e "$IGreen==============[ $IRed CHMOD - PUB $IGreen]==============$Color_Off\n"
chmod -R 777 pub/
echo -e "$IGreen==============[ $IRed CHMOD - GENERATED $IGreen]==============$Color_Off\n"
chmod -R 777 generated/