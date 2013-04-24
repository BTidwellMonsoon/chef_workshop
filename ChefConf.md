# Chef Adv. Workshop

## Mac OS X Provisioning
* Install Git, Vagrant, VirtualBox, etc. (you will be forgiven for needing to install Vagrant and VBox; if you're missing Git, do not pass "GO", do not collect $200).
* Opscode Chef Omnibus Installer
    * For the sake of the workshop, do not use rbenv **(disabled with `mv ~/.rbenv ~/.rbenv-disabled`; Will need to re-enable)**
    * Install script contains full gem stack
* Berkshelf and Foodcritic
	* `sudo /opt/chef/embedded/bin/gem install berkshelf foodcritic`
	* `ln -s /opt/chef/embedded/bin/berks /usr/local/bin/`
	* `ln -s /opt/chef/embedded/bin/foodcritic /usr/local/bin/`
* Install the `vagrant-berkshelf` plugin
    * `vagrant plugin install --plugin-version 1.2.0 vagrant-berkshelf`
    * Should *actually* work now.
* Investigate [Bento](https://github.com/opscode/bento) for box provisioning (wrapper around Veewee)

## Virtual Image Setup
* Configure machine for use with Berkshelf using `berks configure`.
    * After running this command, manually edit `~/.berkshelf/config.json`, and replace the contents of the file with the CentOS config from `gist 5112966.md`.
* Create the scaffold for a custom cookbook: `berks cookbook myface --chef-minitest`
    * This assumes a one-repo per project workflow.
    * Berkshelf adds Vagrant/Berksfile, and a small test suite.
* `cd myface && vagrant up` to get started.