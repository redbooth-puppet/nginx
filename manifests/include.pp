define nginx::include ($content=undef) {

  file{"/etc/nginx/conf.d/${name}":
    ensure  => present,
    content => $content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['nginx::service'],
  }
}
