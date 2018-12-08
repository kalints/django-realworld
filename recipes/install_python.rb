#
# Cookbook:: django-realworld
# Recipe:: install_python
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "update-package-cache" do
    command "sudo apt-get update"
    action :run
end

execute "install-build-essential" do
    command "sudo apt-get install -y build-essential checkinstall"
    action :run
end

execute "install-prereq" do
    command "sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev"
    action :run
end

