# Cookbook Name:: chef_jenkins

default['chef_jenkins']['jenkins_service_name'] = 'jenkins'
default['chef_jenkins']['master']['JENKINS_JAVA_CMD'] = '-Djenkins.install.runSetupWizard=false'
