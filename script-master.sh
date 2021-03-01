getenforce

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g'  /etc/selinux/config

cat /etc/selinux/config
setenforce 0
sestatus 
getenforce
cat /etc/selinux/config


cat <<EOT > b.repo
[beegfs]
name=BeeGFS 7.2 (rhel7)
# If you have an active BeeGFS support contract, use the alternative URL below
# to retrieve early updates. Replace username/password with your account for
# the BeeGFS customer login area.
#baseurl=https://username:password@www.beegfs.io/login/release/beegfs_7.2/dists/rhel7
baseurl=https://www.beegfs.io/release/beegfs_7.2/dists/rhel7
gpgkey=https://www.beegfs.io/release/beegfs_7.2/gpg/RPM-GPG-KEY-beegfs
gpgcheck=0
enabled=1
EOT

echo "192.168.10.22 vm1" > /etc/hosts
echo "192.168.10.23 vm2" >> /etc/hosts

cp b.repo /etc/yum.repos.d/

yum clean all

yum repolist

yum install -y  wget

wget ftp://ftp.pbone.net/mirror/ftp.scientificlinux.org/linux/scientific/7.0/x86_64/updates/security/kernel-devel-3.10.0-862.2.3.el7.x86_64.rpm

yum install -y kernel-devel-3.10.0-862.2.3.el7.x86_64.rpm

wget http://linuxsoft.cern.ch/cern/centos/7/updates/x86_64/Packages/kernel-headers-3.10.0-862.2.3.el7.x86_64.rpm

yum install -y kernel-headers-3.10.0-862.2.3.el7.x86_64.rpm

yum -y install beegfs-mgmtd  beegfs-meta  beegfs-storage beegfs-client beegfs-helperd beegfs-utils


mkdir -p /mgmt/beegfs/beegfs_mgmtd
mkdir -p /meta-data/beegfs/beegfs_meta
mkdir -p /storage1/beegfs_storage1
mkdir -p /storage2/beegfs_storage2

/opt/beegfs/sbin/beegfs-setup-mgmtd -p /data/beegfs/beegfs_mgmtd beegfs
/opt/beegfs/sbin/beegfs-setup-meta -p /meta-data/beegfs/beegfs_meta -s 2 -m beegfs
/opt/beegfs/sbin/beegfs-setup-storage -p /storage1/beegfs_storage -s 3 -i 201 -m beegfs
/opt/beegfs/sbin/beegfs-setup-storage -p /storage2/beegfs_storage -s 3 -i 202 

/opt/beegfs/sbin/beegfs-setup-client -m beegfs

systemctl start beegfs-mgmtd
systemctl status beegfs-mgmtd
systemctl start beegfs-meta



systemctl status beegfs-meta

systemctl start beegfs-storage

systemctl status beegfs-storage
systemctl start beegfs-helperd

systemctl status beegfs-helperd
systemctl start beegfs-client

systemctl status  beegfs-client

df -TH

echo "systemctl start beegfs-mgmtd beegfs-meta beegfs-storage beegfs-helperd  beegfs-client" >> /etc/rc.local


df -h
