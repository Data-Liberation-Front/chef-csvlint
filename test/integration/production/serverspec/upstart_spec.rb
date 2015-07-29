require 'serverspec'
set :backend, :exec

describe file '/var/log/csvlint' do
  it { should be_directory }
end

describe file '/var/run/csvlint' do
  it { should be_directory }
end

describe file '/etc/init/csvlint.conf' do
  it { should be_file }
  its(:content) { should match /start on runlevel \[2345\]/ }
end

describe file '/etc/init/csvlint-thin.conf' do
  it { should be_file }
  its(:content) { should match /start on starting csvlint/ }
#  its(:md5sum) { should eq 'a41e8fa9b4474c007dc09a5a122e088b' }
end

describe file '/etc/init/csvlint-thin-2.conf' do
  it { should be_file }
  its(:content) { should match /start on starting csvlint-thin/ }
  its(:content) { should match /exec su - csvlint -c/ }
  its(:content) { should match /PORT=3001/ }
  its(:content) { should match /RACK_ENV=production/ }
  its(:content) { should match /RAILS_ENV=production/ }
  its(:content) { should match /bundle exec thin start -p \$PORT >> \/var\/log\/csvlint\/thin-2.log 2>&1/ }
end
