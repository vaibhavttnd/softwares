#
# Cookbook Name:: spinen-grails
# Recipe:: default
#
# Copyright (C) 2015 SPINEN
#
# Licensed under the MIT license.
# A copy of this license is provided at the root of this cookbook.
#

include_recipe 'ark::default'

ark 'grails' do
  url node['grails']['url']
  checksum node['grails']['checksum']
  home_dir node['grails']['home']
  version node['grails']['version']
end



#vaibhav
#
#bash 'java and grails home' do
#  code <<-EOH
#export GRAILS_HOME=/usr/local/grails-2.5.1
#export JAVA_HOME=/usr/lib/jvm/java-8-oracle-amd64
#PATH=$PATH:$GRAILS_HOME/bin:$JAVA_HOME/bin
#export GRAILS_HOME
#export JAVA_HOME
#export PATH   
#
#    EOH
#end

ruby_block 'set-env-java-grails-home-path' do
  block do
    ENV['JAVA_HOME'] = '/usr/lib/jvm/java-8-oracle-amd64'
    ENV['GRAILS_HOME'] = '/usr/local/grails-2.5.1'
    ENV['PATH']="#{ENV['PATH']}:#{ENV['GRAILS_HOME']}/bin:#{ENV['JAVA_HOME']}/bin"
    action :create
  end
end




#bash 'path' do
#  code <<-EOH
#PATH=$PATH:$GRAILS_HOME/bin:$JAVA_HOME/bin
#export GRAILS_HOME
#export JAVA_HOME
#export PATH   

#    EOH
#end


