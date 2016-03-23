# Zurich Docker BDay party

## Prerequisites

### Vagrant

```
export VAGRANT_BIN=https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
wget ${VAGRANT_BIN}
dpkg -i $(basename ${VAGRANT_BIN})
```

### Virtualbox

```
source /etc/lsb-release
export VIRTUALBOX_BIN=http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~${DISTRIB_CODENAME}_amd64.deb
wget ${VIRTUALBOX_BIN}
dpkg -i $(basename ${VIRTUALBOX_BIN})
```

### Getting started

```
vagrant up --provider virtualbox --provision
```

The docker_bday.sh script install the docker engine and pull the appropriate images

Have Fun.
