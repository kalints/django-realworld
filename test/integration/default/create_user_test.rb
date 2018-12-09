# # encoding: utf-8

# Inspec test for recipe django-realworld::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('django') do
    it { should exist }
    its('group') { should eq 'django' }
    its('home') { should eq '/home/django' }
    its('shell') { should eq '/bin/bash' }
end