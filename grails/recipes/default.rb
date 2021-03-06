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


#cookbook_file '/home/ubuntu/path.sh' do
#  source 'path.sh'
#  owner 'root'
#  group 'root'
#  mode '0777'
#  action :create
#  notifies :run, 'bash[source]', :immediately
#end


#execute 'path.sh' do
# command '. /home/ubuntu/path.sh'
# action :nothing
#end

#bash 'source' do
#  user 'root'
#  cwd '/home/ubuntu'
#  code <<-EOH
#  source /home/ubuntu/path.sh
#  EOH
#end


bash 'source' do
  cwd '/home/ubuntu'
  code <<-EOH
  echo "export GRAILS_HOME=/usr/local/grails-2.5.1" >> /home/ubuntu/.bashrc
  echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle-amd64" >> /home/ubuntu/.bashrc
  echo "PATH=$PATH:$GRAILS_HOME/bin:$JAVA_HOME/bin" >> /home/ubuntu/.bashrc
  echo "export GRAILS_HOME" >> /home/ubuntu/.bashrc
  echo "export JAVA_HOME" >> /home/ubuntu/.bashrc
  echo "export PATH"  >>  /home/ubuntu/.bashrc
  source /home/ubuntu/.bashrc
  EOH
end
