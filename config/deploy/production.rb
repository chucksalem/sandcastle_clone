server "192.155.86.203", user: "deploy", roles: %w{web app}

set :pty, true

set :user, 'deploy'
set :deploy_to, -> { "/home/apps/sandcastle" }

set :stage, 'production'

