# -*- mode: ruby -*-
# vi: set ft=ruby :
if ENV['WHICH_COMPUTER'] == 'desktop'
    EXTRA_HDD_PATH = "/home/ml/hdd/vagrant_hdd.vdi"
else
    EXTRA_HDD_PATH = "/home/ml/vagrant_hdd.vdi" # MODIFY: Put path here for virtual HDD
end
SYNC_FOLDER_HOST = "/home/ml/hdd/vm/shared"
SYNC_FOLDER_GUEST = "/home/vagrant/shared"


Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.vm.hostname = "pbs-vm"
  config.vm.synced_folder "/tmp", "/vagrant", disabled: 'true'
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = 1
  end

  config.vm.network "private_network", ip: "192.168.1.2"
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "main.yml"
  end

  # https://stackoverflow.com/questions/21050496/vagrant-virtualbox-second-disk-path
  config.vm.provider "virtualbox" do | p |
        unless File.exist?(EXTRA_HDD_PATH)
            p.customize ['createhd', '--filename', EXTRA_HDD_PATH, '--size', 20 * 1024]
        end
        p.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', EXTRA_HDD_PATH]
  end
end
