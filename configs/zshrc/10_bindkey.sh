bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}" end-of-line
    
bindkey -e "\e[1~" beginning-of-line
bindkey -e "\e[4~" end-of-line
bindkey -e "\e[7~" beginning-of-line
bindkey -e "\e[8~" end-of-line
bindkey -e "\eOH" beginning-of-line
bindkey -e "\eOF" end-of-line
bindkey -e "\e[H" beginning-of-line
bindkey -e "\e[F" end-of-line
bindkey "^[[3~" delete-char
