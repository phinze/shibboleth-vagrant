#
# Based on instructions at:
# https://wiki.shibboleth.net/confluence/display/SHIB2/IdPApacheTomcatPrepare
#
class shibboleth::tomcat_config(
  $idp_home,
  $users,
  $tomcat_home
) {

  file { "${idp_home}/conf/users.xml":
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0640',
    content => template('shibboleth/users.xml.erb')
  }

  file { '/etc/tomcat6/Catalina/localhost/idp.xml':
    owner   => 'tomcat6',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('shibboleth/idp.xml.erb'),
    notify  => Class['tomcat::service']
  }

  exec { 'endorse-xerces-and-xalan':
    command => "cp -r ${idp_home}/lib/endorsed ${tomcat_home}/ && chown -R tomcat6: ${tomcat_home}/endorsed",
    creates => "${tomcat_home}/endorsed",
    notify  => Class['tomcat::service']
  }
}
