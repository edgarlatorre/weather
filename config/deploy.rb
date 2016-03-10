# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'weather'
set :repo_url, 'git@github.com:edgarlatorre/weather.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/weather'

# Default value for :scm is :git
set :scm, :git

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  task :restart do
    on roles(:web) do
      invoke 'unicorn:restart'
    end
  end
end
