#!/bin/bash

apt-get -y install software-properties-common

# enpass
#echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list
#wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add -

# spotify
#echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# mariadb
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
echo "deb [arch=amd64,arm64,ppc64el] http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.3/ubuntu bionic main" > /etc/apt/sources.list.d/mariadb.list

# nodejs yarn
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# php/apache
add-apt-repository -yn ppa:ondrej/php
add-apt-repository -yn ppa:ondrej/apache2
add-apt-repository -yn ppa:ondrej/nginx

# keepass
add-apt-repository -yn ppa:jtaylor/keepass

# git
add-apt-repository -yn ppa:git-core/ppa

# upgrade packages
apt update
apt -y upgrade

# auto install packages
apt install -y \
mariadb-server gnome-tweak-tool keepass2 git apache2 thunderbird thunderbird-locale-de wine-stable filezilla zip unzip unrar vlc nodejs yarn imagemagick optipng jpegoptim \
gir1.2-gtop-2.0 gir1.2-networkmanager-1.0 gir1.2-clutter-1.0 \
remmina remmina-plugin-nx remmina-plugin-rdp remmina-plugin-telepathy remmina-plugin-vnc remmina-plugin-xdmcp  \
php5.6 php5.6-fpm php5.6-cgi php5.6-cli php5.6-common php5.6-curl php5.6-gd php5.6-imap php5.6-intl php5.6-json php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-opcache php5.6-soap php5.6-sqlite3 php5.6-xml php5.6-zip \
php7.3 php7.3-fpm php7.3-cgi php7.3-cli php7.3-common php7.3-curl php7.3-gd php7.3-imap php7.3-intl php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-soap php7.3-sqlite3 php7.3-xml php7.3-zip \
libapache2-mod-fcgid \
php-imagick php-imap

# install phpstorm
snap install phpstorm --classic

# can be optionally installed. modify it to your own needs.
# apt install -y nautilus-dropbox enpass-beta spotify-client resilio-sync

# enable modules und set php7.3 as default
# use php-fpm: https://tecadmin.net/install-apache-php-fpm-ubuntu/
a2enmod headers deflate gzip rewrite actions fastcgi alias proxy_fcgi
a2enconf php7.3-fpm
service apache2 restart
update-alternatives --set php /usr/bin/php7.3
