require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io' do
  it { should be_directory }
  it { should be_owned_by 'csvlint' }
end

describe file '/home/csvlint/csvlint.io/shared/log' do
  it { should be_directory }
  it { should be_owned_by 'csvlint' }
end

#describe file '/home/csvlint/csvlint.io/current/vendor/bundle' do
#  it { should be_directory }
#  it { should be_owned_by 'csvlint' }
#end
