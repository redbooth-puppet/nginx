class nginx::service {

  if ($nginx::enable_service) {
    service { 'nginx':
      ensure     => running,
      enable     => true,
      hasrestart => true,
    }
  }

}
