require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

require 'dotenv'
require 'dotenv/tasks'
Dotenv.load '.env.deploy'

set :user, ENV['REMOTE_USER']
set :domain, ENV['DOMAIN']
set :identity_file, ENV['SSH_KEY']
set :port, ENV['REMOTE_PORT']
set :deploy_to, ENV['DEPLOY_TO']
set :repository, ENV['REPO']
set :branch, 'master'

set_default :rails_env, 'production'

# Linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['.env.production', 'config/database.yml', 'log', 'public/uploads']
set :rvm_path, ENV['RVM_PATH']

task :environment do
  invoke :'rvm:use[default]'
end

task setup: :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/.env.production"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'
    to(:launch) { invoke :restart }
  end
end

task restart: :environment do
  queue %[passenger-config restart-app #{deploy_to}]
end

