#普通用户下启动不了lmgrd的话就在root下启动
#!/bin/sh
lmutil lmhostid  
/sbin/runlevel
sudo cp $PGI/linux86-64/15.10/bin/lmgrd.rc /etc/init.d/lmgrd
ln -s /etc/init.d/lmgrd /etc/rc3.d/S90lmgrd
cd /opt/pgi
lmgrd -c license.dat
