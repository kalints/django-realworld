#
# Cookbook:: django-realworld
# Recipe:: install_pyenv
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cookbook_file '/home/django/.bash_profile' do
    source 'bash_profile'
    owner 'django'
    group 'django'
    mode '0755'
    action :create
end

git '/home/django/.pyenv' do
    user 'django'
    group 'django'
    repository 'https://github.com/pyenv/pyenv.git'
    revision 'master'
    action :sync
end

git '/home/django/.pyenv/plugins/pyenv-virtualenv' do
    user 'django'
    group 'django'
    repository 'https://github.com/pyenv/pyenv-virtualenv.git'
    revision 'master'
    action :sync
end

execute "pyenv-install-3.5.2" do
    user 'django'
    group 'django'
    not_if { ::File.exist?('/home/django/.pyenv/versions/3.5.2') }
    command "pyenv install 3.5.2"
    environment ({
        'PWD' => '/home/django',
        'HOME' => '/home/django',
        'PYENV_ROOT' => '/home/django/.pyenv',
        'PATH' => '/home/django/.pyenv/shims:/home/django/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin',
        'PYENV_SHELL' => 'su'
    })
    action :run
end

execute "pyenv-virtualenv-3.5.2" do
    user 'django'
    group 'django'
    not_if { ::File.exist?('/home/django/.pyenv/versions/productionready') }
    command "pyenv virtualenv 3.5.2 productionready"
    environment ({
        'PWD' => '/home/django',
        'HOME' => '/home/django',
        'PYENV_ROOT' => '/home/django/.pyenv',
        'PATH' => '/home/django/.pyenv/shims:/home/django/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin',
        'PYENV_SHELL' => 'su'
    })
    action :run
end

file '/home/django/.python-version' do
    user 'django'
    group 'django'
    content 'productionready'
end

execute "pyenv-rehash" do
    user 'django'
    group 'django'
    command "pyenv rehash"
    environment ({
        'PWD' => '/home/django',
        'HOME' => '/home/django',
        'PYENV_ROOT' => '/home/django/.pyenv',
        'PATH' => '/home/django/.pyenv/shims:/home/django/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin',
        'PYENV_SHELL' => 'su'
    })
    action :run
end
