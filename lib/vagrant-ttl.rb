require "vagrant"

module VagrantTtl
  
  class Plugin < Vagrant.plugin("2")
    
    name "vagrant-ttl"
    description %q{Generate a TeraTerm macro from vagrant `ssh-config`}
    
    command("ttl") do
      require File.expand_path("../vagrant-ttl/command/ttl", __FILE__)
      Command::CommandTtl
    end
  end
  
end
