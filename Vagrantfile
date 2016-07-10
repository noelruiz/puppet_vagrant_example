# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
# vm source: https://atlas.hashicorp.com/vStone/boxes/centos-7.x-puppet.3.x/versions/4.3.26.1
DB_CENTOS_BOX_NAME    = "vStone/centos-7.x-puppet.3.x"
DB_CENTOS_BOX_VERSION = "4.3.26.1"
Vagrant.configure(2) do |config|
  config.ssh.pty = true
  # --------------------------- DEMO NODE 1 -----------------------------------
  config.vm.define 'demo1' do |demo1|
    demo1.vm.box = DB_CENTOS_BOX_NAME
    demo1.vm.box_version = DB_CENTOS_BOX_VERSION


    # Setup netowrking and port forwarding
    demo1.vm.hostname = "demo1.local.host.com"
    demo1.vm.network 'private_network', ip: '11.33.33.101'
    demo1.vm.network 'forwarded_port', guest: 3200, host: 3201

    demo1.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
    demo1.vm.synced_folder '.', '/home/vagrant/puppet_vagrant_example', nfs: false
    demo1.vm.provision "shell", :inline => "sh /home/vagrant/puppet_vagrant_example/pre_tasks.sh"

    demo1.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 1048]
    end
    demo1.vm.provision :puppet do |puppet|
      # puppet.binary_path = '/usr/local/bin'
      puppet.manifests_path = 'puppet'
      #puppet.module_path = '/etc/puppet/modules/'
      puppet.manifest_file  = 'site.pp'
      puppet.options        = '--verbose'
   end
  end
  # --------------------------- DEMO NODE 2 -----------------------------------
    config.vm.define 'demo2' do |demo2|
      demo2.vm.hostname = "demo2.local"
      demo2.vm.box = DB_CENTOS_BOX_NAME
      demo2.vm.box_version = DB_CENTOS_BOX_VERSION


      # Setup netowrking and port forwarding
      demo2.vm.hostname = "demo2.local.host.com"
      demo2.vm.network 'private_network', ip: '11.33.33.102'
      demo2.vm.network 'forwarded_port', guest: 3200, host: 3202

      demo2.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
      demo2.vm.synced_folder '.', '/home/vagrant/puppet_vagrant_example', nfs: false
      demo2.vm.provision "shell", :inline => "sh /home/vagrant/puppet_vagrant_example/pre_tasks.sh"

      demo2.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 1024]
      end

       demo2.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet'
        puppet.manifest_file  = 'site.pp'
        puppet.options        = '--verbose'
      end
    end

end
