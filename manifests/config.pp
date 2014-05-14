# Setup the env variable template file
class zsh_notifier::config {

  $notify_timeout               = 1
  $terminal_notifier_executable = '/tmp/'
  $zsh_notify_executable        = '/tmp/'

  include boxen::config

  boxen::env_script { 'zsh_notifier':
    content  => template('zsh_notifier/env.sh.erb'),
    require => Repository['zsh_notify'],
  }

  file { "${boxen::config::envdir}/zsh_notifier.sh":
    ensure  => absent,
  }

}
