# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/centos67"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
  end

  config.vm.define :default do |c|
    c.vm.network "private_network", ip: "192.168.133.90"
  end

  # config.vm.provision :ansible do |ansible|
    # ansible.groups = {
      # "app" => [:app],
      # "api" => [:api],
      # "development:children" => ["app", "api"],
    # }
    # ansible.playbook = 'provision/playbook.yml'
  # end
end
