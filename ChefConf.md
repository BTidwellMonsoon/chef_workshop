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