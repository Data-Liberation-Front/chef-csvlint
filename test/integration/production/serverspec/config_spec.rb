require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /username: csvlint/ }
  its(:content) { should match /password: csvlint/ }
  its(:content) { should match /database: csvlint/ }
  its(:md5sum) { should eq '2c21fc40e0af1e9a68883913609ad812' }
end
