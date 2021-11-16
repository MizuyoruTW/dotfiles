# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

CASE_SENSITIVE="true"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mizuyoru/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mizuyoru/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mizuyoru/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mizuyoru/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#User
#autoload -U history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
SAVEHIST=1000
setopt appendhistory
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY 
HISTFILE="$HOME/.zsh_history"
#source .zsh_bindkeys
alias aria2='xdg-open http://ariang.mayswind.net/latest/#!/downloading && aria2c'
alias wine="XMODIFIERS='' wine64"
alias wine32="WINEPREFIX='/home/mizuyoru/.wine32' WINEARCH=win32 wine"
alias yay="yay --aur"
alias sus="sudo pm-suspend"
alias honeygain="/home/mizuyoru/Project/bash/honeygain.sh"
alias tw="LC_ALL=zh_TW.UTF-8"
alias cn="LC_ALL=zh_CH.UTF-8"
alias jp="LC_ALL=ja_JP.UTF-8"
alias mv="mv -vi"
alias cp="cp -vi"
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias mount_private="/home/mizuyoru/Project/bash/mount_private.sh"
alias umount_private="sudo umount ~/Private"
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh

# enviroment variables
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx

# add this to prevent git auto-completion being slow
__git_files () {
    _wanted files expl 'local files' _files
}
