# Nvim config fork from lazyVim and inspired in [Takuya Matsuyama](https://www.devas.life/) developer

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Instalacion

### Clonar Repositorio
``` git clone git@github.com:Simonmg/nvim-2025.git ```

### Dependencias globales de node

#### typescript Language Server
``` npm install -g typescript-language-server typescript ```
#### Visual studio code servers
``` npm install -g vscode-langservers-extracted ```
#### Herramientas opcionales (linux/Mac)
``` brew install ripgrep fd ```

### Keymaps basico (tabs, panes) y moviminetos basicos (hjkl) (izquierda, abajo, arriba, derecha)
![Captura de pantalla 2024-10-31 a la(s) 9 11 47 a  m](https://github.com/user-attachments/assets/67cccae5-dec6-4fed-ad7a-d0681f15cc26)

### Explorador de archivos
| Keymap   | Description                                                                                         | mode    |
|----------|-----------------------------------------------------------------------------------------------------|---------|
| ```;f``` | Listar archivos en la ruta actual                                                                   | ```n``` |
| ```;r``` | Buscar piezas de codigo en los archivos de la ruta actual (mejora importante de la version anterior | ```n``` |
| ```;e``` | Lista los diagnosticos del codigo del archivo actual                                                | ```n``` |
| ```;s``` | Lista funciones, variables del archivo actual                                                       | ```n``` |
| ```sf``` | Abre el explorador de archivos                                                                      | ```n``` |
