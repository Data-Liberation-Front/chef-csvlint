require 'serverspec'
set :backend, :exec

describe command "cd /home/csvlint/csvlint.io/current && RAILS_ENV=production bundle exec rails runner 'Schema.first'" do
  its(:exit_status) { should eq 0 }
end
