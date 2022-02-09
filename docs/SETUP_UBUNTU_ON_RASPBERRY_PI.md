# Setup Ubuntu on Raspberry Pi

- Download latest LTS image from official site.

  [Ubuntu - Install Ubuntu on a Raspberry Pi](https://ubuntu.com/download/raspberry-pi)

- Write the image to your SD-card. In this example, SD-card is mounted on /dev/sdc.

  ```bash
  xzcat ubuntu-20.04.3-preinstalled-server-arm64+raspi.img.xz | sudo dd of=/dev/sdc bs=1M
  ```

- Mount SD-card on your Mac.

  ```bash
  cd /Volumes/system-boot
  ```

- Enable SSH.

  ```bash
  touch ssh
  ```

- Optional: Disable bluetooth if don't need.

  ```bash
  echo "dtoverlay=disable-bt" >> config.txt
  ```

- Optional: Disable WiFi if don't need.

  ```bash
  echo "dtoverlay=disable-wifi" >> config.txt
  ```

- Optional: Activate cgroup if use docker and kubernetes.

  ```bash
  vi /Volumes/system-boot/cmdline.txt
  <snip> cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1
  ```
