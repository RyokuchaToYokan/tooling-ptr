# Gemfile.lockを見てcapistranoのバージョンを入れる
lock '3.14.1'

# 自身のアプリ名、リポジトリ名を記述
set :application, 'tooling-ptr'
set :repo_url,  'git@github.com:RyokuchaToYokan/tooling-ptr.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :linked_files, fetch(:linked_files, []).push("config/master.key")

append :linked_files, 'config/database.yml', 'config/master.key'

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

# pemを指定
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/tooling-ptr.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :linked_files, %w{ config/master.key }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end

  desc 'upload master.key'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/master.key', "#{shared_path}/config/master.key")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end