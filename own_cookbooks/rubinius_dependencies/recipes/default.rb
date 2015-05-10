#
# Cookbook Name:: rubinius_dependencies
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package %w(bison ruby-dev rake zlib1g-dev libyaml-dev libssl-dev libreadline-dev libncurses5-dev llvm llvm-dev libeditline-dev libedit-dev) do
    action :install
end
