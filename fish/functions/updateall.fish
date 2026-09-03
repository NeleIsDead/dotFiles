function updateall --wraps='yay -Syu && sudo pacman -Syu' --description 'alias updateall yay -Syu && sudo pacman -Syu'
    yay -Syu && sudo pacman -Syu $argv
end
