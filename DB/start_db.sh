#!/bin/bash

mkdir scaledb/data
mkdir scaledb/logs

export LD_LIBRARY_PATH=/scaledb-0.2.5/lib:${LD_LIBRARY_PATH}



function get_cas_ip {
   export  CAS_IP=`ping -c1 -n $HOSTNAME  | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g" `
 }

 get_cas_ip
echo $CAS_IP
echo "DB_IP= "$CAS_IP
echo "CASP_ADDRESS= "$CASP_PORT_4306_TCP_ADDR


sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${CAS_IP}|" my.cnf.1  > my.cnf
sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${CASP_PORT_4306_TCP_ADDR}|" scaledb.cnf.1  > scaledb.cnf
mv scaledb.cnf /mariadb-10.0.12-linux-x86_64/data


#sed -e "s|CASP_PORT_4306_TCP_PORT|${CASP_PORT_4306_TCP_PORT}|" slm.cnf.2  > slm.cnf.3
#sed -e "s|CASP_PORT_4306_TCP_ADDR|${CASP_PORT_4306_TCP_ADDR}|" slm.cnf.3  > slm.cnf

cp /scaledb-0.2.5/lib/ha_scaledb.so /mariadb-10.0.12-linux-x86_64/lib/plugin


/mariadb-10.0.12-linux-x86_64/scripts/mysql_install_db  --basedir=/mariadb-10.0.12-linux-x86_64 --defaults-file=/my.cnf
/mariadb-10.0.12-linux-x86_64/bin/mysqld --defaults-file=/my.cnf  --user=root &
sleep 10
/mariadb-10.0.12-linux-x86_64/bin/mysql  -uroot -e "INSTALL PLUGIN scaledb SONAME 'ha_scaledb.so'"
echo "GRANT ALL ON *.* to root@'%'; flush privileges;" | /mariadb-10.0.12-linux-x86_64/bin/mysql -uroot 

/bin/bash
