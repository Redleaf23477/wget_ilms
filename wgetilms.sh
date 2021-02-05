#!/bin/bash

function entire {

    wget \
        -o log.txt \
        --accept-regex='.*(course|read_attach).*' --reject-regex='.*(index|courseID=35478).*' \
        -e robots=off --adjust-extension \
        --load-cookies=ilms-cookie.txt \
        --mirror -p -k \
        --timeout=120 \
        https://lms.nthu.edu.tw/home.php?f=allcourse # 歷年課程檔案

}

function specific {

    while read -r url
    do
        wget \
            -o log.txt \
            --accept-regex='.*(course|read_attach).*' --reject-regex='.*(index|courseID=35478).*' \
            -e robots=off --adjust-extension \
            --load-cookies=ilms-cookie.txt \
            --mirror -p -k \
            ${url}
    done <course.txt

}

if [ "$1" = "entire" ] || [ "$1" == "specific" ] 
then
    $1
else
    echo "unknown parameter $1"
    echo ""
    echo "usage:"
    echo "wgetilms.sh (entire|specific)"
    echo ""
    echo "entire: downloading all courses"
    echo ""
    echo "specific: downloading specific courses (urls) listed in 'course.txt'"
    echo ""
fi


