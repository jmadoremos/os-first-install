# Pi-hole | Linux

Pi-hole is a Linux network-level advertisement and Internet tracker blocking application which acts as a DNS sinkhole and optionally a DHCP server, intended for use on a private network.

> This runs as a docker container.

## Installation

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/install.sh | bash
```
## Execution

> Before executing the command below, you can modify certain aspects of the container by changing the values under `#Define variables` section in **~/pi-hole/docker-run.sh** file.

```bash
~/pi-hole/docker-run.sh
```
