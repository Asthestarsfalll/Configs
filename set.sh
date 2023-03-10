echo "set back-up" | lolcat
echo "Update config of LunarVIM" | lolcat

ls -1 ~/.config/lvim
cp -r ~/.config/lvim/* ./backup/LunarVim/Linux/lvim/

echo "Update config of fish" | lolcat

ls -1 ~/.config/fish
cp -r ~/.config/fish/* ./backup/Fish/


echo "Update config of oh-my-fish" | lolcat

ls -1 $OMF_PATH/themes/agnoster/functions
cp -r $OMF_PATH/themes/agnoster/functions/* ./backup/oh-my-fish/theme/


echo "Update config of rofi" | lolcat

ls -1 ~/.config/rofi/
cp ~/.config/rofi/config.rasi .backup/rofi/config.rasi
cp /usr/share/rofi/themes/arthur.rasi ./backup/rofi/arthur

echo "Update scripts" | lolcat

ls -1 ~/scripts/
cp -r ~/scripts/* ./scripts/

echo "set config" | lolcat
echo "set config of LunarVIM" | lolcat

ls -1 ./LunarVim/Linux/lvim/
cp -r ./LunarVim/Linux/lvim/ ~/.config/ 

echo "set config of fish" | lolcat

ls -1 ./Fish/
cp -r ./Fish/* ~/.config/fish/

echo "set config of oh-my-fish" | lolcat

ls -1 ./oh-my-fish/theme/
cp -r ./oh-my-fish/theme/* $OMF_PATH/themes/agnoster/functions/


echo "set config of rofi" | lolcat

ls -1 ./rofi/
cp ./rofi/config.rasi ~/.config/rofi/config.rasi
cp ./rofi/arthur.rasi /usr/share/rofi/themes/

