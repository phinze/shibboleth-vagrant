class shibboleth::shib_config(
  $idp_home,
  $idp_entity_id,
  $service_providers
) {
  file { "${idp_home}/conf/relying-party.xml":
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('shibboleth/relying-party.xml.erb'),
    notify  => Class['tomcat::service']
  }
  file { "${idp_home}/conf/attribute-resolver.xml":
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('shibboleth/attribute-resolver.xml.erb'),
    notify  => Class['tomcat::service']
  }
  file { "${idp_home}/conf/attribute-filter.xml":
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('shibboleth/attribute-filter.xml.erb'),
    notify  => Class['tomcat::service']
  }

}
