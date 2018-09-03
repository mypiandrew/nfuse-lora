#!/bin/bash

# Stop on the first sign of trouble
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

echo "The Things Network Gateway installer for the NFuse mPCIe Concetrator"
echo "********************************************************************"
echo


INSTALL_DIR="/opt/ttn-gateway"
if [ ! -d "$INSTALL_DIR" ]; then mkdir $INSTALL_DIR; fi
if [ ! -d "$INSTALL_DIR/bin" ]; then mkdir "$INSTALL_DIR/bin"; fi

chmod +x *.sh
cp ./*.sh $INSTALL_DIR/bin/
cp ./ttn-gateway.service /lib/systemd/system/

cd $INSTALL_DIR

git clone https://github.com/Lora-net/picoGW_packet_forwarder.git
git clone https://github.com/Lora-net/picoGW_hal.git 


cd picoGW_hal
make clean all
cd ..
cd picoGW_packet_forwarder
make clean all
cd ..

ln -s $INSTALL_DIR/picoGW_packet_forwarder/lora_pkt_fwd/lora_pkt_fwd ./bin/lora_pkt_fwd
ln -s $INSTALL_DIR/picoGW_packet_forwarder/lora_pkt_fwd/global_conf.json ./bin/global_conf.json

# Start packet forwarder as a service

systemctl enable ttn-gateway.service

echo "Installation completed, system will reboot shortly to activate system"


echo "The system will reboot in 5 seconds..."
sleep 5
shutdown -r now
