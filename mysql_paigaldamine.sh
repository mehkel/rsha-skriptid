MYSQL=$(dpkg-query -W -f='${Status}' mysql-server>/dev/null | grep -c 'ok installed')

if [ $MYSQL -eq 0 ]; then
	echo "paigaldame mysql ja vajalikud lisad"
	apt install mysql-server
	echo "MYSQL on paigaldatud"

	touch $HOME/.my.cnf
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
elif [ $MYSQL -eq 1 ]; then
	echo "mysql-server on juba paigaldatud"
	mysql
fi
