#!/bin/bash
echo 'Установка AUR (aurman)'
sudo pacman -Syy
sudo pacman -S git --noconfirm

#Ставим зависимость expac-git
git clone https://aur.archlinux.org/expac-git.git
cd expac-git
makepkg -si --noconfirm
cd ..
rm -rf expac-git

#Ставим aurman
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si --noconfirm --skippgpcheck
cd ..
rm -rf aurman

echo 'Установка программ'
sudo pacman -S firefox ufw cherrytree gimp libreoffice libreoffice-fresh-ru screenfetch vlc qt4 qbittorrent f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils gnome-calculator file-roller p7zip unrar gvfs aspell-ru pulseaudio --noconfirm 
aurman -S dropbox sublime-text2 hunspell-ru pamac-aur --noconfirm 

echo 'Установка тем'
aurman -S osx-arc-shadow breeze-obsidian-cursor-theme papirus-maia-icon-theme-git --noconfirm

echo 'Создаем нужные директории'
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

echo 'Качаем и устанавливаем настройки Xfce'
# Чтобы сделать копию ваших настоек XFCE перейдите в домашнюю директорию ~/username откройте в этой категории терминал и выполните команду ниже.
# tar -czf xfce4.tar.gz .config/xfce4
# Выгрузите архив в интернет и скорректируйте ссылку на XFCE файл заменив ссылку на свою.
cd ~/Downloads
wget raw.githubusercontent.com/viktor1962/arch2018/master/attach/xfce4.tar.gz
rm -rf ~/.config/xfce4
tar -xzf xfce4.tar.gz -C /

echo 'Ставим лого ArchLinux в меню'
  wget git.io/arch_logo.png
sudo mv -f ~/Downloads/arch_logo.png /usr/share/pixmaps/arch_logo.png

echo 'Ставим обои на рабочий стол'
wget git.io/bg.jpg
sudo rm -rf /usr/share/backgrounds/xfce/* #Удаляем стандартрые обои
sudo mv -f ~/Downloads/bg.jpg /usr/share/backgrounds/xfce/bg.jpg
rm -rf ~/Загрузки/*

echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Установка завершена!'

