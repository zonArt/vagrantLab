# to use this vagrant box, please add the following lines to your host file:
# 10.240.21.100       box1.vagrantlab.com           box1
#
# Then you'll be able to access the instance with this address:
# http://box1.vagrantlab.com

class{'java':}
class{'tomcat':}
package { 'ack-grep': ensure => present }
package { 'vim': ensure => present }
