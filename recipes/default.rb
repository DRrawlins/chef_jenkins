# Cookbook Name:: chef_jenkins
# Recipe:: default

include_recipe 'chef_jenkins::jenkins_repo'
include_recipe 'chef_jenkins::install_jenkins'
include_recipe 'chef_jenkins::configure_jenkins'
include_recipe 'chef_jenkins::jenkins_service'
