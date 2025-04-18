#!/bin/bash
echo "The Script is running"
##
#BASH menu script that checks:
#    - Memory usage
#    -CPU load
#    - # Number of tcp connections
#    - Kernel version

# $() - we tell bash to actually interret the command and then assign the value to our variable


#


server_name=$(hostname)
echo $server_name

function memorycheck() {
    echo ""
        echo " Memory usage on ${server_name}is: "
        free -h
        echo ""
}

function cpu_check() {
    echo ""
        echo "CPU load on ${server_name} is: "
    echo ""
        uptime
    echo ""

}

function tcp_check() {
    echo ""
        echo "TCP Connections on ${server_name}: "
    echo ""
        cat /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
        echo "Kernel version in ${server_name} is: "
    echo ""
        uname -r
    echo ""
}


function all_checks() {
    memorycheck
    cpu_check
    tcp_check
    kernel_check
}

all_checks


#add some colours to make our menu more readbale and easy to grasp at first glance

##
#Colour Variables
##

green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Colour functions
##

ColourGreen() {
    echo -ne $green$1$clear
}
ColourBlue() {
    echo -ne $blue$1$clear
}

## Testing them colours
echo -ne $(ColourBlue 'Some text here')


#Adding the menu

menu() {
    echo -ne "
    My First Menu
    $(ColourGreen '1)' )  Memory Usage
    $(ColourGreen '2)' )   CPU Load
    $(ColourGreen '3)' )  Number of TCP Connections
    $(ColourGreen '4)')  Kernel Version
    $(ColourGreen '5)' )  Check All
    $(ColourGreen  '0)' ) Exit
    $(ColourBlue 'Choose an option:') "

            read a
            case $a in 
                1) memorycheck ; menu ;;
                2) cpu_check ; menu ;;
                3) tcp_check ; menu ;;
                4) kernel_check ; menu ;;
                5) all_checks ; menu ;;
                        0) exit ; ;;
                        *) echo -e $red"Wrong option."$clear; WrongCommand;;
            esac

}


menu
