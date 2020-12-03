# Install raspbery pi
For this tutorial I will use a raspberry pi 3 b+ but it will work on newer rasbery pi also.
You will also need a sd card with a capacity of 8GB, and a sd card reader that you can connect to your PC.
Lastly you will need to have a keyboard/mouse to be able to execute the installation.


##### Download and install BalenaEtcher 
BalenaEtcher support Linux, windows and even Mac. https://www.balena.io/etcher/

#### Download Ubuntu mate 20.04
https://cdimage.ubuntu.com/ubuntu-mate/releases/20.04/release/ubuntu-mate-20.04.1-desktop-amd64.iso


1. Start BalenaEtcher and open the downloaded iso.
2. Insert the SD card to the PC 
3. Press "Select Target" in balenaEtcher and chose your sd card.
4. Press Flash
5. After the flashing is done insert the sd card in your raspbarry pi.
6. Start the installtion of ubuntu mate.
7. After installation is done run the following command "sudo apt install openssh-server && sudo apt install net-tools && sudo apt install openjdk-14-jdk"
8. Enter the command "ifconfig" and take a note ip address of the rasberry pi.
9. Now you can remove the keyboard and mouse from your pi.
10. Start a ssh session to the raspberry pi by entering "ssh username@0.0.0.0" replace 0.0.0.0 with the acutal ip address of the pi, and the username with the usename you chosed under installation.
