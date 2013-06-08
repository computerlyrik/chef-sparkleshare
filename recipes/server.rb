#
# Cookbook Name:: sparkleshare
# Recipe:: server
#
# Copyright 2012, computerlyrik
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#TODO THIS IS NOT PRODUCTION READY

##Set opensssh variables
#    echo "Match User storage" >> /etc/ssh/sshd_config

#node.set['openssh']['server']['pub_key_authentication'] = "yes"
#node.set['openssh']['server']['password_authentication'] = "no"
include_recipe "sparkleshare"

node.set['openssh']['server']['pubkey_authentication']="yes"
node.set['openssh']['server']['password_authentication']="no"
node.set['openssh']['server']['permit_root_login']="no"

include_recipe 'openssh'

directory "#{node['sparkleshare']['home']}/.ssh" do
  action :create
  user node['sparkleshare']['user']
  mode 0700
end


#template '/home/storage/.ssh/authorized_keys' do
#  user 'storage'
#  mode 0600
#end


package 'git'

execute "git init --bare #{node['sparkleshare']['repository']}" do
  user node['sparkleshare']['user']
end

    # Don't allow force-pushing and data to get lost
execute "git config --file #{node['sparkleshare']['repository']}/config receive.denyNonFastForwards true" do
  user node['sparkleshare']['user']
end
