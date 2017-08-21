# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

require 'json'

config = JSON.parse(File.read(File.join(File.dirname(__FILE__),'./files/qs-cfg.json')))
server = config["servers"]

Vagrant.configure("2") do |config|
    config.vm.define server["name"]
    config.vm.box = server["box"]

    # config.vm.network "private_network", ip: server["ip"]

    config.vm.provider :virtualbox do |v, override|
        v.name = server["name"]
        v.linked_clone = true
        v.customize ['setextradata', :id, 'GUI/ScaleFactor', '1.25']
        v.customize ["modifyvm", :id, "--memory", server["memory"]]
        v.customize ["modifyvm", :id, "--cpus", server["cpus"]]
        v.customize ["modifyvm", :id, "--vram", server["vram"]]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]

    end
    config.vm.hostname = server["name"]
    config.vm.synced_folder "./files", "c:/installation/"
    config.vm.synced_folder "../shared-content", "c:/shared-content/"
    config.vm.provision :shell, path: "./scripts/provisioner.ps1"

end
