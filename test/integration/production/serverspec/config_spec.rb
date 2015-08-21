require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /password: csvlint/ }
  its(:md5sum) { should eq 'ba9f5e83f95c1f9eb9682bc0537a5783' }
end
