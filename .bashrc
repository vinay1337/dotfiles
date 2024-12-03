# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##### MY ADDITIONS #####

## nnn (terminal file manager) settings - https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_zsh
#n ()
#{
#    # Block nesting of nnn in subshells
#    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
#        echo "nnn is already running"
#        return
#    fi
#
#    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
#    # To cd on quit only on ^G, remove the "export" as in:
#    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
#    # NOTE: NNN_TMPFILE is fixed, should not be modified
#    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
#
#    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
#    # stty start undef
#    # stty stop undef
#    # stty lwrap undef
#    # stty lnext undef
#
#    nnn "$@"
#
#    if [ -f "$NNN_TMPFILE" ]; then
#            . "$NNN_TMPFILE"
#            rm -f "$NNN_TMPFILE" > /dev/null
#    fi
#}

# Color shortcuts
nc='\[\e[0m\]' # no color/text reset
# regular colors
blk='\[\e[0;30m\]'
red='\[\e[0;31m\]'
grn='\[\e[0;32m\]'
ylw='\[\e[0;33m\]'
blu='\[\e[0;34m\]'
pur='\[\e[0;35m\]'
cyn='\[\e[0;36m\]'
wht='\[\e[0;37m\]'
# bold colors
bldblk='\[\e[1;30m\]'
bldred='\[\e[1;31m\]'
bldgrn='\[\e[1;32m\]'
bldylw='\[\e[1;33m\]'
bldblu='\[\e[1;34m\]'
bldpur='\[\e[1;35m\]'
bldcyn='\[\e[1;36m\]'
bldwht='\[\e[1;37m\]'
# underline colors
undblk='\[\e[4;30m\]'
undred='\[\e[4;31m\]'
undgrn='\[\e[4;32m\]'
undylw='\[\e[4;33m\]'
undblu='\[\e[4;34m\]'
undpur='\[\e[4;35m\]'
undcyn='\[\e[4;36m\]'
undwht='\[\e[4;37m\]'
# background colors
bakblk='\[\e[40m\]'
bakred='\[\e[41m\]'
bakgrn='\[\e[42m\]'
bakylw='\[\e[43m\]'
bakblu='\[\e[44m\]'
bakpur='\[\e[45m\]'
bakcyn='\[\e[46m\]'
bakwht='\[\e[47m\]'


##### BFApps #####

export XES_USERNAME="vjanardhanam"
export XES_PASSWORD="$(base64 --decode /home/vjanardhanam/.auth)"

##### CUSTOM SCRIPTS #####

xtelnet() {
    local host="$1"
    local port="$2"
    
    if [ -z "$host" ] || [ -z "$port" ]; then
        echo "Usage: xtelnet <hostname> <port>"
        return 1
    fi
    
    while true; do
        reset
        telnet "$host" "$port"
        sleep 2
    done
}


##### CUSTOM SHELL PROMPT #####

function parse_git_dirty {
  git diff --quiet HEAD &>/dev/null
  [[ $? == 1 ]] && echo "*"
}

function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "git:$branch$(parse_git_dirty)"
}
GIT="\$(parse_git_branch)"

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "venv:$venv "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

__git_ps1 ()
{
    local exit=$?;
    local pcmode=no;
    local detached=no;
    local ps1pc_start='\u@\h:\w ';
    local ps1pc_end='\$ ';
    local printf_format=' (%s)';
    case "$#" in
        2 | 3)
            pcmode=yes;
            ps1pc_start="$1";
            ps1pc_end="$2";
            printf_format="${3:-$printf_format}";
            PS1="$ps1pc_start$ps1pc_end"
        ;;
        0 | 1)
            printf_format="${1:-$printf_format}"
        ;;
        *)
            return $exit
        ;;
    esac;
    local ps1_expanded=yes;
    [ -z "${ZSH_VERSION-}" ] || [[ -o PROMPT_SUBST ]] || ps1_expanded=no;
    [ -z "${BASH_VERSION-}" ] || shopt -q promptvars || ps1_expanded=no;
    local repo_info rev_parse_exit_code;
    repo_info="$(git rev-parse --git-dir --is-inside-git-dir            --is-bare-repository --is-inside-work-tree     --short HEAD 2>/dev/null)";
    rev_parse_exit_code="$?";
    if [ -z "$repo_info" ]; then
        return $exit;
    fi;
    local short_sha="";
    if [ "$rev_parse_exit_code" = "0" ]; then
        short_sha="${repo_info##*
}";
        repo_info="${repo_info%
*}";
    fi;
    local inside_worktree="${repo_info##*
}";
    repo_info="${repo_info%
*}";
    local bare_repo="${repo_info##*
}";
    repo_info="${repo_info%
*}";
    local inside_gitdir="${repo_info##*
}";
    local g="${repo_info%
*}";
    if [ "true" = "$inside_worktree" ] && [ -n "${GIT_PS1_HIDE_IF_PWD_IGNORED-}" ] && [ "$(git config --bool bash.hideIfPwdIgnored)" != "false" ] && git check-ignore -q .; then
        return $exit;
    fi;
    local r="";
    local b="";
    local step="";
    local total="";
    if [ -d "$g/rebase-merge" ]; then
        __git_eread "$g/rebase-merge/head-name" b;
        __git_eread "$g/rebase-merge/msgnum" step;
        __git_eread "$g/rebase-merge/end" total;
        if [ -f "$g/rebase-merge/interactive" ]; then
            r="|REBASE-i";
        else
            r="|REBASE-m";
        fi;
    else
        if [ -d "$g/rebase-apply" ]; then
            __git_eread "$g/rebase-apply/next" step;
            __git_eread "$g/rebase-apply/last" total;
            if [ -f "$g/rebase-apply/rebasing" ]; then
                __git_eread "$g/rebase-apply/head-name" b;
                r="|REBASE";
            else
                if [ -f "$g/rebase-apply/applying" ]; then
                    r="|AM";
                else
                    r="|AM/REBASE";
                fi;
            fi;
        else
            if [ -f "$g/MERGE_HEAD" ]; then
                r="|MERGING";
            else
                if [ -f "$g/CHERRY_PICK_HEAD" ]; then
                    r="|CHERRY-PICKING";
                else
                    if [ -f "$g/REVERT_HEAD" ]; then
                        r="|REVERTING";
                    else
                        if [ -f "$g/BISECT_LOG" ]; then
                            r="|BISECTING";
                        fi;
                    fi;
                fi;
            fi;
        fi;
        if [ -n "$b" ]; then
            :;
        else
            if [ -h "$g/HEAD" ]; then
                b="$(git symbolic-ref HEAD 2>/dev/null)";
            else
                local head="";
                if ! __git_eread "$g/HEAD" head; then
                    return $exit;
                fi;
                b="${head#ref: }";
                if [ "$head" = "$b" ]; then
                    detached=yes;
                    b="$(
                                case "${GIT_PS1_DESCRIBE_STYLE-}" in
                                (contains)
                                        git describe --contains HEAD ;;
                                (branch)
                                        git describe --contains --all HEAD ;;
                                (tag)
                                        git describe --tags HEAD ;;
                                (describe)
                                        git describe HEAD ;;
                                (* | default)
                                        git describe --tags --exact-match HEAD ;;
                                esac 2>/dev/null)" || b="$short_sha...";
                    b="($b)";
                fi;
            fi;
        fi;
    fi;
    if [ -n "$step" ] && [ -n "$total" ]; then
        r="$r $step/$total";
    fi;
    local w="";
    local i="";
    local s="";
    local u="";
    local c="";
    local p="";
    if [ "true" = "$inside_gitdir" ]; then
        if [ "true" = "$bare_repo" ]; then
            c="BARE:";
        else
            b="GIT_DIR!";
        fi;
    else
        if [ "true" = "$inside_worktree" ]; then
            if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ] && [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
                git diff --no-ext-diff --quiet || w="*";
                git diff --no-ext-diff --cached --quiet || i="+";
                if [ -z "$short_sha" ] && [ -z "$i" ]; then
                    i="#";
                fi;
            fi;
            if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ] && git rev-parse --verify --quiet refs/stash > /dev/null; then
                s="$";
            fi;
            if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ] && [ "$(git config --bool bash.showUntrackedFiles)" != "false" ] && git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' > /dev/null 2> /dev/null; then
                u="%${ZSH_VERSION+%}";
            fi;
            if [ -n "${GIT_PS1_SHOWUPSTREAM-}" ]; then
                __git_ps1_show_upstream;
            fi;
        fi;
    fi;
    local z="${GIT_PS1_STATESEPARATOR-" "}";
    if [ $pcmode = yes ] && [ -n "${GIT_PS1_SHOWCOLORHINTS-}" ]; then
        __git_ps1_colorize_gitstring;
    fi;
    b=${b##refs/heads/};
    if [ $pcmode = yes ] && [ $ps1_expanded = yes ]; then
        __git_ps1_branch_name=$b;
        b="\${__git_ps1_branch_name}";
    fi;
    local f="$w$i$s$u";
    local gitstring="$c$b${f:+$z$f}$r$p";
    if [ $pcmode = yes ]; then
        if [ "${__git_printf_supports_v-}" != yes ]; then
            gitstring=$(printf -- "$printf_format" "$gitstring");
        else
            printf -v gitstring -- "$printf_format" "$gitstring";
        fi;
        PS1="$ps1pc_start$gitstring$ps1pc_end";
    else
        printf -- "$printf_format" "$gitstring";
    fi;
    return $exit
}

# PS1="${boldblue}[\A] ${boldgreen}\w ${boldcyan}${VENV}${boldyellow}${GIT}\n${purple}>> ${nc}"
PS1="${blu}[\A] ${grn}\w ${cyn}${VENV}${ylw}${GIT}\n${pur}>> ${nc}"

export TERM=xterm-256color
bind 'set show-all-if-ambiguous on'
bind 'set colored-completion-prefix on'
