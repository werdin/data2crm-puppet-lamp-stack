class other {
  $packages = ["curl", "vim", "emacs"]
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
