# Main class to install dependencies
class zsh_notifier {

  package { 'terminal-notifier':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/bhiles/puppet-zsh_notifier/raw/master/terminal-notifier.tar.gz',
  }

  repository { 'zsh_notify_repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => '/opt/boxen/zsh_notify',
    require  => Package['terminal-notifier'],
  }

  class {'zsh_notifier::config':
    require => Repository['zsh_notify_repo'],
  }

}
