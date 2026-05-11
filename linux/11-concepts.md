# Linux Concepts for DevOps Engineers

## Namespaces
- **Namespaces** isolate kernel resources for a group of processes.
- Common namespace types:
  - `pid`: separate process ID space
  - `net`: separate network stack
  - `mnt`: separate mount points
  - `ipc`: separate IPC resources
  - `uts`: separate hostname/domain name
  - `user`: separate user and group IDs
- DevOps use case: namespaces are the foundation of containers and lightweight isolation.
- Inspect namespaces on Linux with:
  - `lsns`
  - `ip netns list`
  - `cat /proc/<pid>/ns/*`

## Control Groups (cgroups)
- **cgroups** manage resource limits for groups of processes.
- Resource controllers include CPU, memory, block I/O, devices, and more.
- DevOps use case: cgroups prevent a container or application from consuming too much host resource.
- Useful commands:
  - `systemd-cgls`
  - `systemd-cgtop`
  - `cat /sys/fs/cgroup/cpu,cpuacct/<group>/cpu.shares`

## Zombie Process
- A **zombie process** has completed execution but still has an entry in the process table.
- It exists because the parent process has not yet read its exit status via `wait()` or `waitpid()`.
- Zombies do not consume memory, but they do consume a PID slot.
- Detect zombies with:
  - `ps -eo pid,ppid,state,cmd | grep ' Z'`
  - `ps aux | awk '$8 == "Z" {print}'`
- If zombies build up, fix or restart the parent, or let `systemd` adopt and reap them.

## Kernel Release
- The **kernel release** identifies the running Linux kernel version.
- Use `uname -r` to display the release string.
- DevOps engineers use this to verify compatibility, security patch level, and hardware support.
- Example output: `5.15.0-82-generic`.

## `.bashrc` vs `.bash_profile`
- `.bash_profile` runs for **login shells** and is used to initialize environment variables, PATH, and session-specific settings.
- `.bashrc` runs for **interactive non-login shells**, and is typically used for aliases, shell functions, prompt customization, and interactive behavior.
- Common pattern in `.bash_profile`:
  ```bash
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
  ```
- DevOps use case: put environment setup in `.bash_profile` and interactive shell settings in `.bashrc` to avoid duplicate configuration.

## Filesystem Hierarchy
- The **root directory** `/` is the top of the Linux filesystem tree.
- Common top-level directories:
  - `/bin`: Essential user binaries needed in single-user mode and for all users.
  - `/sbin`: System binaries for administration, such as `fsck`, `ifconfig`, `iptables`.
  - `/etc`: Host-specific configuration files and startup scripts.
  - `/home`: User home directories.
  - `/root`: Home directory for the root user.
  - `/usr`: Secondary hierarchy for user programs and libraries.
    - `/usr/bin`: Non-essential user binaries.
    - `/usr/sbin`: Non-essential system binaries.
    - `/usr/lib`: Libraries for `/usr` programs.
  - `/var`: Variable data like logs, mail, spool files, and runtime files.
  - `/tmp`: Temporary files, often cleared on reboot.
  - `/opt`: Optional add-on application software packages.
  - `/dev`: Device files representing hardware and pseudo-devices.
  - `/proc`: Virtual filesystem for kernel and process information.
  - `/sys`: Virtual sysfs filesystem for kernel objects and device info.
- DevOps use case: understanding this layout helps when troubleshooting configuration, logs, packages, and system services.
