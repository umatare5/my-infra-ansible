# Setup Ubuntu on Raspberry Pi

- Download latest LTS image from official site.

  [Ubuntu - Install Ubuntu on a Raspberry Pi](https://ubuntu.com/download/raspberry-pi)

- Write the image to your SD card. In this example, the SD card is mounted on `/dev/disk4`.

  ```bash
  xzcat < ubuntu-24.04.1-preinstalled-server-arm64+raspi.img.xz | sudo dd of=/dev/disk4 bs=16m status=progress
  ```

- Mount a SD card on your Mac.

  ```bash
  cd /Volumes/system-boot
  ```

- Setup netplan using `./network-config`.

  ```yaml
  code ./network-config
  ---
  network:
    version: 2

    ethernets:
      eth0:
        addresses: [192.168.0.221/24]
        routes:
          - to: default
            via: 192.168.0.1
        nameservers:
          addresses: [8.8.8.8]
        optional: true
  ```

- Enable SSH.

  ```diff
  code ./user-data

  ---
  - ssh_pwauth: false
  + ssh_pwauth: true
  ```

- Set hostname.

  ```bash
  echo "hostname: kvm1" >> ./user-data
  ```

- Optional: Disable bluetooth if don't need.

  ```bash
  echo "dtoverlay=disable-bt" >> ./config.txt
  ```

- Optional: Disable WiFi if don't need.

  ```bash
  echo "dtoverlay=disable-wifi" >> ./config.txt
  ```

- Optional: Activate cgroup if use docker and kubernetes.

  ```bash
  code ./cmdline.txt
  <snip> cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1
  ```
