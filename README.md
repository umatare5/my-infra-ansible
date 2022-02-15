# my-infra-ansible

my-infra-ansible manages server infrastructure in my labo.

- This repository is used for monitoring using on-premises resources.
- If you hope to use Serverless, please refer to [fargate-prometheus-boilerplate](https://github.com/umatare5/fargate-prometheus-boilerplate).

## Overview

![Overview](https://github.com/umatare5/my-infra-ansible/blob/images/diagram.png)

## Commands

| Command                    | Description                                           |
| -------------------------- | ----------------------------------------------------- |
| `make ubuntu2004`          | Prepare base configurations on Ubuntu 20.04.          |
| `make prometheus-exporter` | Setup Prometheus exporters on server.                 |
| `make prometheus-stack`    | Setup Prometheus and Alertmanager on docker.          |
| `make grafana-stack`       | Setup Grafana and Cortex on docker.                   |
| `make drone`               | Setup Drone CI Server and Runners on docker.          |
| `make datadog`             | Setup Datadog Agent on server.                        |
| `make dhcp`                | Setup ISC DHCP Server on server.                      |
| `make complete`            | Run every commands written above.                     |

## Prerequisite

- Install ansible and relating packages.

  ```bash
  pip3 install -r requirements.txt
  ```

## Preparation

- Update sshd_config.

  ```bash
  vi /etc/ssh/sshd_config
  ```

- Put authorized_keys for root.

  ```bash
  vi ~/.ssh/authorized_keys
  ```

- Restart sshd.service.

  ```bash
  systemctl restart sshd.service
  ```

- Update apt repositories and packages.

  ```bash
  apt update && apt upgrade -y
  ```

- Restart.

  ```bash
  shutdown -r now
  ```

## Appendix: Configure Static IP

- Edit `/etc/netplan/50-cloud-init.yaml` as below.

  ```bash
  network:
      ethernets:
          eth0:
              addresses:
              - 192.168.0.XXX/24    # Set static IP address
              dhcp4: false
              gateway4: 192.168.0.1 # Set gateway address
              nameservers:
                  addresses:
                  - 8.8.8.8
                  - 8.8.4.4
                  search: []
      version: 2
  ```

- Apply changes.

  ```bash
  netplan apply
  ```

## Appendix: Use Raspberry Pi

- Please refer to [SETUP_UBUNTU_ON_RASPBERRY_PI.md](docs/SETUP_UBUNTU_ON_RASPBERRY_PI.md).
