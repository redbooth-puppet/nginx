class nginx (
  $worker_processes     = 4,
  $worker_connections   = 3500,
  $worker_rlimit_nofile = 4096,
  $port_number          = 8080,
  $config_template      = 'nginx/nginx.conf.erb',
  $user                 = 'www-data',
  $group                = 'www-data',
  $resolvers            = undef ,
  $version              = '1.4.1',
  $enable_service       = true,
  $access_log_path      = '/var/log/nginx/access.log',
  $error_log_path       = '/var/log/nginx/error.log'
) {

  anchor { "${title}::begin": } ->
  class  { 'nginx::install':  } ->
  class  { 'nginx::config':   } ->
  class  { 'nginx::service':  } ->
  anchor { "${title}::end":   }

}
