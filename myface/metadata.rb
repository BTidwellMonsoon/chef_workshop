name             "myface"
maintainer       "Blake Tidwell"
maintainer_email "blake@monsoonco.com"
license          "All rights reserved"
description      "Installs/Configures myface"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.6.0"

depends         "minitest-handler", "= 0.1.7"
depends         "mysql", "= 2.1.2"
depends         "database", "= 1.3.12"
depends         "apache2", "= 1.6.2"