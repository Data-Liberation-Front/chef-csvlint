require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/env' do
  it { should be_file }
  its(:content) { should match /CSVLINT_SESSION_SECRET: 8184842351530937c9c8c2e723fd03f4/ }
end

describe file '/home/csvlint/csvlint.io/current/.env' do
  it { should be_symlink }
  its(:content) { should match /CSVLINT_SESSION_SECRET: 8184842351530937c9c8c2e723fd03f4/ }
end
