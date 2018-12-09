# # encoding: utf-8

# Inspec test for recipe django-realworld::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/home/django/.bash_profile') do
  its('content') { should match 'PYENV_ROOT' }
  its('content') { should match 'PATH' }
  its('content') { should match 'pyenv init' }
end

describe file('/home/django/.python-version') do
  its('content') { should match 'productionready' }
end
