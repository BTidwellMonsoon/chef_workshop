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

* Look into [Bento](https://github.com/opscode/bento) for automated provisioning (wrapper around Veewee)

# Culture of CI (Everything Markdown)
## What is culture
* Culture byproduct of consistent behavior
* Organizatin values
* Blah blah blah
* what are the group and team structures, relations, etc.
* It is hierarachical there are super and sub-cultures.
* It is emotional; changes or "affronts" to the culture evoke emotional response; handle with care

> "Culture eats strategy for breakfast."

> "Cultures creates either pleasure or pain..."

# Infra Is Garbage

* bottle.py
* haproxy
* spiceweasel
* datadog

# Taming Chef for Devs (or Ninefold's Pitch)

## Dep Mgmt
1. Single cookbook code repos
1. Use feature brranches
1. Use exact deps in md.rb
1. Manage using Berkshelf (don't use for dep calcs)
1. List inferred cookbooks explicitly first
1. One app infra eqauls one chef org

## Attrs vs Data Bags
* Persistent something something *screw that slide anyway I didn't even want to read it.*

## Role Based - Recipe Driven
* Start with run_list
* Use role based approach one recipe with subsequent loading based on role
* Allows for role version control

## Variable Convergence
* Use dyn chef-client interval to paralellise srv conig e.g. separate app and master DB
* Chef 11 prevents chef-client collisions

### Using the **Heavy Water Injector** cookbook, inject recipes or code blocks at arbitrary locs in a run
* pre_deploy, pre_migrate, post_deploy
