# set PATH so it includes user's private bin if it exists
# 
# VIMMODESW defines whether or not VIM-MODE plugins and dedicated prompt will be activated
# VIMMODESW='norm' normal mode
# VIMMODESW='vim' vim mode

VIMMODESW='norm'

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes nvim bin if it exists
if [ -d "/opt/nvim-linux-arm64/bin" ] ; then
    PATH="/opt/nvim-linux-arm64/bin:$PATH"
fi

# set PATH so it includes fzf bin if it exists
if [ -d "$HOME/.fzf/bin" ] ; then
    PATH="$HOME/.fzf/bin:$PATH"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#Show vi mode in prompt
if [ "$VIMMODESW" = "vim" ] ; then

  source "${HOME}/.config/omp/ompvimode"

  #Add in zsh plugins
  #Vi-mode
  zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
fi

#Completions
zinit light zsh-users/zsh-completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no

if [ "$VIMMODESW" != "vim" ] ; then
  bindkey -v
fi

#Keybindings
bindkey '^l' autosuggest-accept
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -U compinit && compinit

#FZF
#In order to customize FZF look visit https://vitormv.github.io/fzf-themes/
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
#if all fils are to be shown add --unrestricted
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS='--preview "batcat -p --color=always --line-range :500 {}"'
export FZF_ALT_C_OPTS='--preview "eza -T --color=always --icons=always --level=2 {} | head -200"'
#export FZF_COMPLETION_PATH_OPTS='--preview "batcat -p --color=always {}"'
#export FZF_COMPLETION_DIR_OPTS='--preview "eza -T --color=always --icons=always --level=2 {}"'
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza -T --color=always --icons=always --level=2 {} | head -200' "$@" ;;
    *)            fzf --preview 'batcat -p --color=always --line-range :500 {}' "$@" ;;
  esac
}
_fzf_compgen_path() {
  fdfind --type f --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}


if [ "$VIMMODESW" != "vim" ] ; then
  # Add fzf-git window for manage GIT (don't work because of CTRL-G conflict with vim-mode plugin)
  source "${HOME}/.local/share/fzf-git/fzf-git.sh"
fi

export BAT_THEME=gruvbox-dark

#Syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

#Autosuggestions
zinit light zsh-users/zsh-autosuggestions

#Add in snippets
#zinit snippet OMZP::git
#zinit snippet OMZP::sudo	
#zinit snippet OMZP::archlinux	
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::command-not-found

#zinit cdreplay -q

#FZF integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/omp/dan_${VIMMODESW}.omp.json)"
