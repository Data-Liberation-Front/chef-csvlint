require 'serverspec'
set :backend, :exec

describe package 'ruby2.1' do
  it { should be_installed }
end

describe package 'ruby2.1-dev' do
  it { should be_installed }
end
