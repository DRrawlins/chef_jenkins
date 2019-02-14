directory node['chef_jenkins']['master']['home_dir'] do
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  recursive true
end

# Create the log directory
directory node['chef_jenkins']['master']['log_dir'] do
  owner     node['chef_jenkins']['master']['user']
  group     node['chef_jenkins']['master']['group']
  mode      '0755'
  recursive true
end

# Create/fix permissions on supplemental directories
%w(cache lib run).each do |folder|
  directory "fix permissions for /var/#{folder}/chef_jenkins" do
    path "/var/#{folder}/chef_jenkins"
    owner node['chef_jenkins']['master']['user']
    group node['chef_jenkins']['master']['group']
    mode '0755'
    action :create
  end
end
