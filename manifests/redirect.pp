define nginx::redirect(
  $server_name   = '',
  $dest,
  $status        = 'permanent',
  $listen        = [80],
  $ssl           = false,
  $ssl_cert_path = '',
  $ssl_key_path  = '',
) {

  if $server_name == '' {
    $srvname = $name
  } else {
    $srvname = $server_name
  }

  file { "/etc/nginx/sites-enabled/${name}.conf":
    content => template("${module_name}/redirect.conf.erb"),
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Class['nginx::package'],
    notify  => Class['nginx::service'],
  }

}
