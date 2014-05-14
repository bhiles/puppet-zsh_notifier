# Main class to install dependencies
class zsh_notifier {

  package { 'terminal_notifier':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/alloy/terminal-notifier/releases/tag/1.5.0',
  }

  repository { 'zsh-nofity-repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => '/etc/zsh_notify',
    require  => Package['terminal_notifier'],
  }

}
