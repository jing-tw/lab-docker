#!/bin/bash

function docker_proxy() {
    local file=/etc/default/docker
    sudo sed -i 's#^.*\bhttp_proxy\b.*$#http_proxy=http://10.110.15.60:8080#g' $file
   
    # restart the service
    sudo service docker restart

    echo "Docker Proxy: setup ok"
}

function docker_noproxy() {
    echo "docker proxy: removed"
    local file='/etc/default/docker'
    sudo sed -i '/http_proxy/s/^/#/g' $file 

    # restart the service
    sudo service docker restart
    echo "docker proxy: removed"

}

function apt_proxy(){
    local file=/etc/apt/apt.conf.d/01proxy
    echo "Acquire::http::Proxy \"http://10.110.15.60:8080\";" | sudo tee -a ${file}
    echo "Acquire::https::Proxy \"https://10.110.15.60:8080\";" | sudo tee -a ${file}

    echo "apt-get proxy: setup ok"
}


function apt_noproxy(){
    local file=/etc/apt/apt.conf.d/01proxy
    if [ -f ${file} ]
    then
       sudo rm ${file}
    else
       echo "apt_noproxy: apt_proxy had been removed!"
    fi

    echo "apt-get proxy: removed"
}

function ProxyNPM() {
  if [ "$bProxy" = true ]
  then
    echo "NPM Proxy Enabled"
#    npm config set strict-ssl false
#    npm config set registry "http://registry.npmjs.org/"
#    npm config set proxy http://10.110.15.61:8080/

     npm config set https-proxy http://10.110.15.61:8080/
  else
     npm config rm proxy
  fi

}

function ProxyGit() {
  if [ "$bProxy" = true ]
  then
    echo "Git Proxy Enabled"
    git config --global http.proxy http://10.110.15.60:8080
    git config --global https.proxy https://10.110.15.60:8080
  else
    echo "Git Proxy Disable"
    git config --global --unset http.proxy
    git config --global --unset https.proxy
  fi
}

function ProxySetup() {
  bProxy=true
  ProxyNPM
  ProxyGit
  docker_proxy
  apt_proxy
}

function NoProxy() {
  bProxy=false
  ProxyNPM
  ProxyGit
  docker_noproxy
  apt_noproxy
}
