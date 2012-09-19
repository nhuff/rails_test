set :application, "rails_test"
set :repository,  "git://github.com/nhuff/rails_test.git"

set :scm, :git
set :branch, "master"
set :use_sudo, false
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "/var/www/webapps/rails_test"
set :deploy_via, :remote_cache
set :port,2200
set :user,'vagrant'
set :docroot, '/var/www/rails'
role :web, "localhost"
role :app, "localhost"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   task :sub_link, :roles => :app do
     run "ln -sf #{release_path}/public #{docroot}/#{application}"
   end
   after "deploy:create_symlink", "deploy:sub_link"
 end
