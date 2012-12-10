Description
===========

Sets up sparkleshare (basically a git repository) and
sparkleshare dashboard (continued by community)

Dashboard has the advanced capability to sync with mobile devices.

Currently Dashboard is tested in connection with GitLab.
Currently only one repository (main sync repository) is supported.

Requirements
============

openssh for connection

Attributes
==========
Configure repository
default['sparkleshare']['repo_dir'] = "/home/storage"
default['sparkleshare']['repo_name'] = "SparkleShare"

Configure directory for source code of dashboard
default['sparkleshare']['dashboard_dir'] = "/home/storage/dashboard"

Configure session secret for client/server communication
default['sparkleshare']['session_secret'] = 'JustSomeRandomString'


Usage
=====

Set up node['sparkleshare']['session_secret'] and run recipe

Ideas/Todo
=========

- Test and ready the server cookbook
- use repositorys to share via
sparkleshare_repository "myCoolRepo" do
  visibility "private" #"public"
  path "/path/to/git/repo" #defaults to node attr

- separate recipes
  

Contact
=======
see metadata.rb

