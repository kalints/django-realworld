# django-realworld

Real world Chef example of real world Django application. The app is taken from here:

https://github.com/gothinkster/django-realworld-example-app

## Quick start using DigitalOcean

If you don't have DigitalOcean account get one using my ref link and spend $100 of resources for free: https://m.do.co/c/cc8f1a680e11

```
1. Create DigitalOcean droplet with your id_rsa/id_rsa.pub key pair
2. On your local machine install Chef Workstation
3. Execute: "eval `ssh-agent`" to start ssh agent
4. Execute "ssh-add" to add the key
5. Bootstrap the Chef client on the droplet using: "ssh <ip of the droplet> curl -L https://omnitruck.chef.io/install.sh | sudo bash"
6. Now from the local machine use chef-run: "chef-run <ip of the droplet> file hello.txt"
7. We created a hello.txt file so let's now remove it using: "chef-run <ip of the droplet> file hello.txt action=delete"
```

And now comes the true power of chef-run (part of Chef Workstation). Here's how it goes:

```
[kstaykov@manja cookbooks]$ ls
django-realworld
[kstaykov@manja cookbooks]$ chef-run 104.248.23.230 django-realworld::create_user
[✔] Packaging cookbook... done!
[✔] Generating local policyfile... exporting... done!
[✔] Applying django-realworld::create_user from /home/kstaykov/proj/cookbooks/django-realworld to target.
└── [✔] [104.248.23.230] Successfully converged django-realworld::create_user.
[kstaykov@manja cookbooks]$ chef-run 104.248.23.230 django-realworld::install_packages
[✔] Packaging cookbook... done!
[✔] Generating local policyfile... exporting... done!
[✔] Applying django-realworld::install_packages from /home/kstaykov/proj/cookbooks/django-realworld to target.
└── [✔] [104.248.23.230] Successfully converged django-realworld::install_packages.
[kstaykov@manja cookbooks]$ chef-run 104.248.23.230 django-realworld::pyenv
[✔] Packaging cookbook... done!
[✔] Generating local policyfile... exporting... done!
[✔] Applying django-realworld::pyenv from /home/kstaykov/proj/cookbooks/django-realworld to target.
└── [✔] [104.248.23.230] Successfully converged django-realworld::pyenv.
[kstaykov@manja cookbooks]$ chef-run 104.248.23.230 django-realworld::app
[✔] Packaging cookbook... done!
[✔] Generating local policyfile... exporting... done!
[✔] Applying django-realworld::app from /home/kstaykov/proj/cookbooks/django-realworld to target.
└── [✔] [104.248.23.230] Successfully converged django-realworld::app.
[kstaykov@manja cookbooks]$
```

As you can see I started in a fresh cookbooks directory with a clone of this repo. So in summary:

* You need to have Chef client installed on the server you want to configure. That can be achieved via the command from step 5.
* You need to have Chef Workstation on your local dev machine (PC, laptop).
* You need to configure ssh key based authentication.
* That's it! Happy 'chef-run'ning :).

## To debug recipes via pry use this code in recipe

```
ruby_block 'breakpoint' do
    block do
        require 'pry'
        binding.pry
    end
end
```

## Run the Django app

Once the recipes execute you can run the app in the following way:

```
cd django-realworld-example-app
python manage.py migrate
python manage.py runserver 0:8000
```