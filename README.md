# The Things Network: n-Fuse 

Reference setup for [The Things Network](http://thethingsnetwork.org/) gateways based on the n-Fuse mPCIe USB concentrator

Plug mPCIe Lora Concentrator card into unit, note which socket the card has been installed into, take care to fit the antenna BEFORE power up.

Connect unit to ethernet and log in as root user 

Run the below to clone the rep

  git clone https://github.com/mypiandrew/nfuse-lora.git
  chmod +x *.sh
  
Next edit start.sh and alter the config based on the unit you are using the card in

  # Reset PIN -- uncomment only one
  # MyPi IoT Integrator board mPCIe slot
  # GPIO23 - mPCIe Modem Emergency Reset (Fit LK12 to enable)
  SX1301_RESET_BCM_PIN=23
  # EdgeGateway mPCIe2 (Left hand side mPCIe)
  # GPIO22 - mPCIe-2 Modem Emergency Reset 
  #SX1301_RESET_BCM_PIN=22
  # GPIO41 - mPCIe-1 Modem Emergency Reset 
  # EdgeGateway mPCIe1 (Right hand side mPCIe)
  #SX1301_RESET_BCM_PIN=41

Next run install.sh to start the install process, answer "Y" to any apt-get install questions

On completion you will next need to configure your unit on "The Things Network" (TTN) to do this we first need the EUI of the unit.

Log back in and type the following :

  cd /opt/ttn-gateway/bin/
  ./showeui.sh

The system will then print out the EUI of the unit

Goto the website below and register a new account, adding a new gateway 
  
  https://console.thethingsnetwork.org/ 

  
Note that it takes between 1-10mins for the system to attempt a connection and to show as "connected" on TTN dashboard


Information about the state of the unit can be found by running the command below :

  service ttn-gateway status


