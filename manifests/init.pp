# Main class to install dependencies
class zsh_notifier {

  package { 'terminal-notifier-1.5.0':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/alloy/terminal-notifier/releases/download/1.5.0/terminal-notifier-1.5.0.zip',
  }

  repository { 'zsh_notify_repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => '/opt/boxen/zsh_notify',
    require  => Package['terminal-notifier-1.5.0'],
  }

  class {'zsh_notifier::config':
    require => Repository['zsh_notify_repo'],
  }

}
