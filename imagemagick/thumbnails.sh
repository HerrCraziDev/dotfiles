#!/bin/bash

function checkImagemagick {
    printf "Checking for Imagemagick convert..."
    convert -version > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        printf "[\e[32mOK\e[0m]\n"
        return 0
    else
        printf "[\e[31mError\e[0m]\nImagemagick not found.\n"
        return 1
    fi
}

function installpkg {
    printf "Installing package %s...\n\e[90m" $1

    apt install -y $1

    if [ $? -eq 0 ]; then
        printf "\e[0m[\e[32mOK\e[0m] Package %s successfully installed !\n" $1
        return 0
    else
        printf "\e[0m[\e[31mError\e[0m]\nFailed to install %s\n" $1
        return 1
    fi
}



# Check for Imagemagick install
checkImagemagick
if [ $? -eq 1 ]; then
    installpkg "imagemagick"
    checkImagemagick
fi


# Check thumbnails directory
if [ ! -e "thumbs" ]; then

    printf "Creating thumbnails directory (thumbs/)..."
    mkdir "thumbs" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        printf "[\e[32mOK\e[0m]\n"
    else
        printf "[\e[31mError\e[0m]\nCan't create 'thumbs/' directory ! Check your permissions\n"
        exit 1
    fi

else
    printf "Thumbnails directory found [\e[32mOK\e[0m]\n"
fi


# Generate/update thumbnails for each JPG found
count=$(ls *.* | wc -l)
i=0

for file in *.*; do
    if [ ! -e $file ]; then continue; fi    # Ignore inexistant files

    let i=i+1
    printf "Processing file %d of %d [%s]\r" $i $count $file
    convert $file -resize x256 -strip thumbs/$file
done

printf "\e[32m✔\e[0m Processed %d thumbnails successfully\n" $count
