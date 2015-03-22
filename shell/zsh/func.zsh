#! /usr/bin/env zsh

mkcd() {
    if [[ -d "${1}" ]] ; then
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

    case "${1:-start}" in
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

browser() {
    if [[ -t 0 ]]; then
        if [[ -n "${1}" ]]; then
            xdg-open "${1}" 2> /dev/null
        fi
    else
        t="/tmp/browser.${RANDOM}.html"
        cat /dev/stdin > "${t}"
        xdg-open "${t}" 2> /dev/null
    fi
}
