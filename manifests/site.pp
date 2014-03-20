package { 'httpd':
  ensure => installed,
}

package { 'php':
  ensure => installed,
}

file { "/var/www/html/index.php":
  ensure => present,
  source => "puppet:///modules/httpd/docroot/index.php",
}

service { 'httpd':
  ensure => running,
  enable => true,
}
