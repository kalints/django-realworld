# django-realworld

Real world Chef example of real world Django application. The app is taken from here:

https://github.com/gothinkster/django-realworld-example-app

## To debug via pry use this code in recipe

```
ruby_block 'breakpoint' do
    block do
        require 'pry'
        binding.pry
    end
end
```
