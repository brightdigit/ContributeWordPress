daemon() {
    chsum1=""

    while [[ true ]]
    do
        chsum2=`find Content/ -type f -exec md5 {} \;`
        if [[ $chsum1 != $chsum2 ]] ; then           
            if [ -n "$chsum1" ]; then
                NPM_PATH=/Users/leo/.nvm/versions/node/v16.14.0/bin/npm swift run brightdigitwg publish
            fi
            chsum1=$chsum2
        fi
        sleep 2
    done
}

daemon