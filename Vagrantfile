Vagrant.require_version ">= 1.8.1"
Vagrant.configure(2) do |config|

    config.vm.box = "bento/centos-7.3"
    config.vm.box_version = ">= 1.9.4"
    config.vm.hostname = "ANSIBLE"
	config.vm.synced_folder ".", "/vagrant"
    #config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
    config.ssh.username = "vagrant"
    config.ssh.password = "vagrant"
	
    config.vm.network :private_network, ip: "192.168.66.100", virtualbox__intnet: true
#    config.vm.network :public_network
    config.vm.provision :shell, path: "bootstrap.sh"

    config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        vb.customize ["modifyvm", :id, "--memory", "256"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.cpus = 1
        #vb.gui = true
    end
    config.vm.provider "vmware_workstation" do |vw|
     # Display the VirtualBox GUI when booting the machine
     vw.gui = false

     # Customize the amount of memory on the VM:
     vw.memory = "256"
   end

end
