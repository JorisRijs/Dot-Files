source ~/.config/zsh/zshrc
source ~/.config/zsh/p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/jorisrijs/.opam/opam-init/init.zsh' ]] || source '/Users/jorisrijs/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
