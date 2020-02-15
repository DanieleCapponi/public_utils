# In the menu of your VirtualBox VM:
# Devices -> Insert Guest Additions CD Image
# In you host:
mkdir /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
sudo /media/cdrom/VBoxLinuxAdditions.run
reboot
