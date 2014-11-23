#!/bin/bash

mkdir data
mkdir logs
chmod +x /scaledb-0.2.5/lib/scaledb_cas
chmod +x /scaledb-0.2.5/lib/scaledb_slm

export LD_LIBRARY_PATH=/scaledb-0.2.5/lib:${LD_LIBRARY_PATH}



function get_cas_ip {
   export  CAS_IP=`ping -c1 -n $HOSTNAME  | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g" `
 }

 get_cas_ip
echo $CAS_IP
echo "SLM_IP= "$CAS_IP



sed -e "s|OPENSHIFT_MARIADB_DB_HOST|${CAS_IP}|" slm.cnf.1  > slm.cnf.2
sed -e "s|CASP_PORT_4306_TCP_PORT|${CASP_PORT_4306_TCP_PORT}|" slm.cnf.2  > slm.cnf.3
sed -e "s|CASP_PORT_4306_TCP_ADDR|${CASP_PORT_4306_TCP_ADDR}|" slm.cnf.3  > slm.cnf



/scaledb-0.2.5/lib/scaledb_slm   slm.cnf

