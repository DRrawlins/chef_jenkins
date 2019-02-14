
#!/bin/bash
set -e
set -x
set -o pipefail

gem install ffi-yajl -v '2.3.1' --source 'https://rubygems.org/'
gem install libyajl2
sudo dnf install -y zlib-devel
gem update
bundle install
sudo  gem pristine libyajl2 --version 1.2.0
bundle update
