require 'serverspec'
set :backend, :exec

describe package 'build-essential' do
  it { should be_installed }
end

describe package 'libcurl4-openssl-dev' do
  it { should be_installed }
end

describe package 'libxslt1-dev' do
  it { should be_installed }
end

describe package 'libmysqlclient-dev' do
  it { should be_installed }
end
