class memcached {
  # install mysql server
  package { "memcached":
    ensure => present,
    require => Exec["apt-get update"]
  }

  #start mysql service
  service { "memcached":
    ensure => running,
    require => Package["memcached"],
  }

}

