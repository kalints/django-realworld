#
# Cookbook:: django-realworld
# Recipe:: install_app
#
# Copyright:: 2018, The Authors, All Rights Reserved.

group 'Django group' do
    action :create
    group_name 'django'
end

user 'Django user' do
    action :create
    manage_home true
    username 'django'
    group 'django'
    comment 'Django user'
    home '/home/django'
    shell '/bin/bash'
    password '$1$jnl9PxZI$qduDX2j0TtNRkuC0HyGd91' # pass is: "django" so... CHANGE IT! :)
end