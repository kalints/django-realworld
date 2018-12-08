# # encoding: utf-8

# Inspec test for recipe django-realworld::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe file('/home/vagrant/.bash_profile') do
  its('content') { should match 'PYENV_ROOT' }
  its('content') { should match 'PATH' }
  its('content') { should match 'pyenv init' }
end

describe file('/home/vagrant/.python-version') do
  its('content') { should match 'productionready' }
end

describe command('bash -c "source ~/.bash_profile && pyenv activate"') do
  its('exit_status') { should eq 0 }
end
