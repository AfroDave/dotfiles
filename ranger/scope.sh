#!/usr/bin/env sh
path="${1}"
width="${2}"
height="${3}"

maxln=200

mimetype=$(file --mime-type -Lb "${path}")
extension=${path##*.}

try() { output=$(eval '"${@}"'); }
dump() { echo "${output}"; }
trim() { head -n "${maxln}"; }

highlight() { command highlight "$@"; test $? = 0 -o $? = 141; }

case "$extension" in
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
    rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        try als "${path}" && { dump | trim; exit 0; }
        try acat "${path}" && { dump | trim; exit 3; }
        try bsdtar -lf "${path}" && { dump | trim; exit 0; }
        exit 1;;
    rar)
        try unrar -p- lt "${path}" && { dump | trim; exit 0; } || exit 1;;
    pdf)
        try pdftotext -l 10 -nopgbrk -q "${path}" - && \
            { dump | trim | fmt -s -w ${width}; exit 0; } || exit 1;;
    htm|html|xhtml)
        try w3m    -dump "${path}" && { dump | trim | fmt -s -w ${width}; exit 4; }
        try lynx   -dump "${path}" && { dump | trim | fmt -s -w ${width}; exit 4; }
        try elinks -dump "${path}" && { dump | trim | fmt -s -w ${width}; exit 4; }
        ;;
esac

case "$mimetype" in
    text/* | */xml)
        try highlight --out-format=ansi "${path}" && { dump | trim; exit 5; } || exit 2;;
    image/*)
        img2txt --gamma=0.6 --width="${width}" "${path}" && exit 4 || exit 1;;
    video/* | audio/*)
        exiftool "${path}" && exit 5
esac

exit 1
