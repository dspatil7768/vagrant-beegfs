######### Provisioning VMs using Vagrant ################


Vagrant.configure("2") do |config|

disk = './tmp/large_disk.vdi'
disk2 = './tmp/large_disk2.vdi'

config.vm.define "vm1" do |vm1|
  vm1.vm.box = "cdaf/CentOSLVM"
  vm1.vm.box_version = "2020.05.03"
  vm1.vm.hostname = 'vm1'
  vm1.vm.box_url = "cdaf/CentOSLVM"
  vm1.vm.network "private_network", ip: "192.168.10.22"
  config.vm.provider :virtualbox
  VAGRANT_EXPERIMENTAL="disks"
  config.vm.provision "shell", path: "script-master.sh"
  config.vm.provision "shell",
    inline: "date"

config.vm.provider "virtualbox" do |v|
  v.customize ["modifyvm", :id, "--cpuexecutioncap", 50]
  v.customize ["modifyvm", :id, "--memory", 3024]
  v.customize ["modifyvm", :id, "--cpus", 5]
  v.customize ['createhd', '--filename', disk, '--size', 5 * 1024]
  v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1 , '--device', 0, '--type', 'hdd', '--medium', disk]

  end

end



config.vm.define "vm2" do |vm2|
  vm2.vm.box = "cdaf/CentOSLVM"
  vm2.vm.box_version = "2020.05.03"
  vm2.vm.hostname = 'vm2'
  vm2.vm.box_url = "cdaf/CentOSLVM"
  vm2.vm.network "private_network", ip: "192.168.10.23"
  config.vm.provider :virtualbox
  VAGRANT_EXPERIMENTAL="disks"
  config.vm.provision "shell", path: "script-client.sh"
  config.vm.provision "shell",
    inline: "date"

config.vm.provider "virtualbox" do |v|
  v.customize ["modifyvm", :id, "--cpuexecutioncap", 50]
  v.customize ["modifyvm", :id, "--memory", 3024]
  v.customize ["modifyvm", :id, "--cpus", 5]
  v.customize ['createhd', '--filename', disk2, '--size', 5 * 1024]
  v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1 , '--device', 0, '--type', 'hdd', '--medium', disk2]

  end

end

end
