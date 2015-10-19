# ISM Development Web Server

include ::pear

$dependencies = [ 'libcurl4-gnutls-dev', 'libexpat1-dev',
                  'gettext', 'libz-dev', 'libssl-dev',
                  'build-essential', 'php5', 'php5-mysql',
                  'mysql-client', 'php5-mysqlnd', 'php5-curl',
                  'phpunit'
                ]

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

package { $dependencies:
  ensure  => installed,
  require => Exec['apt-get update'],
}

# Apache configuration
class { '::apache':
  default_confd_files => false,
  mpm_module          => 'prefork'
}

class {'::apache::mod::php': }

::apache::mod { 'rewrite': }

::apache::vhost { 'ism':
  default_vhost    => true,
  port             => '80',
  docroot          => '/vagrant/html',
  directories      => [
    { path         => '/vagrant/html',
    options        => ['Indexes','FollowSymLinks','MultiViews'],
    allow_override => 'All',
    order          => 'Allow,Deny',
    allow          => 'from all',
    },
  ],
}

pear::package { 'PEAR': }
pear::package { 'PHPUnit': }
pear::package { 'mail': }
pear::package { 'Mail_Mime': }
pear::package { 'Net_SMTP': }
