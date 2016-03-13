# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'weather'
set :repo_url, 'git@github.com:edgarlatorre/weather.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/weather'

# Default value for :scm is :git
set :scm, :git

namespace :deploy do
  task :build do
    on roles(:web) do
      bundle_command = "bundle install --deployment --binstubs --path=#{deploy_to}/bundle"
      execute "cd #{deploy_to}/current && #{bundle_command}"
      execute "cd #{deploy_to}/current && rake assets:precompile "
    end
  end
  task :restart do
    on roles(:web) do
      execute "cd #{deploy_to}/current && sh restart.sh"
    end
  end

  after :finishing, 'deploy:build'
  after :finishing, 'deploy:restart'
end
