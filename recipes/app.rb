#
# Cookbook:: django-realworld
# Recipe:: install_app
#
# Copyright:: 2018, The Authors, All Rights Reserved.

git '/home/django/django-realworld-example-app' do
    user 'django'
    group 'django'
    repository 'https://github.com/gothinkster/django-realworld-example-app.git'
    revision 'master'
    action :sync
end

execute "pip-install-requirements" do
    user 'django'
    group 'django'
    cwd '/home/django/django-realworld-example-app'
    command 'pip install -r requirements.txt'
    environment ({
        'PWD' => '/home/django',
        'HOME' => '/home/django',
        'PYENV_ROOT' => '/home/django/.pyenv',
        'PATH' => '/home/django/.pyenv/shims:/home/django/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin',
        'PYENV_SHELL' => 'su'
    })
    action :run
end
