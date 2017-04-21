# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/centos67"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
  end

  config.vm.define :app do |c|
    c.vm.network "private_network", ip: "192.168.133.120"
    # c.vm.provision :shell, inline: <<-SCRIPT
    #    echo "test"

    # SCRIPT
  end

  # config.vm.define :db do |c|
  #  c.vm.network "private_network", ip: "192.168.133.121"
  #  c.vm.provision :shell, inline: <<-SCRIPT
  #  SCRIPT
  #end


  # config.vm.provision :shell, :inline => script
  # config.vm.provision :ansible do |ansible|
    # ansible.groups = {
      # "app" => [:app],
      # "api" => [:api],
      # "development:children" => ["app", "api"],
    # }
    # ansible.playbook = 'provision/playbook.yml'
  # end
end
