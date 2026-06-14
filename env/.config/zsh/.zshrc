# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/.zsh_profile
source $HOME/personal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/personal/zsh-autosuggestions/zsh-autosuggestions.zsh
. "/home/roddyk/.deno/env"
eval "$(opam env)"
source ~/personal/powerlevel10k/powerlevel10k.zsh-theme
#eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.toml)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
