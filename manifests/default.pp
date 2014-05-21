# ISM Development Web Server

include pear

$dependencies = [ 'libcurl4-gnutls-dev', 'libexpat1-dev',
                  'gettext', 'libz-dev', 'libssl-dev',
                  'build-essential', 'php5-dev', 'mysql-client'
                ]

package { $dependencies:
  ensure => installed,
}

package { 'apache2':
  ensure => present,
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
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

