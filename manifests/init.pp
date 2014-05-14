# This is a placeholder class.
class zsh_notifier {
  anchor { 'Hello_World': }

  package { 'terminal_notifier':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'https://github.com/alloy/terminal-notifier/releases/tag/1.5.0',
  }

  #package { 'zsh_notify':
  #  ensure   => present,
  #  provider => 'compressed_app',
  #  source   => 'http://unknown',
  #  require  => Package['terminal-notifier'],
  #}

  repository { 'zsh-nofity-repo':
    provider => 'git',
    source   => 'marzocchi/zsh-notify',
    path     => '/etc/zsh_notify',
    require  => Package['terminal_notifier'],
  }

  class { 'zsh_notifier::config':
    ensure                       => present,
    notify_timeout               => 1,
    terminal_notifier_executable => '/tmp/',
    zsh_notify_executable        => '/tmp/',
    require                      => Repository['zsh_notify'],
  }

  #  command => "echo '[ -f /opt/boxen/test.sh ] && source /opt/boxen/test.sh' >> ~/.profile",
  #  require => Package['zsh_notify'],
  #}

# install terminal_notifier
# return access to it's executable
#class terminal_notifier {
#  provider:
#}
}
