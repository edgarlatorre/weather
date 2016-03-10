working_directory "${ENV['CURRENT_APP_DIR]}"

pid "${ENV['APP_DIR]}/pids/unicorn.pid"

# Path to logs
stderr_path "${ENV['APP_DIR]}/log/unicorn.log"
stdout_path "${ENV['APP_DIR]}/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
worker_processes 1

# Time-out
timeout 30
