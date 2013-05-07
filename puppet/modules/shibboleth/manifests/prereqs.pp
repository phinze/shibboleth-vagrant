class shibboleth::prereqs(
  $port
){
  # our web container
  class { '::tomcat':
    port => $port
  }

  # required to extract the source files
  package { 'unzip': ensure => installed }
}
