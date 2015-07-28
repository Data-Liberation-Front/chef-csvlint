user = node['user']
group = node['user']
fqdn = node['fully_qualified_domain_name']

include_recipe 'git'
include_recipe 'odi-users'
include_recipe 'odi-pk'
include_recipe 'ruby-ng'
include_recipe 'chef-client::config'
include_recipe 'chef-client::upstart_service'
include_recipe 'odi-monitoring'

deploy_revision "/home/#{user}/#{fqdn}" do
  repo "git://github.com/#{node['repo']}"
  user user
  group group
  revision node['deployment']['revision']
end
