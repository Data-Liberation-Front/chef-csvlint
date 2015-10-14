default['user'] = 'csvlint'
default['fully_qualified_domain_name'] = 'csvlint.io'
default['repo'] = "#{node['github_org']}/#{node['user']}"
default['start_port'] = 3000
default['concurrency'] = 2
default['concurrency_string'] = "thin=#{node['concurrency']},delayed_job=1"
default['catch_and_redirect'] = ['www.csvlint.io']
default['max_body_size'] = '5M'

default['ruby-ng']['ruby_version'] = '2.1'

default['mysql']['user'] = 'csvlint'

default['migrate'] = 'bundle exec rake db:migrate'
default['precompile_assets'] = true
