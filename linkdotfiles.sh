#!/bin/bash

wget https://github.com/dracula/alacritty/archive/master.zip
unzip master.zip

current_dir="$PWD"
config_dir="$HOME/.config"

mv "$current_dir/alacritty-master/dracula.toml" "$current_dir/.config/alacritty/themes/"
rm -rf "$current_dir/master.zip"
rm -rf "$current_dir/alacritty-master"

mkdir -p "$config_dir"

dotfiles=(
    ".bashrc"
    ".vimrc"
    ".config/alacritty/alacritty.toml"
    ".config/alacritty/themes/dracula.toml"
)

for file in "${dotfiles[@]}"; do
    source_file="$current_dir/$file"
    destination="$HOME/$file"

    if [ -e "$destination" ]; then
        rm -rf "$destination"
        echo "Removed $destination"
    fi

    mkdir -p "$(dirname "$destination")"
    ln -s "$source_file" "$destination"
    echo "Linked $source_file -> $destination"
done
