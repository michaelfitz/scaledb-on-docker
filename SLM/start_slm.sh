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
echo $CAS_IP
echo "SLM_IP= "$CAS_IP




/usr/local/scaledb/lib/scaledb_slm   slm.cnf


