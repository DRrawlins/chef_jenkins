directory node['chef_jenkins']['master']['home_dir'] do
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  recursive true
end

# Create/fix permissions on supplemental directories
%w(lib).each do |folder|
  directory "fix permissions for /usr/#{folder}/jenkins" do
    path "/usr/#{folder}/jenkins"
    owner node['chef_jenkins']['master']['user']
    group node['chef_jenkins']['master']['group']
    mode '0755'
    action :create
  end
end

# Create/fix permissions on supplemental directories
%w(cache run).each do |folder|
  directory "fix permissions for /var/#{folder}/jenkins" do
    path "/var/#{folder}/jenkins"
    owner node['chef_jenkins']['master']['user']
    group node['chef_jenkins']['master']['group']
    mode '0755'
    action :create
  end
end

groovy_init_dir = "#{node['chef_jenkins']['master']['home_dir']}/#{node['chef_jenkins']['master']['groovy_init']}"
groovy_init_sec_file = "#{groovy_init_dir}/#{node['chef_jenkins']['master']['groovy_init_file']}"

directory "#{groovy_init_dir}" do # ~FC002
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  recursive true
end

cookbook_file 'groovy_security' do
  source    node['chef_jenkins']['master']['groovy_init_file']
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  path      "#{groovy_init_sec_file}" # ~FC002
  action    :nothing
end

# Create the log directory
directory node['chef_jenkins']['master']['log_dir'] do
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  recursive true
  notifies :create_if_missing, 'cookbook_file[groovy_security]', :immediately
end

template 'jenkins_conf' do
  source    'jenkins.erb'
  owner     'root'
  group     'root'
  mode      '0600'
  path      node['chef_jenkins']['master']['jenkins_conf']
  action    :create
end
