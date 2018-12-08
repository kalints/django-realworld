#
# Cookbook:: django-realworld
# Recipe:: install_pyenv
#
# Copyright:: 2018, The Authors, All Rights Reserved.

git '/home/vagrant/.pyenv/plugins/pyenv-virtualenv' do
    repository 'https://github.com/pyenv/pyenv-virtualenv.git'
    revision 'master'
    action :sync
end

cookbook_file '/home/vagrant/.bash_profile' do
    source 'bash_profile'
    owner 'vagrant'
    group 'vagrant'
    mode '0755'
    action :create
end

git '/home/vagrant/.pyenv' do
    user 'vagrant'
    group 'vagrant'
    repository 'https://github.com/pyenv/pyenv.git'
    revision 'master'
    action :sync
end

execute "pyenv-install-3.5.2" do
    user 'vagrant'
    group 'vagrant'
    not_if { ::File.exist?('/home/vagrant/.pyenv/versions/3.5.2') }
    command ". /home/vagrant/.bash_profile && pyenv install 3.5.2"
    action :run
end

execute "pyenv-install-3.5.2" do
    user 'vagrant'
    group 'vagrant'
    not_if { ::File.exist?('/home/vagrant/.pyenv/versions/productionready') }
    command ". /home/vagrant/.bash_profile && pyenv virtualenv 3.5.2 productionready"
    action :run
end

file '/home/vagrant/.python-version' do
    user 'vagrant'
    group 'vagrant'
    content 'productionready'
end

execute "pyenv-install-3.5.2" do
    user 'vagrant'
    group 'vagrant'
    not_if { ::File.exist?('/home/vagrant/.pyenv/versions/productionready') }
    command ". /home/vagrant/.bash_profile && pyenv rehash"
    action :run
end
