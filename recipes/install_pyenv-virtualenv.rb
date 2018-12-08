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
