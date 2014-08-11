class apache {

  # install apache
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  # create directory
  file {"/etc/apache2/sites-enabled":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => File["/etc/apache2/sites-enabled/crm2crm_vh.conf"],
    require => Package["apache2"],
  }

  #crm2crm viryual hosts
  # create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/crm2crm_vh.conf":
    ensure => present,
    source => "/vagrant/manifests/crm2crm_vh.conf",
    require => Package["apache2"],
  }

  # symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/crm2crm_vh.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/crm2crm_vh.conf",
    require => File["/etc/apache2/sites-available/crm2crm_vh.conf"],
    notify => Service["apache2"],
  }

#api2crm viryual hosts
# create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/api2crm_vh.conf":
    ensure => present,
    source => "/vagrant/manifests/api2crm_vh.conf",
    require => Package["apache2"],
  }

# symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/api2crm_vh.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/api2crm_vh.conf",
    require => File["/etc/apache2/sites-available/api2crm_vh.conf"],
    notify => Service["apache2"],
  }

#xhprof viryual hosts
# create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/xhprof_vh.conf":
    ensure => present,
    source => "/vagrant/manifests/xhprof_vh.conf",
    require => Package["apache2"],
  }

# symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/xhprof_vh.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/xhprof_vh.conf",
    require => File["/etc/apache2/sites-available/xhprof_vh.conf"],
    notify => Service["apache2"],
  }

#crmpreview viryual hosts
# create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/api-preview_vh.conf":
    ensure => present,
    source => "/vagrant/manifests/api-preview_vh.conf",
    require => Package["apache2"],
  }

# symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/api-preview_vh.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/api-preview_vh.conf",
    require => File["/etc/apache2/sites-available/api-preview_vh.conf"],
    notify => Service["apache2"],
  }

#crmpreview viryual hosts
# create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/preview_vh.conf":
    ensure => present,
    source => "/vagrant/manifests/preview_vh.conf",
    require => Package["apache2"],
  }

# symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/preview_vh.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/preview_vh.conf",
    require => File["/etc/apache2/sites-available/preview_vh.conf"],
    notify => Service["apache2"],
  }

  # starts the apache2 service once the packages installed, and monitors changes to its configuration files and reloads if nesessary
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/crm2crm_vh.conf"]
    ],
  }
}
