dnf_package 'unzip' do
  package_name               node['chef_jenkins']['master']['unzip_package_name']
  version                    node['chef_jenkins']['master']['unzip_package_version']
  action                     :install
end

dnf_package 'chef_jenkins' do
  package_name               node['chef_jenkins']['master']['jenkins_package_name']
  version                    node['chef_jenkins']['master']['jenkins_package_version']
  action                     :install
end
