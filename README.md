# Shibboleth Vagrant

Get an instance of [Shibboleth](https://shibboleth.net/products/identity-provider.html) up and running using Vagrant and Puppet.

## Getting started

Before you start, ensure you have [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/) installed and working.

1. `git clone https://github.com/phinze/shibboleth-vagrant.git && cd shibboleth-vagrant`
2. `cp puppet/nodes/shibboleth.pp{.example,}`
3. `vagrant up`

That's it! The VM will be created and Puppet will download and configure shibboleth for you.

You can check to make sure everything worked by visiting: https://shibboleth.vagrant.dev/idp/status



## Configuration

Currently I'm just having this set up a default identity provider, but soon I'll fill in more details about the Puppet types provided and how to configure shibboleth with them. For now you can poke around the source; feel free to open an issue with a question if you have one.
