class shibboleth(
  $service_providers,      # { 'sp-title'  => 'sp-metadata-url' }
  $users,                  # { 'username' => 'password'        }
  $version                 = '2.4.0',
  $idp_home                = '/opt/shibboleth-idp',
  $keystore_password       = 'changeit',
  $port                    = '80',
  $status_page_allowed_ips = '192.168.66.1/32 127.0.0.1/32 ::1/128',
  $tomcat_home             = '/usr/share/tomcat6',
  $idp_entity_id           = "https://${fqdn}/idp/shibboleth",
){

  class { 'shibboleth::prereqs':
    port => $port
  }

  class { 'shibboleth::download':
    version => $version
  }

  class { 'shibboleth::install':
    version                 => $version,
    idp_home                => $idp_home,
    status_page_allowed_ips => $status_page_allowed_ips,
    keystore_password       => $keystore_password
  }

  class { 'shibboleth::tomcat_config':
    idp_home    => $idp_home,
    users       => $users,
    tomcat_home => $tomcat_home,
  }

  class { 'shibboleth::shib_config':
    idp_home          => $idp_home,
    idp_entity_id     => $idp_entity_id,
    service_providers => $service_providers
  }

  Class['shibboleth::prereqs'] ->
    Class['shibboleth::download'] ->
    Class['shibboleth::install'] ->
    Class['shibboleth::tomcat_config'] ->
    Class['shibboleth::shib_config']
}
