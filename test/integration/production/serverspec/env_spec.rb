require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/env' do
  it { should be_file }
  its(:content) { should match /SESSION_SECRET_CERTIFICATE: 8184842351530937c9c8c2e723fd03f4/ }
end

describe file '/home/csvlint/csvlint.io/current/.env' do
  it { should be_symlink }
  its(:content) { should match /SESSION_SECRET_CERTIFICATE: 8184842351530937c9c8c2e723fd03f4/ }
end
