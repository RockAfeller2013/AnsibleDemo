Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu22.04"  # Change the box if needed
  config.vm.provider "vmware_desktop" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
