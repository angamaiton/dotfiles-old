local _old_path="$PATH"

# Local config
[[ -f ~/.local/zshenv ]] && source ~/.local/zshenv

if [[ $PATH != $_old_path ]]; then
  # `colors` isn't initialized yet, so define a few manually
  typeset -AHg fg fg_bold
  if [ -t 2 ]; then
    fg[red]=$'\e[31m'
    fg_bold[white]=$'\e[1;37m'
    reset_color=$'\e[m'
  else
    fg[red]=""
    fg_bold[white]=""
    reset_color=""
  fi

  cat <<MSG >&2
${fg[red]}Warning:${reset_color} your \`~/.local/zshenv' configuration seems to edit PATH entries.
Please move that configuration to \`.local/zshrc' like so:
  ${fg_bold[white]}cat ~/.local/zshenv >> ~/.local/zshrc && rm ~/.local/zshenv${reset_color}

(called from ${(%):-%N:%i})

MSG
fi

unset _old_path