# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'michaelatwork'
set :repo_url, 'git@github.com:Seybo/michaelatwork.git'

set :deploy_to, '/home/glaux/website'
set :deploy_user, 'glaux'

#rbenv
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.1'

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', '.env'

# Default value for linked_dirs is []
append :linked_dirs, 'bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'vendor/bundle'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
