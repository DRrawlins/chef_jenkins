name 'chef_jenkins'
maintainer 'Daniel Rawlins'
maintainer_email 'danrawlins07@gmail.com'
description 'Installs/Configures chef_jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

%w{fedora}.each do |os|
  supports os
end

chef_version '>= 14.10.9'
