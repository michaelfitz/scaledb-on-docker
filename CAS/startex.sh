#!/bin/bash

#mkdir data
#mkdir logs
chmod +x /usr/local/scaledb/lib/scaledb_cas
chmod +x /usr/local/scaledb/lib/scaledb_slm

export LD_LIBRARY_PATH=/usr/local/scaledb/lib:${LD_LIBRARY_PATH}



function get_cas_ip {
   export  CAS_IP=`ping -c1 -n $HOSTNAME  | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g" `
 }

 get_cas_ip
CAS_PORT=4306
echo $CAS_IP
echo "CAS_IP= "$CAS_IP
echo "CAS_PORT= "$CAS_PORT

echo $CAS1_PORT_4306_TCP_ADDR > t9

export MYCAS=$CAS1_PORT_4306_TCP_ADDR 
export CAS1_PORT_4306_TCP_ADDR=$CAS1_PORT_4306_TCP_ADDR
echo $MYCAS > t11


( set -o posix ; set ) > t22

Pocasip=`cat t22     | grep $casname"_.*TCP_ADDR" | cut -d '=' -f 2`
echo $Pocasip >t23


scaledb_cas_server_ips=${CAS_IP}
scaledb_cas_server_ports=${CAS_PORT}



#sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${CAS_IP}|" cas.cnf.1 > cas.cnf.2
#sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${CAS_PORT}|" cas.cnf.2 > cas.cnf


casid=1

max_cases=1000
while test $max_cases -ge 0
do
    max_cases=$(($max_cases-1))
    casname="CAS$casid"

echo "CASNAME="$casname

    casip=`cat t22     | grep $casname"_.*TCP_ADDR" | cut -d '=' -f 2`
    casport=`cat t22   | grep $casname"_.*TCP_PORT" | cut -d '=' -f 2`

echo "CASSIP="$casip
echo "CASPPORT="$casport
echo "-CAS--"$Pocasip

    if [ -z "$casip" ];then
        echo " failed to acquire CAS_IP for $casname"
        break
    fi

    if [ -z "$casport" ];then
        echo "ERROR - failed to acquire CAS_PORT for $casname"
        break
    fi

        scaledb_cas_server_ips="$scaledb_cas_server_ips,$casip"
        scaledb_cas_server_ports="$scaledb_cas_server_ports,$casport"

    casid=$(($casid+1))
done

if [ $max_cases -lt 0 ];then
    echo ERROR - detected too many cases, probably error in configuration
    exit 1
fi

echo $scaledb_cas_server_ips
echo $scaledb_cas_server_ports
export $scaledb_cas_server_ips
echo $scaledb_cas_server_ips >t6


sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${scaledb_cas_server_ips}|" cas.cnf.1 > cas.cnf.2
sed -e "s|OPENSHIFT_MARIADB_DB_PORT|${scaledb_cas_server_ports}|" cas.cnf.2 > cas.cnf



/usr/local/scaledb/lib/scaledb_cas   cas.cnf $CAS_IP $CAS_PORT 

