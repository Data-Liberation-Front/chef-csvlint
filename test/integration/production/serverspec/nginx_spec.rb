require 'serverspec'
set :backend, :exec

describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_running }
end

describe file '/etc/nginx/sites-enabled/csvlint.io' do
  it { should be_symlink }
  its(:content) { should match /server 127.0.0.1:3001;/ }
  its(:content) { should match /listen 80 default;/ }
  its(:content) { should match /server_name csvlint.io;/ }
  its(:content) { should match /root \/home\/csvlint\/csvlint.io\/current\/public\/;/ }
  its(:content) { should match /client_max_body_size 5M;/ }
end
