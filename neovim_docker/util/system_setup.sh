#!/bin/bash

. ./util.sh
function system_setup(){
	local c
	printf "== System Setup ==\n\
	0) No Proxy\n\
	1) Proxy Setup\n"

	read -p "Enter your choice " c
	case $c in
		0)	NoProxy ;;
		1)	ProxySetup ;;
		*)	
			echo "Invalid Input"
			pause
	esac
}

