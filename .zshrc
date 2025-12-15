# Este es un ejemplo de configuración de .zshrc
# Normalmente, este archivo debería estar en tu directorio de inicio (~/.zshrc)
# Para usarlo, puedes moverlo o crear un enlace simbólico:
# mv /Users/macmini/.config/nvim/.zshrc ~/.zshrc
# O:
# ln -s /Users/macmini/.config/nvim/.zshrc ~/.zshrc

# Si usas Oh My Zsh, esta línea debe estar presente.
# Reemplaza con la ruta real de tu instalación de Oh My Zsh si es diferente.
export ZSH="$HOME/.oh-my-zsh"

# Establece el tema de Oh My Zsh.
# Consulta https://github.com/ohmyzsh/ohmyzsh/wiki/Themes para ver más.
ZSH_THEME="agnoster" # Un tema popular que muestra información de git.

# Activa los plugins que quieras.
# Aquí se incluye 'git' para las funcionalidades de git, y 'zsh-autosuggestions' y 'zsh-syntax-highlighting'
# (estos últimos pueden necesitar instalación adicional si no vienen con Oh My Zsh por defecto).
plugins=(
  git
  # zsh-autosuggestions
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Configuración adicional de git si es necesaria
# alias gits='git status'
# alias gitc='git commit -m'
# alias gitp='git push'
# alias gitl='git log --oneline --decorate --all --graph'

# Otras configuraciones de Zsh
# export PATH="/usr/local/bin:$PATH"
# export EDITOR="nvim"

# Fuente para el autocompletado de Zsh
# autoload -Uz compinit
# compinit
