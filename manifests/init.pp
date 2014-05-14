# Main class to install dependencies
class zsh_notifier {

  package { 'terminal_notifier':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/alloy/terminal-notifier/releases/download/1.5.0/terminal-notifier-1.5.0.zip',
  }

  repository { 'zsh-nofity-repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => '/opt/boxen/zsh_notify',
    require  => Package['terminal_notifier'],
  }

}
