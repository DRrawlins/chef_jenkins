default['chef_jenkins']['master']['home_dir'] = '/var/lib/jenkins'
default['chef_jenkins']['master']['groovy_init'] = 'init.groovy.d'
default['chef_jenkins']['master']['groovy_init_file'] = 'basic-security.groovy'
default['chef_jenkins']['master']['log_dir'] = '/var/log/jenkins'
default['chef_jenkins']['master']['user'] = 'jenkins'
default['chef_jenkins']['master']['group'] = 'jenkins'
default['chef_jenkins']['master']['jenkins_conf'] = '/etc/sysconfig/jenkins'
default['chef_jenkins']['master']['JENKINS_JAVA_CMD'] = '-Djenkins.install.runSetupWizard=false'
