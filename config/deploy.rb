# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.12.1'

# Capistranoのログの表示に利用する
set :application, 'roro'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:iwauchi4649/RORO.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'master'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/roro'

# Default value for :pty is false
set :pty, true

# credentials.yml.encではmasterkeyにする
append :linked_files, %w{config/master.key}

# バージョンが変わっても共通で参照するディレクトリを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system"

#カリキュラム通りに進めた場合、2.5.1か2.3.1です
set :rbenv_ruby, '2.5.1'
set :rbenv_type, :user
set :rbenv_path, '/usr/local/src/rbenv/bin/rbenv'

# 出力するログのレベル。
set :log_level, :debug

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/id_rsa'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
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