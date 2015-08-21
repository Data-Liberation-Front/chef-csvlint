default['user'] = 'csvlint'
default['ruby-ng']['ruby_version'] = '2.1'
default['fully_qualified_domain_name'] = 'csvlint.io'
default['repo'] = 'theodi/csvlint'
default['start_port'] = 3000
default['concurrency'] = 2
default['catch_and_redirect'] = ['www.csvlint.io']
default['max_body_size'] = '5M'

default['deployment']['rack_env'] = 'production'
default['deployment']['revision'] = 'CURRENT'

default['envbuilder']['base_dir'] = '/home/csvlint'
default['envbuilder']['owner'] = 'csvlint'
default['envbuilder']['group'] = 'csvlint'

default['mysql']['database'] = 'csvlint'
default['migrate'] = 'bundle exec rake db:migrate'

default['chef_client']['init_style'] = 'none'
default['chef_client']['cron']['use_cron_d'] = true
default['chef_client']['cron']['hour'] = '*'
default['chef_client']['cron']['minute'] = '*/10'
default['chef_client']['cron']['log_file'] = '/var/log/chef/cron.log'
