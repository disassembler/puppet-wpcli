#
# = Class: wpcli

class wpcli (
  $branch      = $wpcli::params::branch,
  $destination = $wpcli::params::destination,
  $symlink     = $wpcli::params::symlink,
  $repo        = $wpcli::params::repo,

) inherits wpcli::params {

  exec { 'fetch-wpcli':
    cwd     => '/tmp',
    command => "/usr/bin/git clone --branch ${branch} ${repo}",
    creates => '/tmp/wp-cli',
    require => Package['git'],
  }

  file { $destination:
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => '/tmp/wp-cli',
    require => Exec['fetch-wpcli'],
  }

  file { $symlink:
    ensure  => link,
    target  => "${destination}/wpcli.php",
    require => File[$destination],
  }
}
