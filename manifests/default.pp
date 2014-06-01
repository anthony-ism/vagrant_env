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
  mpm_module => 'prefork'
}

class {'::apache::mod::php': }

apache::mod { 'rewrite': }

apache::vhost { 'default_vhost':
  docroot          => '/var/www/html',
  directories      => [
    { path         => '/var/www/html',
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
