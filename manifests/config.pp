# Setup the env variable template file
class zsh_notifier::config {

  include boxen::config

  $notify_timeout        = 1
  $terminal_notifier_dir = "/Applications/terminal-notifier-1.5.0"
  $terminal_notifier_executable = "${terminal_notifier_dir}/terminal-notifier.app/Contents/MacOS/terminal-notifier"
  $zsh_notify_dir        = "${boxen::config::home}/zsh_notify"
  $zsh_notify_executable = "${zsh_notify_dir}/notify.plugin.zsh"

  boxen::env_script { 'zsh_notifier':
    content  => template('zsh_notifier/env.sh.erb'),
  }

  file { "${boxen::config::envdir}/zsh_notifier.sh":
    ensure  => absent,
  }

}
