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
          o.banner = "Usage: vagrant ttl"
        end
        
        argv = parse_options(opts)
        return if !argv || !File.exists?('Vagrantfile')
        
        conf = `vagrant ssh-config`
        name = conf.match(/Host (.+)\n/)[1]
        username = conf.match(/User (.+)\n/)[1]
        port = conf.match(/Port (.+)\n/)[1]
        keyfile = conf.match(/IdentityFile (.+)\n/)[1]
        hostname = conf.match(/HostName (.+)\n/)[1]
        
        macro = <<"EOS"
username = '#{username}'
keyfile = '#{keyfile}'
hostname = '#{hostname}'
msg = hostname
strconcat msg ':#{port} /ssh2 /auth=publickey /user='
strconcat msg username
strconcat msg ' /keyfile='
strconcat msg keyfile
connect msg
EOS
        begin 
          @env.ui.info("[ \e[32mINFO\e[0m ] Generating #{name}.ttl")
          File.open("#{name}.ttl", "wb") do |fout|
            fout.write(macro)
          end
        rescue
          @env.ui.info("[ \e[31mError \e[0m ] Generating #{name}.ttl")
        end
          
        0
        
      end
      
    end
    
  end
  
end
