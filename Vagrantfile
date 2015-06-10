# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Setup a shared folder for code editing outside vm
  config.vm.synced_folder "app", "/home/vagrant/app"

  # User berkshelf for provisioning
  config.berkshelf.enabled = true

  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true


  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby_build"
    chef.add_recipe "libffi-dev"
    chef.add_recipe "java"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mongodb-10gen"
    chef.add_recipe "ark"
    chef.add_recipe "jmeter-custom"
    chef.add_recipe "chef-dk"
    chef.add_recipe "nmon"

    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ["2.2.2", "jruby-1.7.19"],
          global: "2.2.2",
        }]
      },
      mysql: {
        server_root_password: ''
      },
      java: {
        "install_flavor" => "oracle",
        "jdk_version" => "8",
        "oracle" => { "accept_oracle_download_terms" => true }
      }
    }
  end
end
