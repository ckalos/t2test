include puppet-iptables

package { 'httpd':
  ensure => installed,
}

package { 'php':
  ensure => installed,
}

package { 'elinks':
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

iptables { "Allow ICMP":
  proto => "icmp",
  icmp => "any",
  jump => "ACCEPT",
}

iptables { "Allow HTTP":
  proto => "tcp",
  dport => "80",
  jump => "ACCEPT",
}

iptables { "Allow SSH":
  proto => "tcp",
  dport => "22",
  jump => "ACCEPT",
}

iptables { "Reject the rest":
  proto => "all",
  jump => "REJECT",
}
