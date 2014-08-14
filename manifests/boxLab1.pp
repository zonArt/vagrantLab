# to use this vagrant box, please add the following lines to your host file:
# 127.0.1.1       box1.vagrantlab.com           box1
#
# Then you'll be able to access the instance with this address:
# http://box1.vagrantlab.com

class{'java':}

package { 'wget': ensure => present }
package { 'rerun': ensure => present }
