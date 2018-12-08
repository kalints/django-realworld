#
# Cookbook:: django-realworld
# Recipe:: install_pyenv
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cookbook_file '/home/vagrant/.bash_profile' do
    source 'bash_profile'
    owner 'vagrant'
    group 'vagrant'
    mode '0755'
    action :create
end

execute "install-pyenv" do
    command "git clone https://github.com/pyenv/pyenv.git ~/.pyenv"
    action :run
end
