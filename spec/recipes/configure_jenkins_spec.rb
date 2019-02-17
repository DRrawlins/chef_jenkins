require 'spec_helper'

describe 'chef_jenkins::configure_jenkins' do
  context 'default' do
    let(:home_dir) { '/var/lib/jenkins' }
    let(:log_dir)  { '/var/log/jenkins' }
    let(:user)          { 'jenkins' }
    let(:group)         { 'jenkins' }

    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['chef_jenkins']['master']['home_dir'] = home_dir
        node.normal['chef_jenkins']['master']['log_dir'] = log_dir
        node.normal['chef_jenkins']['master']['user']           = user
        node.normal['chef_jenkins']['master']['group']          = group
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
    end

    it 'creates the user' do
      expect(chef_run).to create_user(user)
        .with_home(home_dir)
    end

    it 'creates the group' do
      expect(chef_run).to create_group(group)
        .with_members([user])
    end

    it 'creates the home directory' do
      expect(chef_run).to create_directory(home_dir)
        .with_owner(user)
        .with_group(group)
        .with_mode('0755')
        .with_recursive(true)
    end

    it 'creates the log directory' do
      expect(chef_run).to create_directory(log_dir)
        .with_owner(user)
        .with_group(group)
        .with_mode('0755')
        .with_recursive(true)
    end
  end

  context 'non-default' do
    let(:home_dir)      { '/var/lib/jenkins' }
    let(:log_dir) { '/var/log/jenkins' }
    let(:user)          { 'jenkins' }
    let(:group)         { 'jenkins' }

    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['chef_jenkins']['master']['home_dir']       = home_dir
        node.normal['chef_jenkins']['master']['log_dir']        = log_dir
        node.normal['chef_jenkins']['master']['user']           = user
        node.normal['chef_jenkins']['master']['group']          = group
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
    end

    it 'creates the user' do
      expect(chef_run).to create_user(user)
        .with_home(home_dir)
    end

    it 'creates the group' do
      expect(chef_run).to create_group(group)
        .with_members([user])
    end

    it 'creates the home directory' do
      expect(chef_run).to create_directory(home_dir)
        .with_owner(user)
        .with_group(group)
        .with_mode('0755')
        .with_recursive(true)
    end

    it 'creates the log directory' do
      expect(chef_run).to create_directory(log_dir)
        .with_owner(user)
        .with_group(group)
        .with_mode('0755')
        .with_recursive(true)
    end
  end
end
