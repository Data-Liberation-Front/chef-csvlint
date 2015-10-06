require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /password: csvlint/ }
  its(:md5sum) { should eq 'fbfe237f10d8b34299ae690def204d34' }
end
