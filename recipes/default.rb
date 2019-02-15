# Cookbook Name:: chef_jenkins
# Recipe:: default

include_recipe 'chef_jenkins::jenkins_repo'
include_recipe 'chef_jenkins::install'
include_recipe 'chef_jenkins::configure'
include_recipe 'chef_jenkins::service'
