#!/bin/sh

if [[ $1 == bit.ly/* ]]; then
        curl_response=$(curl -s -w "%{http_code}" "$1")
        if [ ${curl_response: -3} == 301 ]; then
            curl -s $1 | grep href | cut -d '"' -f2
        fi
fi