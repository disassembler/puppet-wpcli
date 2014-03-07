#
# Class: wpcli::params

class wpcli::params {
	$branch      = 'master'
  $destination = '/usr/local/lib/wp-cli'
  $symlink     = '/usr/local/bin/wp'
  $repo        = 'https://github.com/wp-cli/wp-cli'
}
