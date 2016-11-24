#!/bin/bash
function install_module(){
    npm install csv
    npm install fast-csv
    npm install sprintf-js
    sudo apt-get install libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
    npm install canvas
}

. ./system.sh

function Main() {
  System

  #install_module
  node hardcode.js error_env_2d_i_0.csv error_env_2d_i_0
}


Main

#install_module
