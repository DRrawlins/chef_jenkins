service node['chef_jenkins']['jenkins_service_name'] do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
  notifies :run, 'execute[service_setup]', :immediately
end

execute 'service_setup' do
  command 'systemctl daemon-reload'
  action :nothing
  notifies :run, 'execute[ip]', :immediately
end

execute 'ip' do
  command "echo JENKINS_IP=$(ip addr | grep eth1 | grep inet | awk '{print $2}' | awk -F '/' '{print $1}'):8080 && sleep 15"
  live_stream true
  action :nothing
end

groovy_init_dir = "#{node['chef_jenkins']['master']['home_dir']}/#{node['chef_jenkins']['master']['groovy_init']}"
groovy_init_sec_file = "#{groovy_init_dir}/#{node['chef_jenkins']['master']['groovy_init_file']}"

service 'jenkins_restart' do
  service_name node['chef_jenkins']['jenkins_service_name']
  action :nothing
  subscribes :restart, 'execute[ip]', :delayed
  notifies :delete, 'file[groovy_security]', :delayed
end

file 'groovy_security' do
  path      "#{groovy_init_sec_file}" # ~FC002
  action    :nothing
  notifies :run, 'execute[admin_pass]', :delayed
end

admin_pass = "#{node['chef_jenkins']['master']['home_dir']}/secrets/initialAdminPassword"

execute 'admin_pass' do
  command "echo ADMIN_PASSWORD=$(cat #{admin_pass})"
  live_stream true
  action :nothing
  notifies :delete, 'file[admin_pass_file]', :delayed
end

file 'admin_pass_file' do
  path      "#{groovy_init_sec_file}" # ~FC002
  action    :nothing
end
