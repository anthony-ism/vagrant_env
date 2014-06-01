# ISM Development Web Server

include pear

$dependencies = [ 'libcurl4-gnutls-dev', 'libexpat1-dev',
                  'gettext', 'libz-dev', 'libssl-dev',
                  'build-essential', 'php5', 'php5-mysql',
                  'mysql-client', 'php5-mysqlnd'
                ]

package { $dependencies:
  ensure => installed,
}

# Apache configuration
class { 'apache':
  default_confd_files => false,
  mpm_module          => 'prefork'
}

class {'::apache::mod::php': }

apache::mod { 'rewrite': }

apache::vhost { 'ism':
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

cron { 'tasknotify':
  ensure  => present,
  command => '/var/www/sales.ismfast.com/api/app/ISM/Sales/cron/tasknotifications.php',
  user    => 'root',
  hour    => 0,
  minute  => 0
}

cron { 'notify':
  ensure  => present,
  command => 'php /var/www/sales.ismfast.com/api/app/ISM/Sales/cron/notify.php',
  user    => 'root',
}

#file { '/var/www':
#  ensure  => link,
#  target  => '/vagrant',
#  force   => true,
#}
