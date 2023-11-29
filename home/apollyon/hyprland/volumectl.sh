#!/usr/bin/env sh

# define functions

function print_error
{
    cat << "EOF"
    ./volumecontrol.sh -[device] <action>
    ...valid device are...
        i -- [i]nput decive
        o -- [o]utput device
    ...valid actions are...
        i -- <i>ncrease volume [+5]
        d -- <d>ecrease volume [-5]
        m -- <m>ute [x]
EOF
    exit 1
}

function notify_vol
{
    vol=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -c 11-`
    angle="$(( (($vol+2)/5) * 5 ))"
    ico="${icodir}/vol-${angle}.svg"
    bar=$(seq -s "." $(($vol / 15)) | sed 's/[0-9]//g')
    dunstify $ncolor "volctl" -a "$vol" "$nsink" -i $ico -r 91190 -t 800 -h int:value:$vol
}
#  -i $ico
function notify_mute
{
    mute=`pamixer $srce --get-mute | cat`
    if [ "$mute" == "true" ] ; then
        dunstify $ncolor "volctl" -a "muted" "$nsink" -i ${icodir}/muted-${dvce}.svg -r 91190 -t 800
    else
        dunstify $ncolor "volctl" -a "unmuted" "$nsink" -i ${icodir}/unmuted-${dvce}.svg -r 91190 -t 800
    fi
}
# set device action

shift $((OPTIND -1))
step="${2:-5}"
icodir="~/.config/dunst/icons/vol"

gtkMode=`gsettings get org.gnome.desktop.interface color-scheme | sed "s/'//g" | awk -F '-' '{print $2}'`
ncolor="-h string:bgcolor:#191724 -h string:fgcolor:#faf4ed -h string:frcolor:#56526e"

if [ "${gtkMode}" == "light" ] ; then
    ncolor="-h string:bgcolor:#f4ede8 -h string:fgcolor:#9893a5 -h string:frcolor:#908caa"
fi

case $1 in
    i)  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        notify_vol ;;
    d)  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        notify_vol ;;
    m)  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        notify_mute ;;
    *) print_error ;;
esac
