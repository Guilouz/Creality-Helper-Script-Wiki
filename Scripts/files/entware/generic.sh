#!/bin/sh

unset LD_LIBRARY_PATH
unset LD_PRELOAD

LOADER=ld.so.1
GLIBC=2.27

echo -e "Info: Removing old directories..."
rm -rf /opt
rm -rf /usr/data/opt

echo -e "Info: Creating directory..."
mkdir -p /usr/data/opt

echo -e "Info: Linking folder..."
ln -nsf /usr/data/opt /opt

echo -e "Info: Creating subdirectories..."
for folder in bin etc lib/opkg tmp var/lock
do
  mkdir -p /usr/data/opt/$folder
done

echo -e "Info: Downloading opkg package manager..."
URL="http://www.openk1.org/static/entware/mipselsf-k3.4/installer"
/tmp/curl -L "$URL/opkg" -o "/opt/bin/opkg"
/tmp/curl -L "$URL/opkg.conf" -o "/opt/etc/opkg.conf"

echo -e "Info: Applying permissions..."
chmod 755 /opt/bin/opkg
chmod 777 /opt/tmp

echo -e "Info: Installing basic packages..."
/opt/bin/opkg update
/opt/bin/opkg install entware-opt

echo -e "Info: Installing SFTP server support..."
/opt/bin/opkg install openssh-sftp-server; ln -s /opt/libexec/sftp-server /usr/libexec/sftp-server

echo -e "Info: Configuring files..."
for file in passwd group shells shadow gshadow; do
  if [ -f /etc/$file ]; then
    ln -sf /etc/$file /opt/etc/$file
  else
    [ -f /opt/etc/$file.1 ] && cp /opt/etc/$file.1 /opt/etc/$file
  fi
done

[ -f /etc/localtime ] && ln -sf /etc/localtime /opt/etc/localtime

echo -e "Info: Applying changes in system profile..."
echo 'export PATH="/opt/bin:/opt/sbin:$PATH"' > /etc/profile.d/entware.sh

echo -e "Info: Adding startup script..."
echo '#!/bin/sh\n/opt/etc/init.d/rc.unslung "$1"' > /etc/init.d/S50unslung
chmod 755 /etc/init.d/S50unslung
