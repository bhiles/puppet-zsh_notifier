# Main class to install dependencies
class zsh_notifier {

  package { 'terminal_notifier':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/alloy/terminal-notifier/releases/download/1.5.0/terminal-notifier-1.5.0.zip',
  }

  repository { 'zsh_notify_repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => "${zsh_notifier::config::zsh_notify_dir}",
    require  => Package['terminal_notifier'],
  }

  class {'zsh_notifier::config':
    require => Repository['zsh_notify_repo'],
  }

}
