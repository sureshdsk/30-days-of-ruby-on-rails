# 30-days-of-ruby-on-rails
draft


## Day 1 - Intall Ruby on Rails on Mac OSX


### Install rbenv

$ brew update
$ brew install rbenv ruby-build

Run below command on terminal

```
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

source ~/.bash_profile
```

#### Install ruby 2.3.1
```
rbenv install 2.3.1

rbenv global 2.3.1
```

#### Install gem bundler
```
gem install bundler
```

#### Install rails
```
gem install rails
```
#### Create new project

```
rails new hello-rails

cd hello-rails/
```

#### Run the project
```
bin/rails server
```
project runs at http://localhost:3000

If you want to run on different port 

```
bin/rails server -p 4000
```

## Note
If you get "Errno::EACCES: Permission denied @ dir_s_mkdir" while creating project, do set ownership for the rbenv directory for your user. 

```
sudo chown -R USERNAME ~/.rbenv
```