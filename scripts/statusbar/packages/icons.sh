#! /bin/bash
# ICONS 部分特殊的标记图标 这里是我自己用的，你用不上的话去掉就行

# source ~/.profile
DWM=$HOME/scripts
this=_icons
s2d_reset="^d^"
color="^c#2D1B46^^b#335566^"
signal=$(echo "^s$this^" | sed 's/_//')

update() {
    icons=("")
    # [ "$(sudo docker ps | grep 'v2raya')" ] && icons=(${icons[@]} "")
    icons=(${icons[@]} "")
    # [ "$(bluetoothctl info 88:C9:E8:14:2A:72 | grep 'Connected: yes')" ] && icons=(${icons[@]} "")
    icons=(${icons[@]} "")
    # [ "$AUTOSCREEN" = "OFF" ] && icons=(${icons[@]} "ﴸ")

    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    text=" ${icons[@]} "
    echo $text
    printf "export %s='%s%s%s%s'\n" $this "$color" "$signal" "$text" "$s2d_reset" >> $DWM/statusbar/temp
}

notify() {
    texts=""
    # [ "$(sudo docker ps | grep 'v2raya')" ] && texts="$texts\n v2raya 已启动"
    [ "$(/usr/bin/bluetooth | grep 'bluetooth = on')" ] && texts="$texts\n airpods pro 2 已链接"
    [ "$texts" != "" ] && notify-send " Info" "$texts" -r 9527
}

call_menu() {
    case $(echo -e '关机\n重启\n休眠\n挂起\n锁定' | rofi -dmenu -window-title power) in
        关机) poweroff ;;
        重启) reboot ;;
        休眠) sudo systemctl hibernate ;;
        挂起) sudo systemctl suspend ;;
        锁定) sh $HOME/scripts/lockscreen.sh ;;
    esac
}

click() {
    case "$1" in
        L) notify; feh --randomize --bg-fill /data/data/wallpaper/*.png ;;
        R) call_menu ;;
    esac
}

case "$1" in
    click) click $2 ;;
    notify) notify ;;
    *) update ;;
esac
