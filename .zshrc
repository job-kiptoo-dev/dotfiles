export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting )

VIM=NVIM
source $ZSH/oh-my-zsh.sh


export PATH="$HOME/.local/bin:$PATH"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t main || tmux new-session -s main
# fi

alias vim=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# bun completions
[ -s "/home/captain/.bun/_bun" ] && source "/home/captain/.bun/_bun"

export JAVA_HOME="/usr/lib/jvm/java-24-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/captain/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
