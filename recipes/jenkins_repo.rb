yum_repository 'jenkins_repo' do
  name            node['chef_jenkins']['master']['jenkins_repo_package_name'] # ~FC120
  clean_metadata  true
  clean_headers   true
  description     node['chef_jenkins']['master']['jenkins_repo_package_desc']
  baseurl         node['chef_jenkins']['master']['jenkins_repo_package_base_url']
  enabled         true
  gpgcheck        true
  mode            '0644'
  action          :create
  notifies :run, 'execute[rpm_gpg_import_jenkins]', :immediately
end

execute 'rpm_gpg_import_jenkins' do
  command "sudo rpm --import #{node['chef_jenkins']['master']['jenkins_gpgkey_url']}"
  action :nothing
  notifies :run, 'execute[dnf_repolist]', :immediately
end

execute 'dnf_repolist' do
  command 'dnf repolist'
  action :nothing
end

remote_file 'jenkins_gpg' do
  source          node['chef_jenkins']['master']['jenkins_gpgkey_url']
  path            node['chef_jenkins']['master']['jenkins_gpgkey_path']
  owner           'root'
  group           'root'
  mode            '0644'
  action          :create
end
