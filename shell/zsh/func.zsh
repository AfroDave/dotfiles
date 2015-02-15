#! /usr/bin/env zsh

mkcd() {
    if [ -d "${1}" ] ; then
        cd "${1}"
    else
        mkdir -p "${1}" && cd "${1}"
    fi
}

calc() {
    qalc -t "${@}"
}

agent() {
    local -a envoy
    envoy=(envoy -t gpg-agent)

    case "${1:-list}" in
        start)
            source <(${envoy} -p)
            ;;
        stop)
            ${envoy} -K
            ;;
        list)
            ${envoy} -l
            ;;
        print)
            ${envoy} -p
            ;;
    esac
}

aur() {
    case "${1}" in
        up)
            pushd "${HOME}/dev/aur"
            cower -duf
            popd
            ;;
        find)
            cower -s "${2}"
            ;;
        dl)
            cower -d "${2}"
            ;;
    esac
}
