# myface cookbook

# Requirements
* Chef 11.04 or higher
* CentOS 6.3

# Usage
Example cookbook written to show Application Cookbook pattern

# Attributes
None

# Recipes
default.rb
* Adds `myface` user
* Installs MySQL
* Creates MySQL schema and seeds DB with data
* Installs Apache & mod PHP
* Disables Apache default web site
* Configures Apache to serve MyFace on default port
* Deploys MyFace application

# Author
Le Me (Blade Tidwell)

Author:: Blake Tidwell (blake@monsoonco.com)
