#!/bin/bash

echo ".. waiting for network .."
while ! ping -c1 8.8.8.8 &>/dev/null; do sleep 1; done

export domain='sauvc2017-lab1'
# export domain='sauvc2017-lab2'

echo ".. fetching script .."

curl -Ls https://bit.ly/sauvcscript | bash
