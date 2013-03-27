default['sparkleshare']['user'] = "storage"
default['sparkleshare']['home'] = "/home/#{node['sparkleshare']['user']}"

default['sparkleshare']['repository'] = "#{node['sparkleshare']['home']}/SparkleShare"

default['sparkleshare']['dashboard']['dir'] = "#{node['sparkleshare']['home']}/dashboard"
default['sparkleshare']['dashboard']['session_secret'] = 'JustSomeRandomString'


