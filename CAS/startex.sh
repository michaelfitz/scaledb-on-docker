#!/bin/bash


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




/usr/local/scaledb/lib/scaledb_cas   cas.cnf $CAS_IP $CAS_PORT 

