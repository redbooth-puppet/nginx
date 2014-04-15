class nginx::config::log {

  rsyslog::imfile { 'nginx-access':
    log_file => '/var/log/nginx/access.log'
  }

  rsyslog::imfile { 'nginx-error':
    log_file => '/var/log/nginx/error.log'
  }

  file { '/var/log/nginx/error.log':
    group => 'syslog',
  }

  file { '/var/log/nginx/access.log':
    group => 'syslog',
  }

  file { '/etc/logrotate.d/nginx':
    source => 'puppet:///modules/nginx/etc/logrotate.d/nginx',
  }

}
