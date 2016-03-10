server 'weather.edgarlatorre.com.br',
  user: 'deploy',
  roles: %w{web},
  ssh_options: {
    user: 'deploy',
    keys: [ENV['HOME'] + "/.ssh/id_rsa"],
    forward_agent: false,
    auth_methods: %w(publickey)
  }
