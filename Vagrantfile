# -*- mode: ruby; -*-

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", inline: "sudo usermod -aG docker vagrant"
end
