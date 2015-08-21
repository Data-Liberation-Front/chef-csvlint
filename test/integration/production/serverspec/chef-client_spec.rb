require 'serverspec'
set :backend, :exec

describe service 'chef-client' do
  it { should_not be_running }
end

describe file '/etc/cron.d/chef-client' do
  it { should be_file }
  its(:content) { should match /\*\/10/ }
  its(:content) { should match /\/usr\/bin\/chef-client > \/var\/log\/chef\/cron.log/ }
end

describe file '/etc/chef/client.rb' do
  it { should be_file }
  its(:content) { should match /validation_client_name "chef-validator"/ }
end
