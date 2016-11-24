#!/bin/bash

sudo docker run -it \
    -v $HOME/.config/nvim:/root/.config/nvim \
    -v "$PWD":/usr/src/app -w /usr/src/app \
    --name my_neovim \
    c0f
