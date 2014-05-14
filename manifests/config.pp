# Setup the env variable template file
class zsh_notifier::config {
  # include boxen::config
  boxen::env_script { 'zsh_notifier':
    content  => template('zsh_notifier/env.sh.erb'),
  }

  file { "${boxen::config::envdir}/zsh_notifier.sh":
    ensure => absent,
  }

}
