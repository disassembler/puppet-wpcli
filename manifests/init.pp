#
# = Class: wpcli

class wpcli (
  $destination = '/usr/local/bin/wp',

) {

  file { $destination:
    ensure => file,
    source => 'https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar',
    mode   => '0755',
  }
}
