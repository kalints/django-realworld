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

describe command('bash -c "source ~/.bash_profile && pyenv activate && python -m django --version"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/1.10.5/) }
end
