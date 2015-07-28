require 'serverspec'
set :backend, :exec

describe user 'csvlint' do
  it { should exist }
end
