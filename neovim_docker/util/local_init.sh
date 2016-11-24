#!/bin/bash
. ./system.sh

function install_module(){
    npm install csv
    npm install fast-csv
    npm install sprintf-js
#    sudo apt-get install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
 #   npm install canvas
}

function InstallPackage() {
  System

  install_module
} 

InstallPackage
