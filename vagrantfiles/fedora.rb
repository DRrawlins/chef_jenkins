required_plugins = %w{
  vagrant-cachier
  vagrant-proxyconf
  vagrant-reload
  vagrant-share
  vagrant-vbguest
}
required_plugins.each do |plugin|
  exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(' ')}" unless (Vagrant.has_plugin? plugin) || ARGV[0] == 'plugin'
end

Vagrant.configure(2) do |config|
  config.vm.provision 'Install Chef Client',
                      type: 'shell',
                      preserve_order: true,
                      inline: 'curl -L https://omnitruck.chef.io/install.sh | bash -s',
                      privileged: true
  config.vm.network 'private_network', use_dhcp_assigned_default_route: true, type: 'dhcp'
end
