# # encoding: utf-8

# Inspec test for recipe django-realworld::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

%w(
    'build-essential'
    'checkinstall'
    'libreadline-gplv2-dev'
    'libncursesw5-dev'
    'libssl-dev'
    'libsqlite3-dev'
    'tk-dev'
    'libgdbm-dev'
    'libc6-dev'
    'libbz2-dev'
).each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end