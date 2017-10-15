# frozen_string_literal: true

# config valid only for current version of Capistrano
lock "3.9.1"

set :application, 'michaelatworkspace'
set :repo_url, 'git@github.com:Seybo/michaelatwork.git'

set :deploy_to, '/home/glaux/space'

append :linked_files, 'config/database.yml', '.env'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/projects', 'public/other'

set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'

set :passenger_restart_with_touch, false
