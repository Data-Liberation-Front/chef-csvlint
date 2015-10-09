require 'serverspec'
set :backend, :exec

describe file '/home/csvlint/csvlint.io/current/public/assets' do
  it { should be_directory }
end

# This has manifested on the staging box. No idea.
describe file '/home/csvlint/csvlint.io/current/public/assets/logo-footer.png' do
#  it { should be_file }
end
