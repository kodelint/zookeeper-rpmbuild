zookeeper-rpmbuild
---------
A set of scripts to package zookeeper into an rpm.
Requires **CentOS/RedHat 7**.

#### Tarball Source
-----
Presently it is downloading `tarballs` from [archive.apache.org](http://archive.apache.org/dist/zookeeper/). Ideally we should download the [stable](http://archive.apache.org/dist/zookeeper/stable/) version of `zookeeper` but we wanted to keep the ability to download and build `RPMs` for any `zookeeper` version. 

So, **Please, Please, Please** check the [stable](http://archive.apache.org/dist/zookeeper/stable/) version.

#### Setup
-----
    sudo yum install make rpmdevtools

#### Building
--------
Use `Make`

    make rpm

or use `Docker`. Environment variable `zoo_version` can be used to change zookeeper `versions`

    docker build -t zookeeper-build . && docker run -ti -v $(pwd)/RPMS:/root/x86_64/ -e zoo_version="3.4.10" zookeeper-build


Resulting RPM will be avaliable at `$(pwd)/RPMS`

#### Installing and operating
------------------------
```
sudo yum install zookeeper*.rpm
sudo systemctl start zookeeper
sudo systemctl enable zookeeper
```

Zookeeper shell is available via `/usr/local/bin/zkcli` or just `zkcli` since `/usr/local/bin` is usually in the `$PATH`.

#### Locations
-----------------
|Items | Default Locations  | 
|:------------- |:-------------|
| Binaries     | `/usr/local/zookeeper` |
| Data      |`/usr/local/zookeeper/data`|
| Logs      | `/var/log/zookeeper`|
| Configs| `/etc/zookeeper`, `/etc/sysconfig/zookeeper`|
