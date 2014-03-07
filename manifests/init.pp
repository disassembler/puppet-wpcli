#
# = Class: wpcli

class wpcli (
  $destination = '/usr/local/bin/wp',

) {

  exec { 'fetch-wpcli':
    cwd     => '/tmp',
    command => 'curl -L https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > wp-cli.phar',
    creates => '/tmp/wp-cli.phar',
  }

  file { $destination:
    ensure  => file,
    source  => '/tmp/wp-cli.phar',
    require => Exec['fetch-wpcli'],
  }
}
