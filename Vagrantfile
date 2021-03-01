Vagrant.configure("2") do |config|

config.vm.define "vm1" do |vm1|
  vm1.vm.box = "centos/7"
  vm1.vm.hostname = 'vm1'
  vm1.vm.box_url = "centos/7"
  config.disksize.size = '100GB'
  vm1.vm.network "private_network", ip: "192.168.10.22"
  config.vm.provider :virtualbox
  VAGRANT_EXPERIMENTAL="disks"
  ##config.vm.disk :disk, name: "backup", size: "10GB"
  config.vm.provision "shell", path: "script-master.sh"
  config.vm.provision "shell",
    inline: "yum install epel-release htop -y"

end

config.vm.define "vm2" do |vm2|
  vm2.vm.box = "centos/7"
  vm2.vm.hostname = 'vm2'
  vm2.vm.box_url = "centos/7"
  config.disksize.size = '100GB'
  vm2.vm.network "private_network", ip: "192.168.10.23"
  config.vm.provider :virtualbox
  VAGRANT_EXPERIMENTAL="disks"
  ##config.vm.disk :disk, name: "backup", size: "10GB"
  config.vm.provision "shell", path: "script-client.sh"
  config.vm.provision "shell",
     inline: "yum install epel-release htop -y"

end
end
