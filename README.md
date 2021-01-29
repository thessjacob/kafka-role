# Ansible Kafka Role

This is a role to install and configure a basic 1 node/3 node kafka cluster with zookeeper.
It creates a basic configuration with few changes from the default, meaning it is useful for 
testing and for getting started with kafka, but may not be suitable for production.

The role is idempotent and running it more than once should not cause any configuation issues.

## What it can do

- completely install and configure a 3 node zookeeper/kafka cluster
- add additional kafka nodes to a cluster without creating additional zookeeper nodes

- The role does assume that a /data exists.

## Requirements

- tarball\_download.sh should be run once to download the java and kafka tarballs. You may wish to
download these tarballs yourself if you wish to pick closer mirrors. It can be safely run more than once
and easily edited with different java and kafka versions.
- You can run it with: 
```
./tarball_download.sh
```

## Inventory Variables

- Every host in the inventory should have a "node\_id" variable. This variable will create the
zookeeper id on the first 3 nodes and the broker id on all nodes. 

``` sh
[kafka_cluster]
kafka-node01.mydomain.net node_id='1'
kafka-node02.mydomain.net node_id='2'
kafka-node03.mydomain.net node_id='3'
```

## Sample Playbook

```sh
 ---
 - hosts: kafka_cluster
  tasks:
    - import_role:
        name: roles/kafka-role
```

## Updating files

Both Kafka version and Java version can be updated by downloading new tarballs and placing them in the
files folder. The version variables should then be updated in kafka/vars/main/vars.yml. 

Worth noting is that the jdk tarball should be abbreviated to just "openjdk-<version #>.tgz" to keep 
directories cleaner.

## License
MIT

## Author

thessjacob

github.com/thessjacob/kafka-role
