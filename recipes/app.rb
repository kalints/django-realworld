#
# Cookbook:: django-realworld
# Recipe:: install_app
#
# Copyright:: 2018, The Authors, All Rights Reserved.

git '/home/vagrant/django-realworld-example-app' do
    user 'vagrant'
    group 'vagrant'
    repository 'https://github.com/gothinkster/django-realworld-example-app.git'
    revision 'master'
    action :sync
end