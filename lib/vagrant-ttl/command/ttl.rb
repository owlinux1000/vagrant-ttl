# coding: utf-8
require 'optparse'

module VagrantTtl
  
  module Command
    
    class CommandTtl < Vagrant.plugin("2", :command)

      def self.synopsis
        %q{Generate a TeraTerm macro from `vagrant ssh-config`}
      end
      
      def execute
        
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant ttl [machine-name]"
        end
        
        argv = parse_options(opts)
        argv = ["default"] if !argv
        
        ssh_info = nil
        
        with_target_vms(argv) do |machine|

          if machine.state.id == :poweroff
            @env.ui.info("[ \e[31mError\e[0m ] #{machine.name} is poweroff. Please execute `vagrant up`")
            next
          end
          
          ssh_info = machine.ssh_info
          
          macro = <<"EOS"
username = '#{ssh_info[:username]}'
keyfile = '#{ssh_info[:private_key_path][0]}'
hostname = '#{ssh_info[:host]}'
msg = hostname
strconcat msg ':#{ssh_info[:port]} /ssh2 /auth=publickey /user='
strconcat msg username
strconcat msg ' /keyfile='
strconcat msg keyfile
connect msg
EOS
          begin 
            File.open("#{machine.name}.ttl", "wb") do |fout|
              fout.write(macro)
            end
            @env.ui.info("[ \e[32mINFO\e[0m ] Generating #{machine.name}.ttl")            
          rescue
            @env.ui.info("[ \e[31mError \e[0m ] Generating #{machine.name}.ttl")
          end
          
        end
        
        0
        
      end
      
    end
    
  end
  
end
