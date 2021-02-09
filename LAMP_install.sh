APACHE2=$(dpkg-query -W -f='${Status}' apache2>/dev/null | grep -c 'ok installed')
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server>/dev/null | grep -c 'ok installed')
PHP=$(dpkg-query -W -f='${Status}' php7.0 2>/dev/null | grep -c 'ok installed')

if [ $APACHE2 -eq 0 ]; then
	echo "paigaldame apache2"
	apt install apache2 -y
	echo "Apache on paigaldatud"

if [ $MYSQL -eq 0 ]; then
	echo "paigaldame mysql ja vajalikud lisad"
	apt install mysql-server -y
	echo "MYSQL on paigaldatud"

	touch $HOME/.my.cnf
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
if [ $PHP -eq 0 ]; then
	echo "paigaldame php"
	apt install php7.0 libapache2-mod-php7.0 php7.0-mysql -y
	echo "PHP on paigaldatud"

elif [ $APACHE2 -eq 1 ]; then
	echo "apache2 on juba paigaldatud"
	service apache2 start
	service apache2 status

elif [ $MYSQL -eq 1 ]; then
	echo "mysql-server on juba paigaldatud"
	mysql

elif [ $PHP -eq 1 ]; then
	echo "PHP on juba paigaldatud"
	which php
fi
fi
fi
