#!/bin/bash
showbanner()
{
sudo clear
echo "[*] i3-dope by 0xpsy [*]"
echo "************************"
echo ""
}

#checkroot()
#{
#if [ $EUID != "0" ]
#then
#echo "~ run : sudo ./install.sh"
#exit
#fi
#}

checkinternet()
{
if ping -q -c 1 -W 1 google.com &>/dev/null; then
  echo "~ Internet is up ..."
else
  echo "~ Internet is down ..."
  exit
fi
}

updaterepo()
{
echo "~ updating repo ..."
sudo apt update -y -qq &>/dev/null
}

installpackage()
{
if command -v $1 &>/dev/null
then
echo "~ Found $1 ..."
sleep 1
else
echo "~ Instaling $1 ..."
sudo apt install $1 -y -qq &>/dev/null
fi
}

installohmyzsh()
{
if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]
then
echo "~ oh-my-zsh already installed ..."
else
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -q)"
fi
}

copyconfigs()
{
mkdir -p ~/.config/i3
mkdir -p ~/.config/compton
mkdir -p ~/.config/rofi
mkdir -p ~/.wallpaper
cp -r config/i3/config ~/.config/i3/config
sudo cp -r config/polybar /etc/
cp -r config/feh/fehbg ~/.fehbg
cp -r config/wallpaper/23.jpg ~/.wallpaper/23.jpg
}


showbanner
checkinternet
updaterepo
installpackage zsh
installpackage rofi
installpackage i3-gaps
installpackage x-terminal-emulator
installpackage polybar
installpackage compton
installpackage feh
installpackage flameshot
copyconfigs
installohmyzsh
