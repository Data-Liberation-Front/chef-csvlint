require 'serverspec'
set :backend, :exec

describe service 'csvlint-thin-2' do
  it { should be_running }
end

describe port(3001) do
  it { should be_listening }
end

describe command 'sudo apt-get install curl && curl --silent -I http://localhost:3001 | grep "200 OK"' do
  its(:stdout) { should match /200 OK/ }
end

#describe command 'sudo apt-get install curl && curl --silent -I http://localhost | grep "200 OK"' do
#  its(:stdout) { should match /200 OK/ }
#end

#describe command 'wget -qO- http://localhost' do
#  its(:stdout) {should match /<title>ODI Open Data Certificate<\/title>/ }
#end
