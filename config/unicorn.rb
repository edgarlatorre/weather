app_path = File.expand_path(File.dirname(__FILE__) + '/..')

# Path to logs
stderr_path "#{app_path}/log/unicorn.log"
stdout_path "#{app_path}/log/unicorn.log"

# Unicorn socket
listen "#{app_path}/tmp/unicorn.sock", backlog: 64

# Number of processes
worker_processes 1

working_directory app_path

pid "/tmp/unicorn.pid"

# Time-out
timeout 300
