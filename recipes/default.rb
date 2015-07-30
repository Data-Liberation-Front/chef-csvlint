user = node['user']
group = node['user']
fqdn = node['fully_qualified_domain_name']

include_recipe 'git'
include_recipe 'odi-users'
include_recipe 'odi-pk'
include_recipe 'ruby-ng'
include_recipe 'ruby-ng::dev'
include_recipe 'chef-client::config'
include_recipe 'chef-client::upstart_service'
include_recipe 'odi-monitoring'
include_recipe 'envbuilder'
include_recipe 'nginx'

include_recipe 'chef_csvlint::dependencies'

deploy_revision "/home/#{user}/#{fqdn}" do
  repo "git://github.com/#{node['repo']}"
  user user
  group group
  revision node['deployment']['revision']
  action :force_deploy
  environment(
    'RACK_ENV' => node['deployment']['rack_env']
  )
  migration_command node['migrate']
  migrate true

  before_migrate do
    current_release_directory = release_path

    bash 'Symlink env' do
      cwd release_path
      user user
      code <<-EOF
        ln -sf /home/#{user}/env .env
      EOF
    end

    directory "/home/#{user}/#{fqdn}/shared/config/" do
      action :create
      recursive true
    end

    directory "/home/#{user}/#{fqdn}/shared/log/" do
      action :create
      recursive true
      user user
    end

    template "/home/#{user}/#{fqdn}/shared/config/database.yml" do
      action :create
      variables(
        :mysql_host     => node['mysql']['host'],
        :mysql_database => node['mysql']['database'],
        :mysql_username => node['mysql']['database'],
        :mysql_password => node['mysql']['password']
      )
    end

    bundlify 'csvlint' do
      cwd current_release_directory
    end
  end

  before_restart do
    current_release_directory = release_path
    port = node['start_port']
    concurrency = node['concurrency']

    precompile_assets do
      cwd current_release_directory
      user user
    end

    foremanise user do
      cwd current_release_directory
      port port
      concurrency concurrency
    end

    make_vhosts do
      cwd current_release_directory
      user user
      fqdn fqdn
    end
  end
end
