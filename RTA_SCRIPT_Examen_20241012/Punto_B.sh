#Resolviendo punto B

#!/bin/bash

#
echo -e "n\np\n1\n\n+1G\nn\np\n2\n\n+1G\nn\np\n3\n\n+1G\nw" | sudo fdisk /dev/sdc

#
echo -e "n\ne\n4\n\n\nn\nl\n\n+1G\nn\nl\n\n+1G\nn\nl\n\n+1G\nn\nl\n\n+1G\nn\nl\n\n+1G\nn\nl\n\n+1G\nw" | sudo fdisk /dev/sdc

#
for i in {1..10}; do
    sudo mkfs.ext4 "/dev/sdc${i}"
done

#
for i in {1..9}; do
    sudo mount "/dev/sdc${i}" "/Examenes-UTN/parcial_$i"
done
sudo mount "/dev/sdc10" /Examenes-UTN/profesores

#
for i in {1..9}; do
    echo "/dev/sdc${i} /Examenes-UTN/parcial_$i ext4 defaults 0 0" | sudo tee -a /etc/fstab
done
echo "/dev/sdc10 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab


