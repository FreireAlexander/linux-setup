NEWLINE=$'\n'
### HEAD glyphs
symbol1=$'\ue0b0' # 
symbol2=$'\ue0b4' # 
symbol3=$'\ue0b8' # 
symbol4=$'\ue0c0' # 
symbol5=$'\ue0d1' # 
symbol6=$'\ue0cc' # 
symbol7=$'\ue0c8' # 
symbol8=$'\ue0ce' # 
symbol9=$'\ue0c4' # 
symbol10=$'\ue0d2' # 
### TAIL glyphs
symbol11=$'\ue0b2' # 
symbol12=$'\ue0b6' # 
symbol13=$'\ue0be' # 
symbol14=$'\ue0c2 ' # 
symbol15=$'\ue0ca ' # 
symbol16=$'\ue0c5 ' #  
symbol17=$'\ue0d4' # 
### Separators
symbol18=$'\ue0c6' #  
symbol19=$'\ue0c1' #  

head=$symbol1
tail=$symbol12
sep=$symbol4

### Color Palette inspired in google palettes https://www.color-hex.com/color-palette/1872
cgood=#008744
cerror=#d62d20
# Blue
c1=#0057e7
# Red
c2=#d62d20
# Yellow
c3=#ffa700
# Blue
c4=#0057e7
# Green
c5=#d62d20
# Red
c6=#d62d20
# white
fg=#ffffff

# Blue Palettes

blue1=#011f4b
blue2=#03396c
blue3=#005b96
blue4=#6497b1

### General Info
SYS_ICON="󱘊 "
#CLOCK="%K{$c3} %D{%H:%M:%S}  %k%F{$c3}$head%f"

## The return code print
ok_check_mark=%F{$cgood}%B" ✔ "%b%f
bad_check_mark=%F{$cerror}%B" ✘ "%b%f


# Virtual Enviroment Activated or no
virtualenv () {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        env="%K{$blue4}%F{$blue3}$sep%f   ${VIRTUAL_ENV:t}  %k%F{$blue4}$head%f "
        CLOCK="%K{$blue3}%F{$blue2}$sep%f  %D{%H:%M:%S}   %k"
    else
        env=""
        CLOCK="%K{$blue3}%F{$blue2}$sep%f  %D{%H:%M:%S}  %k%F{$blue3}$head%f"
    fi
}

git_plugin(){
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        git_prompt=$(git branch --show-current)
    else
        git_prompt=""
    fi
}

segment_start(){
    local bg texto info bgnext
    [[ -n $1 ]] && bg=$1 || bg=""
    [[ -n $2 ]] && bg=$2
    echo "%F{$1}$tail%f%K{$1}%F{$2}$3%f%k%K{$4}%F{$1}$sep%k%f"
}

prompt_dir(){
    segment_start $blue1 $fg ' freire %~ ' 'none'
}
return_code=%(?.$ok_check_mark.$bad_check_mark)

precmd(){
    virtualenv
    git_plugin
    PROMPT="%B╭%F{$blue1}$tail%f%K{$blue1} $SYS_ICON %n %k%K{$blue2}%F{$blue1}$sep%f  %~  %k$CLOCK$env$NEWLINE╰$return_code %b"
    #RPROMPT="%K{$1}Hola $git_prompt%k lo mio $(prompt_dir)"

}