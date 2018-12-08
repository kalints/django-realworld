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

execute "pip-install-requirements" do
    user 'vagrant'
    group 'vagrant'
    command ". /home/vagrant/.bash_profile && pyenv activate productionready && cd /home/vagrant/django-realworld-example-app && pip install -r requirements.txt"
    action :run
end
