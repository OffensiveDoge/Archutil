#!/usr/bin/bash
version="v1.00"
white='\033[1;37m'; cyan='\033[1;36m'; red='\e[1;34m'; clrformat='\e(B\e[m'
currentnum=1
aurchosen=false
hide="\033[?25l"
show="\033[?25h"
printf "$hide"
menucursor1="${white}>${cyan}"; menucursor2=" "
menuline1=" Select Programs"; menuline2=" Quit"
maingui(){
clear
printf "\n"
printf "${cyan}\n"
printf "       /\ \n"
printf "      /  \ \n"
printf "     /    \    ┌── ┌── ╷ ╷\n"
printf "    /      \   │   │   ├─┤\n"
printf "   /   ,,   \  ╵   └── ╵ ╵   L I G H T\n"
printf "  /   |  |   \   U T I L\n"
printf " /_-''    ''-_\ \n"
printf "${clrformat}\n"
printf "\n"
printf "    ${menucursor1}${menuline1}${clrformat}\n"
printf "    ${menucursor2}${menuline2}${clrformat}\n"
printf "\n"
}
upkey="k"; downkey="j"; upkey2="w"; downkey2="s"; selectkey="f"
displayupkey="K"; displaydownkey="J"
menurunning=true
mainmenu() {
while [[ "${menurunning}" = true ]]; do
read -sn 1 menukey
if [[ "${menukey}" = "q" ]]; then
clear; printf "$show"; exec bash; exit 0
elif [[ ($menukey = "${downkey}" || $menukey = "${downkey2}") && $currentnum < 2 ]]; then #browser
printf -v "menucursor$currentnum" '%s' " "
printf -v "menucursor$((currentnum + 1))" '%s' "${white}>${cyan}"
(( currentnum += 1 ))
maingui
elif [[ ($menukey = "${upkey}" || $menukey = "${upkey2}") && $currentnum > 1 ]]; then
printf -v "menucursor$currentnum" '%s' " "
printf -v "menucursor$((currentnum - 1))" '%s' "${white}>${cyan}"
(( currentnum -= 1 ))
maingui
elif [[ "${menukey}" = "${selectkey}"  ]]; then
if [[ $menucursor1 = "${white}>${cyan}" ]]; then
cursor1="${white}> ${cyan}" && cursor17="  "
selgui
selmenu
elif [[ "${menucursor2}" = "${white}>${cyan}" ]]; then
clear; printf "$show"; exec bash; exit 0
fi
fi
done
}
sub1name1=" Yay"; sub1name2=" Paru"; sub1name3=" Back"
sub1sel1="[ ]"; sub1sel2="[ ]"; sub1sel3=" - "
sub1depth=3
sub1name="AUR Helper         "
sub2name1=" KDE Plasma"; sub2name2=" Hyprland"; sub2name3=" Cinnamon"; sub2name4=" Xfce"; sub2name5=" Gnome"; sub2name6=" Back"
sub2sel1="[ ]"; sub2sel2="[ ]"; sub2sel3="[ ]"; sub2sel4="[ ]"; sub2sel5="[ ]"; sub2sel6=" - "
sub2depth=6
sub2name="Desktop Environment"
sub3name1=" Brave"; sub3name2=" Firefox"; sub3name3=" Librewolf"; sub3name4=" Mullvad"; sub3name5=" Back"; sub3name6="           "
sub3sel1="[ ]"; sub3sel2="[ ]"; sub3sel3="[ ]"; sub3sel4="[ ]"; sub3sel5=" - "
sub3depth=5
sub3name="Browser"
sub4name1=" Konsole"; sub4name2=" Terminator"; sub4name3=" Tilix"; sub4name4=" Kitty     "; sub4name5=" Back"
sub4sel1="[ ]"; sub4sel2="[ ]"; sub4sel3="[ ]"; sub4sel4="[ ]"; sub4sel5=" - "
sub4depth=5
sub4name="Terminal"
sub5name1=" Dolphin   "; sub5name2=" Thunar    "; sub5name3=" Yazi"; sub5name4=" Back"
sub5sel1="[ ]"; sub5sel2="[ ]"; sub5sel3="[ ]"; sub5sel4=" - "
sub5depth=4
sub5name="File Manager"
sub6name1=" Kate"; sub6name2=" Nano"; sub6name3=" Vim"; sub6name4=" Neovim"; sub6name5=" Back"
sub6sel1="[ ]"; sub6sel2="[ ]"; sub6sel3="[ ]"; sub6sel4="[ ]"; sub6sel5=" - "
sub6depth=5
sub6name="Text Editor"
setsubmenu() {
csubmenu=${currentnum}
bcl="sub${csubmenu}sel${currentnum}"
csel1="sub${csubmenu}sel1"; csel2="sub${csubmenu}sel2"; csel3="sub${csubmenu}sel3"; csel4="sub${csubmenu}sel4"; csel5="sub${csubmenu}sel5"; csel6="sub${csubmenu}sel6"
cname1="sub${csubmenu}name1"; cname2="sub${csubmenu}name2"; cname3="sub${csubmenu}name3"; cname4="sub${csubmenu}name4"; cname5="sub${csubmenu}name5"; cname6="sub${csubmenu}name6"
pagedepth="sub${csubmenu}depth"
cmenuname="sub${csubmenu}name"
}
pkggui() {
clear
printf "\n"
printf "\n"
printf "   ┌───────────────────────────────────┐\n"
printf "     ${cyan}${!cmenuname}${clrformat}\n"
printf "     ${cursor1}  ${!csel1}${!cname1}${clrformat}\n" # Submenus
printf "     ${cursor2}  ${!csel2}${!cname2}${clrformat}\n"
printf "     ${cursor3}  ${!csel3}${!cname3}${clrformat}\n"
printf "     ${cursor4}  ${!csel4}${!cname4}${clrformat}\n"
printf "     ${cursor5}  ${!csel5}${!cname5}${clrformat}\n"
printf "     ${cursor6}  ${!csel6}${!cname6}${clrformat}\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "   └───────────────────────────────────┘\n"
printf "\n"; printf "\n"; printf "\n"; printf "\n"
}
packageusage=true
pkgmenu() {
while [[ $packageusage = "true" ]]; do
bcl="sub${csubmenu}sel${currentnum}"
read -n 1 -s key
if [[ $key = "q" ]]; then
clear; printf "$show"; exec bash; exit 0
elif [[ $key = "r" ]]; then
printf -v "cursor$currentnum" '%s' "  "
cursor1="${white}> ${cyan}"
currentnum=1
selgui
selmenu
elif [[ ($key = "${downkey}" || $key = "${downkey2}") && $currentnum < ${!pagedepth} ]]; then #browser
printf -v "cursor$currentnum" '%s' "  "
printf -v "cursor$((currentnum + 1))" '%s' "${white}> ${cyan}"
(( currentnum += 1 ))
pkggui
elif [[ ($key = "${upkey}" || $key = "${upkey2}") && $currentnum > 1 ]]; then
printf -v "cursor$currentnum" '%s' "  "
printf -v "cursor$((currentnum - 1))" '%s' "${white}> ${cyan}"
(( currentnum -= 1 ))
pkggui
elif [[ $key = "${selectkey}" ]]; then
if [[ "${!bcl}" = "[ ]" ]]; then
printf -v "sub${csubmenu}sel${currentnum}" '%s' "[x]"
printf -v "sub${csubmenu}pkg$currentnum" '%s' "yes"
pkggui
pkgmenu
elif [[ "${!bcl}" = "[x]" ]]; then
printf -v "sub${csubmenu}sel$currentnum" '%s' "[ ]"
printf -v "sub${csubmenu}pkg$currentnum" '%s' "no"
pkggui
pkgmenu
elif [[ "${!bcl}" = " - " ]]; then
printf -v "cursor$currentnum" '%s' "  "
cursor1="${white}> ${cyan}"
currentnum=1
selgui
selmenu
fi
fi
done
}
cursor1="${white}> ${cyan}"; cursor2="  "; cursor3="  "; cursor4="  "; cursor5="  "; cursor6="  "; cursor7="  "; cursor8="  "; cursor9="  "; cursor10="  "; cursor11="  "; cursor12="  "; cursor13="  "; cursor14="  "; cursor15="  "; cursor16="  "; cursor17="  "; cursor18="  "
select1="[>]"; select2="[>]"; select3="[>]"; select4="[>]"; select5="[>]"; select6="[>]"; select7="[ ]"; select8="[ ]"; select9="[ ]"; select10="[ ]"; select11="[ ]"; select12="[ ]"; select13="[ ]"; select14="[ ]"; select15="[ ]"
select16="install"
select17="menu"
select18="quit"
line1=" AUR"; line2=" Desktop Environment"; line3=" Browser"; line4=" Terminal"; line5=" File Manager"; line6=" Text Editor"; line7=" Libreoffice"; line8=" Fastfetch"; line9=" Btop"; line10=" Kcalc"; line11=" GIMP"; line12=" VLC"; line13=" 7zip"; line14=" Timeshift"; line15=" Minecraft Launcher"
lineinstall="Install Selected"
lineback="Back To Main"
linequit="Quit"
currentline="select${currentnum}"
selgui(){
clear
printf "\n"
printf "\n"
printf "   ┌───────────────────────────────────┐\n"
printf "     ${cyan}ArchUtil${clrformat} ${white}${version}${clrformat}\n"
printf "     ${cursor1}  ${select1}${line1}${clrformat}\n"
printf "     ${cursor2}  ${select2}${line2}${clrformat}\n"
printf "     ${cursor3}  ${select3}${line3}${clrformat}\n"
printf "     ${cursor4}  ${select4}${line4}${clrformat}\n"
printf "     ${cursor5}  ${select5}${line5}${clrformat}\n"
printf "     ${cursor6}  ${select6}${line6}${clrformat}\n"
printf "     ${cursor7}  ${select7}${line7}${clrformat}\n"
printf "     ${cursor8}  ${select8}${line8}${clrformat}\n"
printf "     ${cursor9}  ${select9}${line9}${clrformat}\n"
printf "     ${cursor10}  ${select10}${line10}${clrformat}\n"
printf "     ${cursor11}  ${select11}${line11}${clrformat}\n"
printf "     ${cursor12}  ${select12}${line12}${clrformat}\n"
printf "     ${cursor13}  ${select13}${line13}${clrformat}\n"
printf "     ${cursor14}  ${select14}${line14}${clrformat}\n"
printf "     ${cursor15}  ${select15}${line15}${clrformat}\n"
printf "     ${cursor16}${lineinstall}${clrformat}\n"
printf "     ${cursor17}${lineback}${clrformat}\n"
printf "     ${cursor18}${linequit}${clrformat}\n"
printf "   └───────────────────────────────────┘\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
}
selectusage=true
selmenu() {
while [[ $selectusage = "true" ]]; do
currentline="select${currentnum}"
currentpkg="pkggui${currentnum}"
cpkgmenu="pkgmenu${currentnum}"
read -n 1 -s key
if [[ $key = "q" ]]; then
clear; printf "$show"; exec bash; exit 0
elif [[ $key = "r" ]]; then
printf -v "cursor$currentnum" '%s' "  "
cursor1="> ${cyan}"
cursor1="${white}> ${cyan}"
currentnum=1
maingui
mainmenu
elif [[ ($key = "${downkey}" || $key = "${downkey2}") ]] && (( currentnum < 18 )); then
printf -v "cursor$currentnum" '%s' "  "
printf -v "cursor$((currentnum + 1))" '%s' "${white}> ${cyan}"
((currentnum += 1))
selgui
selmenu
elif [[ ($key = "${upkey}" || $key = "${upkey2}") && $currentnum > 1 ]]; then
printf -v "cursor$currentnum" '%s' "  "
printf -v "cursor$((currentnum - 1))" '%s' "${white}> ${cyan}"
((currentnum -= 1))
selgui
selmenu
elif [[ $key = "f" ]]; then
if [[ "${!currentline}" = "[>]" ]]; then
setsubmenu
printf -v "cursor$currentnum" '%s' "  "
cursor1="${white}> ${cyan}"
currentnum=1
pkggui
pkgmenu
elif [[ "${!currentline}" = "[ ]" ]]; then
printf -v "select$currentnum" '%s' "[x]"; printf -v "package$currentnum" '%s' "yes"; selgui; selmenu
elif [[ "${!currentline}" = "[x]" ]]; then
printf -v "select$currentnum" '%s' "[ ]"
printf -v "package$currentnum" '%s' "no"
selgui
selmenu
elif [[ "${!currentline}" = "install" ]]; then
packagechecks
[[ $pkgs = true || $aurpkgs = true ]] && igui && imenu
[[ $pkgs = false && $aurpkgs = false ]] && warningmessage="             [No Packages Selected]" && warning && warningmenu
elif [[ "${!currentline}" = "menu" ]]; then
clear
currentnum=1
maingui
mainmenu
elif [[ "${!currentline}" = "quit" ]]; then
clear
printf "$show"
exec bash
exit 0
fi
fi
done
}
warningmenu() {
while true; do
read -sn 1 warninginput
if [[ $warninginput = "q" ]]; then
clear
printf "$show"
exec bash
exit 0
elif [[ $warninginput = "r" ]]; then
selgui
selmenu
fi
done
}
packagechecks() {
pkgs=false
aurpkgs=false
[[ $package7 = yes ]] && inspkg1=" libreoffice-fresh" && pkgs=true
[[ $package8 = yes ]] && inspkg2=" fastfetch" && pkgs=true
[[ $package9 = yes ]] && inspkg3=" btop" && pkgs=true
[[ $package10 = yes ]] && inspkg4=" kcalc" && pkgs=true
[[ $package11 = yes ]] && inspkg5=" gimp" && pkgs=true
[[ $package12 = yes ]] && inspkg6=" vlc" && pkgs=true
[[ $package13 = yes ]] && inspkg7=" 7zip" && pkgs=true
[[ $package14 = yes ]] && inspkg8=" timeshift" && pkgs=true
[[ $package15 = yes ]] && aurpkg1=" minecraft-launcher" && aurpkgs=true
[[ $sub1pkg1 = yes ]] && iyay=true && aur="yay" && aurchosen=true
[[ $sub1pkg2 = yes ]] && iparu=true && aur="paru" && aurchosen=true
[[ $sub2pkg1 = yes ]] && inspkg9=" plasma" && pkgs=true
[[ $sub2pkg2 = yes ]] && inspkg10=" hyprland" && pkgs=true
[[ $sub2pkg3 = yes ]] && inspkg11=" cinnamon" && pkgs=true
[[ $sub2pkg4 = yes ]] && inspkg12=" xfce4" && pkgs=true
[[ $sub2pkg5 = yes ]] && inspkg13=" gnome" && pkgs=true
[[ $sub3pkg1 = yes ]] && aurpkg2=" brave" && aurpkgs=true
[[ $sub3pkg2 = yes ]] && inspkg14=" firefox" && pkgs=true
[[ $sub3pkg3 = yes ]] && aurpkg3=" librewolf" && aurpkgs=true
[[ $sub3pkg4 = yes ]] && aurpkg4=" mullvad-browser" && aurpkgs=true
[[ $sub4pkg1 = yes ]] && inspkg15=" konsole" && pkgs=true
[[ $sub4pkg2 = yes ]] && inspkg16=" terminator" && pkgs=true
[[ $sub4pkg3 = yes ]] && aurpkg5=" tilix" && aurpkgs=true
[[ $sub4pkg4 = yes ]] && inspkg17=" kitty" && pkgs=true
[[ $sub5pkg1 = yes ]] && inspkg18=" dolphin" && pkgs=true
[[ $sub5pkg2 = yes ]] && inspkg19=" thunar" && pkgs=true
[[ $sub5pkg3 = yes ]] && inspkg20=" yazi" && pkgs=true
[[ $sub6pkg1 = yes ]] && inspkg21=" kate" && pkgs=true
[[ $sub6pkg2 = yes ]] && inspkg22=" nano" && pkgs=true
[[ $sub6pkg3 = yes ]] && inspkg23=" vim" && pkgs=true
[[ $sub6pkg4 = yes ]] && inspkg24=" neovim" && pkgs=true
}
igui() {
clear
printf "\n"
printf "\n"
printf "   ┌──────────────────────────────────────────────────────────┐\n"
printf "     ${cyan}Installation${clrformat} \n"
printf "          \n"
printf "      ${white}Pacman:${clrformat}     \n"
printf "     $inspkg1$inspkg2$inspkg3$inspkg4$inspkg5$inspkg6$inspkg7$inspkg8$inspkg9$inspkg10$inspkg11$inspkg12$inspkg13$inspkg14$inspkg15$inspkg16$inspkg17$inspkg18$inspkg19$inspkg20$inspkg21$inspkg22$inspkg23$inspkg24\n"
printf "          \n"
printf "      ${white}AUR:${clrformat}     \n"
printf "     $aurpkg1$aurpkg2$aurpkg3$aurpkg4$aurpkg5$aurpkg6     \n"
printf "          \n"
printf "      Install Packages?     \n"
printf "     ${white}[PRESS [${cyan}F${white}] TO CONTINUE, [${cyan}R${white}] TO GO BACK, OR [${cyan}Q${white}] TO QUIT]${clrformat}   \n"
printf "          \n"
printf "   └──────────────────────────────────────────────────────────┘\n"
printf "          \n"
printf "          \n"
printf "          \n"
}
igui2() {
clear
printf "\n"
printf "\n"
printf "   ┌──────────────────────────────────────────────────────────┐\n"
printf "     ${cyan}Installation${clrformat} \n"
printf "          \n"
printf "          \n"
printf "          \n"
printf "          \n"
printf "     $info\n"
printf "     $info2\n"
printf "          \n"
printf "          \n"
printf "     ${white}${question} [${cyan}Y${white}/${cyan}N${white}]${clrformat}   \n"
printf "          \n"
printf "   └──────────────────────────────────────────────────────────┘\n"
printf "          \n"
printf "          \n"
printf "          \n"
}
quitscreen() {
clear
printf "\n"
printf "\n"
printf "   ┌──────────────────────────────────────────────────────────┐\n"
printf "     ${cyan}ArchUtil ${white}${version}${clrformat} \n"
printf "          \n"
printf "          \n"
printf "      ${white}┌──────────────┐  \n"
printf "        ${cyan}INSTALLATION    \n"
printf "          FINISHED      \n"
printf "      ${white}└──────────────┘${clrformat}  \n"
printf "          \n"
printf "          \n"
printf "    ${white}> [${cyan}QUIT${white}]${clrformat} \n"
printf "          \n"
printf "   └──────────────────────────────────────────────────────────┘\n"
printf "          \n"
printf "          \n"
printf "          \n"
}
warning() {
clear
printf "\n"
printf "\n"
printf "   ┌──────────────────────────────────────────────────────────┐\n"
printf "     ${cyan}ArchUtil ${white}${version}${clrformat} \n"
printf "          \n"
printf "          \n"
printf "          \n"
printf "          \n"
printf "        $warningmessage    \n"
printf "          \n"
printf "          \n"
printf "          \n"
printf "           ${white}[${cyan}R${white}]eturn to previous page, [${cyan}Q${white}]uit Archutil${clrformat}  \n"
printf "          \n"
printf "   └──────────────────────────────────────────────────────────┘\n"
printf "          \n"
printf "          \n"
printf "          \n"
}
imenu() {
while true; do
read -sn 1 contins
if [[ $contins = "r" ]]; then
selgui
selmenu
elif [[ $contins = "f" ]]; then
clear
break
elif [[ $contins = "q" ]]; then
clear; printf "$show"; exec bash; exit 0
fi
done
iposition=1
yayexists=false
paruexists=false
[ -f /bin/yay ] || [ -f /usr/bin/yay ] && yayexists=true && aur="yay" && aurchosen=true
[ -f /bin/paru ] || [ -f /usr/bin/paru ] && paruexists=true && aur="paru" && aurchosen=true
question="Update Packages Before Installation?"
info="If packages aren't up to date problems"
info2="may occur during installation"
igui2
while true; do
read -sn 1 contins2
if [[ $iposition = "1" && $contins2 = "y" ]]; then
info=""
info2=""
sudo pacman -Syu
if [[ $pkgs = true ]]; then
question="Install Packages? (Pacman Repository)"
info=""; info2=""
iposition=2
igui2
elif [[ $pkgs = false && ${aurchosen} = false && $aurpkgs = true ]]; then
warningmessage="No AUR Chosen, Cannot Install Rest of the Packages"
warning
elif [[ $pkgs = false && ${aurchosen} = true && $aurpkgs = true  ]]; then
question="Install AUR Helper(s)"
info=""
iposition=3
igui2
fi
elif [[ $iposition = "1" && $contins2 = "n" ]]; then
if [[ $pkgs = true ]]; then
question="Install Packages? (Pacman Repository)"
info=""; info2=""
iposition=2
igui2
elif [[ $pkgs = false && ${aurchosen} = false && $aurpkgs = true ]]; then
warningmessage="No AUR Chosen, Cannot Install Rest of the Packages"
warning
elif [[ $pkgs = false && ${aurchosen} = true && $aurpkgs = true  ]]; then
question="Install AUR Helper(s)"
info=""
iposition=3 # to aur installation
igui2
fi
elif [[ $iposition = "2" && $contins2 = "y" ]]; then
sudo pacman -Sy --needed${inspkg1}${inspkg2}${inspkg3}${inspkg4}${inspkg5}${inspkg6}${inspkg7}${inspkg8}${inspkg9}${inspkg10}${inspkg11}${inspkg12}${inspkg13}${inspkg14}${inspkg15}${inspkg16}${inspkg17}${inspkg18}${inspkg19}${inspkg20}${inspkg21}${inspkg22}${inspkg23}${inspkg24}
sleep 2
(( iposition += 1 ))
if [[ ${aurchosen} = false && $aurpkgs = true ]]; then
warningmessage="No AUR Chosen, Cannot Install Rest of the Packages"
warning
elif [[ ${aurchosen} = true && $aurpkgs = true  ]]; then
question="Install AUR Helper(s)"
info=""
igui2
elif [[ $aurpkgs = false ]]; then
iposition=5
quitscreen
fi
elif [[ $iposition = "3" && $contins2 = "y" ]]; then
if [[ $yayexists=true ]]; then
echo "AUR Helper Yay already exists, skipping"
elif [[ $iyay = true && $yayexists = false ]]; then
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
fi
if [[ $paruexists = true ]]; then
echo "AUR Helper Paru already exists, skipping"
elif [[ $iparu = true && $paruexists = false ]]; then
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
fi
(( iposition += 1 ))
sleep 2
question="Install Packages? (Arch User Repository)"
info="During most installation prompts"
info2="press [ENTER] to select the default option"
igui2
elif [[ $iposition = "4" && $contins2 = "y" && ${aurchosen} = true ]]; then
sudo $aur -Sy --needed${aurpkg1}${aurpkg2}${aurpkg3}${aurpkg4}${aurpkg5}
sleep 2
(( iposition += 1 ))
quitscreen
elif [[ $contins2 = "n" && $iposition > 1 && $iposition < 5 ]]; then
iposition=1
selgui
selmenu
elif [[ $contins2 = "f" && $iposition = 5 ]]; then
clear
printf "$show"
exec bash
exit 0
elif [[ $contins2 = "r" && $iposition < 5 ]]; then
iposition=1
selgui
selmenu
elif [[ $contins2 = "q" ]]; then
clear
printf "$show"
exec bash
exit 0
fi
done
}
maingui
mainmenu
