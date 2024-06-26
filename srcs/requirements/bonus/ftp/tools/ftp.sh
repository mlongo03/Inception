#!/bin/bash

service vsftpd start

adduser --disabled-password --gecos "" $ftp_user

echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd &> /dev/null

echo "$ftp_user" | tee -a /etc/vsftpd.userlist &> /dev/null

mkdir /home/$ftp_user/ftp

chown nobody:nogroup /home/$ftp_user/ftp
chmod a-w /home/$ftp_user/ftp

mkdir /home/$ftp_user/ftp/files
chown $ftp_user:$ftp_user /home/$ftp_user/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$ftp_user/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd
