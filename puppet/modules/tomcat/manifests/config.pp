class tomcat::config(
  $port,
  $authbind
){
  file { '/etc/tomcat6/server.xml':
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('tomcat/server.xml.erb')
  }

  $cert_dname = 'CN=shibboleth.vagrant.dev, OU=vagrant.dev, O=vagrant, L=Chicago, S=Illinois, C=US'

  exec { 'genkeypair':
    command     => "keytool -genkeypair -alias tomcat -keyalg RSA -keysize 2048 -dname '${cert_dname}' -storepass changeit -keypass changeit",
    user        => 'tomcat6',
    cwd         => '/usr/share/tomcat6',
    creates     => '/usr/share/tomcat6/.keystore'
  }

  file { '/etc/default/tomcat6':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/tomcat6')
  }

  # fix tomcat user homedir permissions
  file { '/usr/share/tomcat6':
    ensure => directory,
    owner  => 'tomcat6',
    group  => 'tomcat6',
    mode   => '0755'
  }

}
