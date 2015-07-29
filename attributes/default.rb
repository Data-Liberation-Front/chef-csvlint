default['user'] = 'csvlint'
default['ruby-ng']['ruby_version'] = '2.1'
default['fully_qualified_domain_name'] = 'csvlint.io'
default['repo'] = 'theodi/csvlint'

default['deployment']['rack_env'] = 'production'
default['deployment']['revision'] = 'CURRENT'

default['envbuilder']['base_dir'] = '/home/csvlint'
default['envbuilder']['owner'] = 'csvlint'
default['envbuilder']['group'] = 'csvlint'

default['mysql']['database'] = 'csvlint'
default['migrate'] = 'bundle exec rake db:migrate'
