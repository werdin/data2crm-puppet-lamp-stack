class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "php5-curl",
    "libapache2-mod-php5",
    "php5-xhprof",
    "php5-memcached",
    "graphviz"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
