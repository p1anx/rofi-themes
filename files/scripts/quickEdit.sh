#!/bin/bash
tty=kitty
edit=${EDITOR:-nvim}
configs="$HOME/.config"

dir="$HOME/.config/rofi/quickedit/type-7"
theme='style-2'

## Run
menu_edit=()
menu_edit+=("hyprland")
menu_edit+=("mybin")
menu_edit+=("vim")
menu_edit+=("nvim")
menu_edit+=("kitty")
menu_edit+=("rofi")
menu_edit+=("waybar")
menu_edit+=(".zshrc")
menu_edit+=(".bashrc")
menu_edit+=("tmux")
menu_edit+=("git-hyprdots")
#// launch rofi
menu() {
  cat <<EOF
1.Edit ${menu_edit[0]}
2.Edit ${menu_edit[1]}
3.Edit ${menu_edit[2]}
4.Edit ${menu_edit[3]}
5.Edit ${menu_edit[4]}
6.Edit ${menu_edit[5]}
7.Edit ${menu_edit[6]}
8.Edit ${menu_edit[7]}
9.Edit ${menu_edit[8]}
10.Edit ${menu_edit[9]}
11.Edit ${menu_edit[10]}
12.Edit ${menu_edit[11]}
13.Edit ${menu_edit[12]}
14.Edit ${menu_edit[13]}
15.Edit ${menu_edit[14]}
16.Edit ${menu_edit[15]}
EOF
}

# Main function to handle menu selection

# rofi -show "${r_mode}" -theme-str "${r_scale}" -theme-str "${r_override}" -theme-str "${i_override}" -config "${roconf}"
main() {
  # choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/selector.rasi | cut -d. -f2)

  choice=$(menu | rofi -show -i -dmenu -theme ${dir}/${theme}.rasi | cut -d' ' -f2)


  echo "$choice"

  # Map choices to corresponding files
  case $choice in
  "hyprland") file="$configs/hypr/hyprland.conf" ;;
  "vim") file="$configs/vim/vimrc" ;;
  "nvim") file="$configs/nvim/init.lua" ;;
  "kitty") file="$configs/kitty/kitty.conf" ;;
  "rofi") file="$configs/rofi/selector.rasi" ;;
  "waybar") file="$configs/waybar/config.jsonc" ;;
  ".zshrc") file="$HOME/.zshrc" ;;
  ".bashrc") file="$HOME/.bashrc" ;;
  "mybin") file="$scrDir/quick_edit.sh" ;;
  "tmux") file="$HOME/.tmux.conf" ;;
  "git-hyprdots") file="$GIT_PATH/hyprdots/" ;;
  *) return ;; # Do nothing for invalid choices
  esac

  # Open the selected file in the terminal with the text editor
  $tty -e $edit "$file"
}
main

