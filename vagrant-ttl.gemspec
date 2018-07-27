# -*- encoding: utf-8 -*-
require File.expand_path("../lib/vagrant-ttl/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "vagrant-ttl"
  s.version     = VagrantTtl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["chihiro hasegawa"]
  s.email       = ["mail@alicemcas.com"]
  s.homepage    = "http://github.com/owlinux1000/vagrant-ttl/"
  s.summary     = %q{Generate a TeraTerm macro from `vagrant ssh-config`}
  s.description = %q{Generate a TeraTerm macro from `vagrant ssh-config`}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vagrant-ttl"

#  s.add_dependency "popen4", "~> 0.1.2"
#  s.add_dependency "thor", "> 0.14"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
