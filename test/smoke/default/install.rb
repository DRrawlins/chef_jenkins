# Cookbook Name:: chef_jenkins
# Test:: install

describe package('unzip') do
  it { should be_installed }
end

describe package('jenkins') do
  it { should be_installed }
end
