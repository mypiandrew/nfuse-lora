 #!/bin/bash
 
 GATEWAY_EUI=`cat /opt/ttn-gateway/bin/euid.txt`
 
 echo 
 echo " #################################################################"
 echo 
 echo                   GATEWAY EUID = $GATEWAY_EUI
 echo
 echo "    Open TTN console and register your gateway using your EUI: "
 echo "         https://console.thethingsnetwork.org/gateways "
 echo 
 echo " #################################################################"
 echo
 