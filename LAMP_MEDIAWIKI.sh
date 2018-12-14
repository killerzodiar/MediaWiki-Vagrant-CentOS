#!/usr/bin/env bash
echo “INSTALANDO LAMP EN CENTOS 7”
echo
echo “INSTALANDO APACHE WEB SERVER”
yum install -y httpd
echo
echo “INSTALANDO MARIADB”
yum install mariadb-server -y
echo
echo “INSTALANDO PHP-MYSQL”
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils
yum-config-manager --enable remi-php70
yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
yum -y install php-xml php-mbstring
echo
echo “ACTIVANDO Y EJECUTANDO SERVICIO DE APACHE”
systemctl enable httpd
systemctl start httpd
echo
echo “ACTIVANDO Y EJECUTANDO EL SERVICIO MARIADB”
systemctl enable mariadb
systemctl start mariadb
echo
yum -y install
sudo yum -y  install wget
wget https://releases.wikimedia.org/mediawiki/1.31/mediawiki-1.31.1.tar.gz
tar -zxvf mediawiki-1.31.1.tar.gz -C /var/www/html
mv /var/www/html/mediawiki-1.31.1 /var/www/html/mediawiki

#Lo descomprimimos en la ubicación
#La asignamos los permisos correspondientes
chmod 755 /var/www/html/mediawiki -R
chown apache:apache /var/www/html/mediawiki -R

#Crear base de datos:
sudo mysql -e "CREATE DATABASE bdwiki CHARACTER SET utf8 COLLATE utf8_Spanish_ci;"
sudo mysql -e "CREATE USER 'uwiki'@'bdwiki' identified by 'uwiki';"
sudo mysql -e "GRANT ALL PRIVILEGES ON bdwiki.* to 'uwiki' IDENTIFIED BY 'uwiki';"
sudo mysql -e "FLUSH PRIVILEGES;"
