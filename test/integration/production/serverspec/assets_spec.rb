require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io/current/public/assets' do
  it { should be_directory }
end
