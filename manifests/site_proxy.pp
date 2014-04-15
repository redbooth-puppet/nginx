define nginx::site_proxy(
  $server_name,
  $proxy_pass,
  $listen = 80,
  $ssl = false,
  $ssl_cert_path = '',
  $ssl_key_path = '',
  $rewrite_hostname = true,
  $ensure_ssl = false,
  $proxy_read_timeout = 60,
  $proxy_connect_timeout = 60,
  $keepalive_timeout = 60,
  $proxy_send_timeout = 60,
  $client_max_body_size = '250M',
) {

  file { "/etc/nginx/sites-enabled/${name}.conf":
    content => template("${module_name}/site_proxy.conf.erb"),
    mode    => '0644',
    owner   => root,
    require => Class['nginx::package'],
    notify  => Class['nginx::service'],
  }

}
