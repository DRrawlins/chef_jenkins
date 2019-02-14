require 'chefspec'
require 'chefspec/berkshelf'
require 'chef-vault'

RSpec.configure do |config|
  config.color = true               # Use color in STDOUT
  config.formatter = :documentation # Use the specified formatter

  # Added ChefSpec caching gem to speed up tests 10x
  config.extend(ChefSpec::Cacher)

  # config.log_level = :debug
end

def linux_platforms
  %w{fedora}
end

def ubuntu_versions
  %w{29}
end
