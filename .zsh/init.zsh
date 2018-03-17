
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v fasd >/dev/null && eval "$(fasd --init auto)"

command -v fzf >/dev/null && {
  fzf_path="$(dirname $(realpath $(which fzf)))/.."
  source "$fzf_path/shell/completion.zsh"
  source "$fzf_path/shell/key-bindings.zsh"
  unset fzf_path
}
