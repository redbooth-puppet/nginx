class nginx::config {

  $dirs = [
    '/usr/share/nginx/html/',
    '/usr/share/nginx/html/system'
  ]

  file { $dirs:
    ensure  => 'directory',
    owner   => $nginx::owner,
    mode    => '0770',
  }
  
  file { '/etc/nginx/sites-enabled/default':
    ensure => absent,
  }

  file { '/etc/nginx/nginx.conf':
    content => template($nginx::config_template),
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { '/etc/nginx/mime.types':
    source => 'puppet:///modules/nginx/etc/nginx/mime.types',
    mode   => '0644',
    owner  => root,
    group  => root,
  } ->

  class { 'nginx::config::log': }

}
