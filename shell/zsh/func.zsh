#! /usr/bin/env zsh

RESET="tput sgr0"
BOLD="tput bold"

RED="tput setaf 1"
GREEN="tput setaf 2"
YELLOW="tput setaf 3"
BLUE="tput setaf 4"
MAGENTA="tput setaf 5"
CYAN="tput setaf 6"

RED_BG="tput setab 1"
GREEN_BG="tput setab 2"
YELLOW_BG="tput setab 3"
BLUE_BG="tput setab 4"
MAGENTA_BG="tput setab 5"
CYAN_BG="tput setab 6"

show_level() {
    local level=$(lower "${1}")
    local style="${RESET}"

    case ${level} in
        'error')
            level=" ERROR "
            style="${RED}"
            ;;
        'warning')
            level=" WARNING "
            style="${YELLOW}"
            ;;
        'debug')
            level=" DEBUG "
            style="${RESET}"
            ;;
        *)
            level=" INFO "
            style="${CYAN}"
            ;;
    esac

    echo -n "[$(eval ${RESET})$(eval ${style})${level}$(eval ${RESET})]"
}

msg() {
    if [[ ${#} -gt 1 ]]; then
        local level="${1:-NONE}"; shift
        show_level "${level}"
    fi
    echo "${@}" | ts '[ %Y-%m-%dT%H:%M:%S ]'
}

log() {
    local level="${1:-NONE}"; shift
    local logfile="${2:-$(mktemp)}"; shift
    msg "${level}" "${@}" >> "${logfile}"
}

upper() {
    echo "${1}" | tr '[:lower:]' '[:upper:]'
}

lower() {
    echo "${1}" | tr '[:upper:]' '[:lower:]'
}

now() {
    echo $(date +"%Y-%m-%dT%H:%M:%S") "${@}"
}

mkcd() {
    if [[ -d "${1}" ]]; then
        cd "${1}"
    else
        mkdir -p "${1}" && cd "${1}"
    fi
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
