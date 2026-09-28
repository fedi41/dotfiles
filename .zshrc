# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# --- FZF ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --- ZOXIDE ---
eval "$(zoxide init --cmd cd zsh)"
# --- ALIASES ---
alias ff='fastfetch'

# terminal-wakatime setup
export PATH="$HOME/.wakatime:$PATH"
eval "$(terminal-wakatime init zsh)"
# no correction
unsetopt correct
unsetopt correct_all
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# Created by `pipx` on 2026-09-12 07:51:29
export PATH="$PATH:/home/fedi41/.local/bin"



# iNiR environment
export INIR_VENV="/home/fedi41/.local/state/quickshell/.venv"
export ILLOGICAL_IMPULSE_VIRTUAL_ENV="$INIR_VENV"
# Apply terminal color sequences (Material You from wallpaper)
if [ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]; then
  cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

# confirmations, etc.) must go above this block; everything else may go below.

# pomotui
export PATH="/home/fedi41/.pomotui/bin:$PATH"
