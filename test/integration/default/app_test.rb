# # encoding: utf-8

# Inspec test for recipe django-realworld::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/home/django/django-realworld-example-app/.git') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'django' }
    it { should be_grouped_into 'django' }
end

describe file('/home/django/.pyenv/versions/productionready/lib/python3.5/site-packages/Django-1.10.5.dist-info') do
    it { should exist }
end
