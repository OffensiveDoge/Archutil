#!/usr/bin/bash
version="v1.00"
#colors
white='\033[1;37m'; cyan='\033[1;36m'; red='\e[1;34m'; clrformat='\e(B\e[m'

#predefs
currentnum=1
aurchosen=false
hide="\033[?25l"
show="\033[?25h"
printf "$hide"

# Main Menu Interface
menucursor1="${white}>${cyan}"; menucursor2=" "; menucursor3=" "; menucursor4=" "

menuline1=" Select Programs"; menuline2=" Documentation"; menuline3=" Options"; menuline4=" Quit"

 # todo
 # Fonts, Display Manager
 # Add documentation
 # Lightweight version without comments, documentation

#menugui
maingui(){
    clear
    echo ""
    printf '%b\n' "${white}   ┌─────────────────────────────────────────────────────────────────────────┐"
    printf '%b\n' "   │                   ${cyan}   -\`                                                 ${white}│"
    printf '%b\n' "   ${white}│${red}   [$version]        ${cyan}   .o+\`                                                ${white}│"
    printf '%b\n' "   ${white}│                 ${cyan}   \`ooo/   ${red}     qAIIRe.      cHEIRa   TR,    YH'        ${white}│"
    printf '%b\n' "   ${white}│                ${cyan}   \`+oooo:   ${red}     lt   qk    d'         qW    dM         ${white}│"
    printf '%b\n' "   ${white}│               ${cyan}   \`+oooooo:   ${red}     lrWW      D           YbmkjwI.        ${white}│"
    printf '%b\n' "   ${white}│               ${cyan}   -+oooooo+:   ${red}    ky^qR     Y,          'P    ik        ${white}│"
    printf '%b\n' "   ${white}│             ${cyan}   \`/:-:++oooo+:   ${red}   ymk qlR    QR   ,m     HI    YR       ${white}│"
    printf '%b\n' "   ${white}│            ${cyan}   \`/++++/+++++++:   ${red} yMl   .YA    *^LKI*    jBl    dDL      ${white}│"
    printf '%b\n' "   ${white}│           ${cyan}   \`/++++++++++++++:                                          ${white}│"
    printf '%b\n' "   ${white}│          ${cyan}   \`/+++ooooooooooooo/\`   ${red}                  d         Y        ${white}│"
    printf '%b\n' "   ${white}│         ${cyan}   ./ooosssso++osssssso+\`   ${red}                 B         j        ${white}│"
    printf '%b\n' "   ${white}│        ${cyan}   .oossssso-\`\`\`\`/ossssss+\`   ${red}      qY   W  ,jHnr   o   l        ${white}│"
    printf '%b\n' "   ${white}│       ${cyan}   -osssssso.      :ssssssso.   ${red}     LR   W    H     I   L        ${white}│"
    printf '%b\n' "   ${white}│      ${cyan}   :osssssss/        osssso+++.   ${red}     lwuJ     tw^   W   K        ${white}│"
    printf '%b\n' "   ${white}│     ${cyan}   /ossssssss/        +ssssooo/-   ${red}                                 ${white}│"
    printf '%b\n' "   ${white}│   ${cyan}   \`/ossssso+/:-        -:/+osssso+-   ${red}                               ${white}│"
    printf '%b\n' "   ${white}│  ${cyan}   \`+sso+:-\`                 \`.-/+oso: ${red}    A program installation      ${white}│"
    printf '%b\n' "   ${white}│ ${cyan}   \`++:.                           \`-/+/   ${red}   tool developed by Retard  ${white}│"
    printf '%b\n' "   ${white}│ ${cyan}   .\`                                 \`/                                ${white}│"
    printf '%b\n' "${white}   └─────────────────────────────────────────────────────────────────────────┘${clrformat}"
    echo ""
    printf "    ${menucursor1}${menuline1}${clrformat}\n"
    printf "    ${menucursor2}${menuline2}${clrformat}\n"
    printf "    ${menucursor3}${menuline3}${clrformat}\n"
    printf "    ${menucursor4}${menuline4}${clrformat}"
    echo ""
}
movingcheckboxes=true
upkey="k"; downkey="j"; upkey2="w"; downkey2="s"; selectkey="f"
displayupkey="K"; displaydownkey="J"
menurunning=true

#menuinterface
mainmenu() {
    while [[ "${menurunning}" = true ]]; do
        read -sn 1 menukey
        if [[ "${menukey}" = "q" ]]; then
            clear
            printf "$show"
            exec bash
            exit 0
        elif [[ ($menukey = "${downkey}" || $menukey = "${downkey2}") && $currentnum -lt 4 ]]; then #browser
            printf -v "menucursor$currentnum" '%s' " "
            printf -v "menucursor$((currentnum + 1))" '%s' "${white}>${cyan}"
            (( currentnum += 1 ))
            maingui
    #          UP BLOCK
        elif [[ ($menukey = "${upkey}" || $menukey = "${upkey2}") && $currentnum -gt 1 ]]; then
            printf -v "menucursor$currentnum" '%s' " "
            printf -v "menucursor$((currentnum - 1))" '%s' "${white}>${cyan}"
            (( currentnum -= 1 ))
            maingui
        elif [[ "${menukey}" = "${selectkey}"  ]]; then
            if [[ $menucursor1 = "${white}>${cyan}" ]]; then
                cursor1="${white}> ${cyan}" && cursor17="  "
                [[ $movingcheckboxes = true ]] && space1=" ${white}" && space17="" && prespc1="" && prespc17=" "
                [[ $movingcheckboxes = false ]] && space1="${white}" && space17="" && prespc1=" " && prespc17=" "
                selgui
                selmenu
            elif [[ "${menucursor2}" = "${white}>${cyan}" ]]; then
                currentnum=1
                docgui1
                docmenu
            elif [[ "${menucursor3}" = "${white}>${cyan}" ]]; then
                currentnum=1
                optiongui
                optionmenu
            elif [[ "${menucursor4}" = "${white}>${cyan}" ]]; then
                clear
                printf "$show"
                exec bash
                exit 0
            fi
        fi
    done
}

docgui1() {
clear
printf "\n"
printf "\n"
printf "   ┌────────────────────────────────────────────────────────────────────────────┬─────┐\n"
printf "   │  ${cyan}Documentation${clrformat}                                                             │  1  │\n"
printf "   ├──────────┬─────────────────────────────────────────────────────────────────┴─────┤\n"
printf "   │ CONTROLS │ Select - [F] | Down - [J] | Up - [K] | Back - [R]                     │\n"
printf "   ├──────────┴───────────────────────────────────────────────────────────────────────┤\n"
printf "   │ AUR Helper                                                                       │\n"
printf "   │ │                                                                                │\n"
printf "   │ └╼ A tool to download packages from the AUR (Arch User Repository)               │\n"
printf "   │    which is an extended package repository useful for finding some               │\n"
printf "   │    packages unavailable in Pacman's repository                                   │\n"
printf "   │                                                                                  │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │ Browsers                                                                         │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Brave]╼ A browser based on privacy with privacy                               │\n"
printf "   │ │          features such as an inbuilt AdBlocker, tracking reduction, etc.       │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Firefox]╼                                                                     │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Librewolf]╼ A hardened firefox browser with privacy features in mind          │\n"
printf "   │ │                                                                                │\n"
printf "   │ └─[Mullvad]╼                                                                     │\n"
printf "   │                                                                                  │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │ Display Managers                                                                 │\n"
printf "   │ │                                                                                │\n"
printf "   │ └╼ Graphical interfaces after the boot process, which can manage graphical       │\n"
printf "   │    environments such as window managers and desktop environments                 │\n"
printf "   │                                                                                  │\n"
printf "   ├───────────────────────────────────────┬─────────────────────────────┬────────────┤\n"
printf "   │ [${displaydownkey}] - Next Page | [${displayupkey}] - Previous Page │                             │ [R] - Back │\n"
printf "   └───────────────────────────────────────┴─────────────────────────────┴────────────┘\n"
}
docgui2() {
clear
printf "\n"
printf "\n"
printf "   ┌────────────────────────────────────────────────────────────────────────────┬─────┐\n"
printf "   │  ${cyan}Documentation${clrformat}                                                             │  2  │\n"
printf "   ├────────────────────────────────────────────────────────────────────────────┴─────┤\n"
printf "   │ Desktop Environments (DE)                                                        │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├╼ A collection of programs to create a graphical environment                    │\n"
printf "   │ │  making the use of the computer easier                                         │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[KDE Plasma]╼ Probably the most common DE, very customizable                   │\n"
printf "   │ │               to tune to your liking                                           │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Hyprland]╼ A highly customizable and stylish window manager, in so being has  │\n"
printf "   │ │             very little set up out of the box requiring manual configuration   │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Cinnamon]╼ A very popular DE similar to KDE Plasma, easy to use               │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[XFCE]╼ A lightweight DE perfect for computers with very low performance       │\n"
printf "   │ │                                                                                │\n"
printf "   │ └─[Gnome]╼ Not as customizable as other DEs, similar to MacOS in ways            │\n"
printf "   │                                                                                  │\n"
printf "   │       [The Desktop Environment to used is chosen in the display manager]         │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │                                                                                  │\n"
printf "   │ File Managers                                                                    │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Dolphin]╼ A file manager developed by KDE, features like tabs, terminal, etc. │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Thunar]╼ Xfce file manager with good configuration including                  │\n"
printf "   │ │           features like bulk rename, etc.                                      │\n"
printf "   ├───────────────────────────────────────┬─────────────────────────────┬────────────┤\n"
printf "   │ [${displaydownkey}] - Next Page | [${displayupkey}] - Previous Page │                             │ [R] - Back │\n"
printf "   └───────────────────────────────────────┴─────────────────────────────┴────────────┘\n"
}
docgui3() {
clear
printf "\n"
printf "\n"
printf "   ┌────────────────────────────────────────────────────────────────────────────┬─────┐\n"
printf "   │  ${cyan}Documentation${clrformat}                                                             │  3  │\n"
printf "   ├────────────────────────────────────────────────────────────────────────────┴─────┤\n"
printf "   │ │                                                                                │\n"
printf "   │ └─[Yazi]╼ Fast terminal based file manager                                       │\n"
printf "   │                                                                                  │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │ Terminal                                                                         │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Konsole]╼ A simple terminal emulator                                          │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Terminator]╼ A tiling terminal emulator                                       │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Tilix]╼ Another tiling terminal emulator                                      │\n"
printf "   │ │                                                                                │\n"
printf "   │ └─[Kitty]╼ A very customizable terminal emulator                                 │\n"
printf "   │                                                                                  │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │ Text Editor                                                                      │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Kate]╼ An advanced graphical text editor                                      │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Nano]╼ A simple terminal based text editor, perfect for just basic file edits │\n"
printf "   │ │                                                                                │\n"
printf "   │ ├─[Vim]╼ An advanced terminal text editor commonly used by programmers,          │\n"
printf "   │ │        knowledge in advance of how to use it is highly recommended             │\n"
printf "   │ │                                                                                │\n"
printf "   │ └─[Neovim]╼ An advanced expanded version of Vim                                  │\n"
printf "   │                                                                                  │\n"
printf "   ├───────────────────────────────────────┬─────────────────────────────┬────────────┤\n"
printf "   │ [${displaydownkey}] - Next Page | [${displayupkey}] - Previous Page │                             │ [R] - Back │\n"
printf "   └───────────────────────────────────────┴─────────────────────────────┴────────────┘\n"
}
docgui4() {
clear
printf "\n"
printf "\n"
printf "   ┌────────────────────────────────────────────────────────────────────────────┬─────┐\n"
printf "   │  ${cyan}Documentation${clrformat}                                                             │  4  │\n"
printf "   ├────────────────────────────────────────────────────────────────────────────┴─────┤\n"
printf "   │ └─[Yazi]╼ Fast terminal based file manager                                       │\n"
printf "   ├──────────────────────────────────────────────────────────────────────────────────┤\n"
printf "   │ [Libreoffice]╼ Like a better open source version of microsoft office, many tools │\n"
printf "   │                such as a word processor, spreadsheets, presentations, etc.       │\n"
printf "   │                                                                                  │\n"
printf "   │ [Fastfetch]╼ A terminal program listing system specs with the current disto      │\n"
printf "   │              logo, just looks really cool and you can put fastfetch              │\n"
printf "   │              at the end of your .bashrc file to see it at terminal startup       │\n"
printf "   │                                                                                  │\n"
printf "   │ [Btop]╼ An advanced system monitor tool, showing cpu, gpu, ram, network usage    │\n"
printf "   │         as well as running programs                                              │\n"
printf "   │                                                                                  │\n"
printf "   │ [Kcalc]╼ A graphical calculator by KDE                                           │\n"
printf "   │                                                                                  │\n"
printf "   │ [GIMP]╼ A free image editor, kind of like an open source photoshop               │\n"
printf "   │                                                                                  │\n"
printf "   │ [VLC]╼ A media player, the best                                                  │\n"
printf "   │                                                                                  │\n"
printf "   │ [7zip]╼ Terminal file compression and extraction tool                            │\n"
printf "   │                                                                                  │\n"
printf "   │ [Timeshift]╼ System snapshot utility, kind of like a backup in ways; it restores │\n"
printf "   │              snapshots in seconds, useful in case an update breaks something     │\n"
printf "   │                                                                                  │\n"
printf "   │ [Minecraft Launcher]╼ The official minecraft launcher                            │\n"
printf "   │                                                                                  │\n"
printf "   │                                                                                  │\n"
printf "   ├───────────────────────────────────────┬─────────────────────────────┬────────────┤\n"
printf "   │ [${displaydownkey}] - Next Page | [${displayupkey}] - Previous Page │                             │ [R] - Back │\n"
printf "   └───────────────────────────────────────┴─────────────────────────────┴────────────┘\n"
}
currentdoc="docgui${currentnum}"
docmenu() {
while true; do
    currentdoc="docgui${currentnum}"
    $currentdoc
    read -n 1 -s key
    if [[ $key = "q" ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
    elif [[ $key = "r" ]]; then
        clear
        currentnum=1
        menucursor1="${white}>${cyan}"; menucursor2=" "; menucursor3=" "; menucursor4=" "
        maingui
        mainmenu
 #  DOWN BLOCK
    elif [[ ($key = "${upkey}" || $key = "${upkey2}") && $currentnum -gt 1 ]]; then
        (( currentnum -= 1 ))
        currentdoc="docgui${currentnum}"
        ${currentdoc}
    elif [[ ($key = "${downkey}" || $key = "${downkey2}") && $currentnum -lt 4 ]]; then
        (( currentnum += 1 ))
        currentdoc="docgui${currentnum}"
        ${currentdoc}
    fi
done
}

boxstatus="MOVE"
optcursor1="${white}>"; optcursor2=" "; optcursor3=" "
optiongui() {
clear
printf "\n"
printf "\n"
printf "   ┌───────────────────────────────────┐\n"
printf "   │ ${cyan}Options${clrformat}                           │\n"
printf "   ├───────────────────────────────────┤\n"
printf "   │ ${optcursor1} Up/Down${clrformat} ----- DOWN ${white}[${cyan}${displaydownkey}${white}]${clrformat} | ${white}[${cyan}${displayupkey}${white}]${clrformat} UP │\n"
printf "   │ ${optcursor2} Text boxes${clrformat} ------------- ${white}[${cyan}${boxstatus}${white}]${clrformat} │\n"
printf "   │ ${optcursor3} Back${clrformat}                            │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   └───────────────────────────────────┘\n"
printf "\n"; printf "\n"; printf "\n"; printf "\n"
}
optionmenu() {
while [[ "${menurunning}" = true ]]; do
    read -sn 1 optkey
    if [[ "${optkey}" = "q" ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
 #  DOWN BLOCK
    elif [[ ($optkey = "${downkey}" || $optkey = "${downkey2}") && $currentnum -lt 3 ]]; then #browser
        printf -v "optcursor$currentnum" '%s' " "
        printf -v "optcursor$((currentnum + 1))" '%s' "${white}>"
        (( currentnum += 1 ))
        optiongui
 #  UP BLOCK
    elif [[ ($optkey = "${upkey}" || $optkey = "${upkey2}") && $currentnum -gt 1 ]]; then
        printf -v "optcursor$currentnum" '%s' " "
        printf -v "optcursor$((currentnum - 1))" '%s' "${white}>"
        (( currentnum -= 1 ))
        optiongui
    elif [[ $optkey = "r" ]]; then
        printf -v "optcursor$currentnum" '%s' " "
        optcursor1="${white}>"
        currentnum=1
        menucursor1="${white}>${cyan}"
        menucursor3=" "
        maingui
        mainmenu
    elif [[ $optkey = "q" ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
    elif [[ $optkey = "${selectkey}" ]]; then
        if [[ $currentnum = 1 && $upkey = "k" ]]; then
            upkey="j"
            downkey="k"
            displayupkey="J"
            displaydownkey="K"
            optiongui
        elif [[ $currentnum = 1 && $upkey = "j" ]]; then
            upkey="k"
            downkey="j"
            displayupkey="K"
            displaydownkey="J"
            optiongui
        elif [[ $currentnum = 2 && $movingcheckboxes = true ]]; then
            movingcheckboxes=false
            boxstatus="STAY"
            optiongui
        elif [[ $currentnum = 2 && $movingcheckboxes = false ]]; then
            movingcheckboxes=true
            boxstatus="MOVE"
            optiongui
        elif [[ $currentnum = 3 ]]; then
            printf -v "optcursor$currentnum" '%s' " "
            optcursor1="${white}>"
            currentnum=1
            menucursor1="${white}>${cyan}"
            menucursor3=" "
            maingui
            mainmenu
        fi
    fi
done
}

#Submenus
sub1name1=" Yay       "; sub1name2=" Paru      "; sub1name3=" Back      "; sub1name4="           "; sub1name5="           "; sub1name6="           "
sub1sel1="[ ]"; sub1sel2="[ ]"; sub1sel3=" - "; sub1sel4="   "; sub1sel5="   "; sub1sel6="   "
sub1depth=3
sub1name="AUR Helper         "
sub2name1=" KDE Plasma"; sub2name2=" Hyprland  "; sub2name3=" Cinnamon  "; sub2name4=" Xfce      "; sub2name5=" Gnome     "; sub2name6=" Back      "
sub2sel1="[ ]"; sub2sel2="[ ]"; sub2sel3="[ ]"; sub2sel4="[ ]"; sub2sel5="[ ]"; sub2sel6=" - "
sub2depth=6
sub2name="Desktop Environment"
sub3name1=" Brave     "; sub3name2=" Firefox   "; sub3name3=" Librewolf "; sub3name4=" Mullvad   "; sub3name5=" Back      "; sub3name6="           "
sub3sel1="[ ]"; sub3sel2="[ ]"; sub3sel3="[ ]"; sub3sel4="[ ]"; sub3sel5=" - "; sub3sel6="   "
sub3depth=5
sub3name="Browser            "
sub4name1=" Konsole   "; sub4name2=" Terminator"; sub4name3=" Tilix     "; sub4name4=" Kitty     "; sub4name5=" Back      "; sub4name6="           "
sub4sel1="[ ]"; sub4sel2="[ ]"; sub4sel3="[ ]"; sub4sel4="[ ]"; sub4sel5=" - "; sub4sel6="   "
sub4depth=5
sub4name="Terminal           "
sub5name1=" Dolphin   "; sub5name2=" Thunar    "; sub5name3=" Yazi      "; sub5name4=" Back      "; sub5name5="           "; sub5name6="           "
sub5sel1="[ ]"; sub5sel2="[ ]"; sub5sel3="[ ]"; sub5sel4=" - "; sub5sel5="   "; sub5sel6="   "
sub5depth=4
sub5name="File Manager       "
sub6name1=" Kate      "; sub6name2=" Nano      "; sub6name3=" Vim       "; sub6name4=" Neovim    "; sub6name5=" Back      "; sub6name6="           "
sub6sel1="[ ]"; sub6sel2="[ ]"; sub6sel3="[ ]"; sub6sel4="[ ]"; sub6sel5=" - "; sub6sel6="   "
sub6depth=5
sub6name="Text Editor        "
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
printf "   │ ${cyan}${!cmenuname}${clrformat}               │\n"
printf "   │ ${cursor1} ${prespc1}${!csel1}${space1}${!cname1}${clrformat}                │\n" # Submenus
printf "   │ ${cursor2} ${prespc2}${!csel2}${space2}${!cname2}${clrformat}                │\n"
printf "   │ ${cursor3} ${prespc3}${!csel3}${space3}${!cname3}${clrformat}                │\n"
printf "   │ ${cursor4} ${prespc4}${!csel4}${space4}${!cname4}${clrformat}                │\n"
printf "   │ ${cursor5} ${prespc5}${!csel5}${space5}${!cname5}${clrformat}                │\n"
printf "   │ ${cursor6} ${prespc6}${!csel6}${space6}${!cname6}${clrformat}                │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   │                                   │\n"
printf "   └───────────────────────────────────┘\n"
printf "\n"; printf "\n"; printf "\n"; printf "\n"
}
packageusage=true
pkgmenu() { # MAIN INSTALLATION PAGE
while [[ $packageusage = "true" ]]; do
    bcl="sub${csubmenu}sel${currentnum}"
    read -n 1 -s key
    if [[ $key = "q" ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
 #          DOWN BLOCK
    elif [[ $key = "r" ]]; then
        printf -v "cursor$currentnum" '%s' "  "
        printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        cursor1="${white}> ${cyan}"
        [[ $movingcheckboxes = false ]] && space1="${white}" && prespc1=" "
        [[ $movingcheckboxes = true ]] && space1=" ${white}" && prespc1=""
        currentnum=1
        selgui
        selmenu
    elif [[ ($key = "${downkey}" || $key = "${downkey2}") && $currentnum -lt ${!pagedepth} ]]; then #browser
        printf -v "cursor$currentnum" '%s' "  "
        printf -v "cursor$((currentnum + 1))" '%s' "${white}> ${cyan}"
        [[ $movingcheckboxes = true ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = true ]] && printf -v "space$((currentnum + 1))" '%s' " ${white}" && printf -v "prespc$((currentnum + 1))" '%s' ""
        [[ $movingcheckboxes = false ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = false ]] && printf -v "space$((currentnum + 1))" '%s' "${white}" && printf -v "prespc$((currentnum + 1))" '%s' " "
        (( currentnum += 1 ))
        pkggui
 #          UP BLOCK
    elif [[ ($key = "${upkey}" || $key = "${upkey2}") && $currentnum -gt 1 ]]; then
        printf -v "cursor$currentnum" '%s' "  "
        printf -v "cursor$((currentnum - 1))" '%s' "${white}> ${cyan}"
        [[ $movingcheckboxes = true ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = true ]] && printf -v "prespc$((currentnum - 1))" '%s' "" && printf -v "space$((currentnum - 1))" '%s' " ${white}"
        [[ $movingcheckboxes = false ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = false ]] && printf -v "prespc$((currentnum - 1))" '%s' " " && printf -v "space$((currentnum - 1))" '%s' "${white}"
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
            printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
            cursor1="${white}> ${cyan}"
            [[ $movingcheckboxes = false ]] && space1="${white}" && prespc1=" "
            [[ $movingcheckboxes = true ]] && space1=" ${white}" && prespc1=""
            currentnum=1
            selgui
            selmenu
        fi
    fi
done
}

 # GUI Definitions
cursor1="${white}> ${cyan}"; cursor2="  "; cursor3="  "; cursor4="  "; cursor5="  "; cursor6="  "; cursor7="  "; cursor8="  "; cursor9="  "; cursor10="  "; cursor11="  "; cursor12="  "; cursor13="  "; cursor14="  "; cursor15="  "; cursor16="  "; cursor17="  "; cursor18="  "
space2=""; space3=""; space4=""; space5=""; space6=""; space7=""; space8=""; space9=""; space10=""; space11=""; space12=""; space13=""; space14=""; space15=""; space16=""; space17=""; space18=""
[[ $movingcheckboxes = true ]] && space1=" ${white}"
[[ $movingcheckboxes = false ]] && space1="${white}"
prespc2=" "; prespc3=" "; prespc4=" "; prespc5=" "; prespc6=" "; prespc7=" "; prespc8=" "; prespc9=" "; prespc10=" "; prespc11=" "; prespc12=" "; prespc13=" "; prespc14=" "; prespc15=" "; prespc16=" "; prespc17=" "; prespc18=" "
[[ $movingcheckboxes = true ]] && prespc1=""
[[ $movingcheckboxes = false ]] && prespc=" "
select1="[>]"; select2="[>]"; select3="[>]"; select4="[>]"; select5="[>]"; select6="[>]"; select7="[ ]"; select8="[ ]"; select9="[ ]"; select10="[ ]"; select11="[ ]"; select12="[ ]"; select13="[ ]"; select14="[ ]"; select15="[ ]"
select16="install" # doesn't get printed
select17="menu" # DNP
select18="quit" #DNP
line1=" AUR"; line2=" Desktop Environment"; line3=" Browser"; line4=" Terminal"; line5=" File Manager"; line6=" Text Editor"; line7=" Libreoffice"; line8=" Fastfetch"; line9=" Btop"; line10=" Kcalc"; line11=" GIMP"; line12=" VLC"; line13=" 7zip"; line14=" Timeshift"; line15=" Minecraft Launcher"
lineinstall="Install Selected"
lineback="Back To Main"
linequit="Quit"

currentline="select${currentnum}"
# Main installation GUI
selgui(){
clear
printf "\n"
printf "\n"
printf "   ┌───────────────────────────────────┐\n"
printf "   │ ${cyan}ArchUtil${clrformat} ${white}${version}${clrformat}                    │\n"
printf "   │ ${cursor1} ${prespc1}${select1}${space1}${line1}${clrformat}                       │\n"
printf "   │ ${cursor2} ${prespc2}${select2}${space2}${line2}${clrformat}       │\n"
printf "   │ ${cursor3} ${prespc3}${select3}${space3}${line3}${clrformat}                   │\n"
printf "   │ ${cursor4} ${prespc4}${select4}${space4}${line4}${clrformat}                  │\n"
printf "   │ ${cursor5} ${prespc5}${select5}${space5}${line5}${clrformat}              │\n"
printf "   │ ${cursor6} ${prespc6}${select6}${space6}${line6}${clrformat}               │\n"
printf "   │ ${cursor7} ${prespc7}${select7}${space7}${line7}${clrformat}               │\n"
printf "   │ ${cursor8} ${prespc8}${select8}${space8}${line8}${clrformat}                 │\n"
printf "   │ ${cursor9} ${prespc9}${select9}${space9}${line9}${clrformat}                      │\n"
printf "   │ ${cursor10} ${prespc10}${select10}${space10}${line10}${clrformat}                     │\n"
printf "   │ ${cursor11} ${prespc11}${select11}${space11}${line11}${clrformat}                      │\n"
printf "   │ ${cursor12} ${prespc12}${select12}${space12}${line12}${clrformat}                       │\n"
printf "   │ ${cursor13} ${prespc13}${select13}${space13}${line13}${clrformat}                      │\n"
printf "   │ ${cursor14} ${prespc14}${select14}${space14}${line14}${clrformat}                 │\n"
printf "   │ ${cursor15} ${prespc15}${select15}${space15}${line15}${clrformat}        │\n"
printf "   │ ${cursor16}${lineinstall}${clrformat}                │\n"
printf "   │ ${cursor17}${lineback}${clrformat}                    │\n"
printf "   │ ${cursor18}${linequit}${clrformat}                            │\n"
printf "   └───────────────────────────────────┘\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
}

 #
 # MAIN INSTALLATION INTERFACE
 #
selectusage=true
selmenu() {
while [[ $selectusage = "true" ]]; do
    currentline="select${currentnum}"
    currentpkg="pkggui${currentnum}"
    cpkgmenu="pkgmenu${currentnum}"
    read -n 1 -s key
    if [[ $key = "q" ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
    elif [[ $key = "r" ]]; then
            printf -v "cursor$currentnum" '%s' "  "
            printf -v "prespc$currentnum" '%s' " "
            printf -v "space$currentnum" '%s' ""
            cursor1="> ${cyan}"
            space1=" ${white}"; prespc1=""; cursor1="${white}> ${cyan}"
            currentnum=1
            maingui
            mainmenu
 #  DOWN BLOCK
    elif [[ ($key = "${downkey}" || $key = "${downkey2}") ]] && (( currentnum < 18 )); then
        printf -v "cursor$currentnum" '%s' "  "
        printf -v "cursor$((currentnum + 1))" '%s' "${white}> ${cyan}"
        [[ $movingcheckboxes = true ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = true ]] && printf -v "prespc$((currentnum + 1))" '%s' "" && printf -v "space$((currentnum + 1))" '%s' " ${white}"
        [[ $movingcheckboxes = false ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = false ]] && printf -v "prespc$((currentnum + 1))" '%s' " " && printf -v "space$((currentnum + 1))" '%s' "${white}"
        ((currentnum += 1))
        selgui
        selmenu
 #      UP BLOCK
    elif [[ ($key = "${upkey}" || $key = "${upkey2}") && $currentnum -gt 1 ]]; then
        printf -v "cursor$currentnum" '%s' "  "
        printf -v "cursor$((currentnum - 1))" '%s' "${white}> ${cyan}";
        [[ $movingcheckboxes = true ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = true ]] && printf -v "prespc$((currentnum - 1))" '%s' "" && printf -v "space$((currentnum - 1))" '%s' " ${white}"
        [[ $movingcheckboxes = false ]] && printf -v "prespc$currentnum" '%s' " " && printf -v "space$currentnum" '%s' ""
        [[ $movingcheckboxes = false ]] && printf -v "prespc$((currentnum - 1))" '%s' " " && printf -v "space$((currentnum - 1))" '%s' "${white}"
        ((currentnum -= 1))
        selgui
        selmenu
 #      SELECT BLOCK
    elif [[ $key = "f" ]]; then
        if [[ "${!currentline}" = "[>]" ]]; then # submenus
            setsubmenu
            printf -v "cursor$currentnum" '%s' "  "
            printf -v "prespc$currentnum" '%s' " "; printf -v "space$currentnum" '%s' ""
            cursor1="${white}> ${cyan}"
            [[ $movingcheckboxes = true ]] && prespc1="" && space1=" ${white}"
            [[ $movingcheckboxes = false ]] && prespc1=" " && space1="${white}"
            currentnum=1
            pkggui
            pkgmenu
        elif [[ "${!currentline}" = "[ ]" ]]; then # Checking Box
            printf -v "select$currentnum" '%s' "[x]"
            printf -v "package$currentnum" '%s' "yes"
            selgui
            selmenu
        elif [[ "${!currentline}" = "[x]" ]]; then # Unchecking Box
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
 # Installation will prompt you with choices, most of these you can just hit ENTER for the default selection.

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
        clear
        printf "$show"
        exec bash
        exit 0
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
# add check to see if packages are selected
# add check earlier for yay or paru being installed
while true; do
    read -sn 1 contins2
    if [[ $iposition = "1" && $contins2 = "y" ]]; then # Updating Packages (Step 1)
        info=""
        info2=""
        sudo pacman -Syu
        if [[ $pkgs = true ]]; then
            question="Install Packages? (Pacman Repository)" # check for if any pacman packages are selected
            info=""; info2=""
            iposition=2 # to pacman installation
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
    elif [[ $iposition = "1" && $contins2 = "n" ]]; then # Skipping Package Updates (Step 1)
        if [[ $pkgs = true ]]; then
            question="Install Packages? (Pacman Repository)" # check for if any pacman packages are selected
            info=""; info2=""
            iposition=2 # to pacman installation
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


    elif [[ $iposition = "2" && $contins2 = "y" ]]; then # Installing Pacman Packages (Step 2)
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


    elif [[ $iposition = "3" && $contins2 = "y" ]]; then # aur installation (Step 3)
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
        info="During most installation prompts" # use newline instead of info/info2
        info2="press [ENTER] to select the default option"
        igui2


    elif [[ $iposition = "4" && $contins2 = "y" && ${aurchosen} = true ]]; then # Installing AUR Packages (Step 4)
        sudo $aur -Sy --needed${aurpkg1}${aurpkg2}${aurpkg3}${aurpkg4}${aurpkg5}
        sleep 2
        (( iposition += 1 ))
        quitscreen


    elif [[ $contins2 = "n" && $iposition -gt 1 && $iposition -lt 5 ]]; then
        iposition=1
        selgui
        selmenu
    elif [[ $contins2 = "f" && $iposition = 5 ]]; then
        clear
        printf "$show"
        exec bash
        exit 0
    elif [[ $contins2 = "r" && $iposition -lt 5 ]]; then
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
#todo:skip aur install rather than say one's already installed
