#!/usr/bin/env sh

install_packer() {
  PACKER_DIRECTORY="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packer/start/packer.nvim"

  if ! [ -d "$PACKER_DIRECTORY" ]; then
    git clone "https://github.com/wbthomason/packer.nvim" "$PACKER_DIRECTORY"
  fi
}

bootstrap_plugins() {
  nvim -u NONE \
    +'autocmd User PackerComplete quitall' \
    +'lua require("plugin_specification")' \
    +'lua require("packer").sync()'
}

install_packer
bootstrap_plugins
