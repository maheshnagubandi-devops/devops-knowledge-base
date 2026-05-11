# Linux Interview Questions

## Basic Commands
1. What does `ls -la` show?
   - Long listing with hidden files

2. Difference between `cp` and `mv`?
   - cp copies, mv moves/renames

3. How to find a file?
   - `find /path -name filename`

4. Change permissions?
   - `chmod 755 file`

5. View file contents?
   - `cat`, `less`, `head`, `tail`

## File System
1. What is inode?
   - Index node, file metadata

2. Soft vs Hard links?
   - Soft: pointer, Hard: duplicate inode

3. Check disk usage?
   - `df -h`, `du -sh`

4. Mount a filesystem?
   - `mount /dev/sda1 /mnt`

## Processes
1. View running processes?
   - `ps aux`, `top`

2. Kill a process?
   - `kill PID`, `kill -9 PID`

3. Run in background?
   - `command &`, `nohup command &`

4. Check system load?
   - `uptime`, `top`

## System Administration
1. How to shutdown/reboot system?
   - `shutdown -h now` (halt), `shutdown -r now` (reboot), `reboot`, `halt`

2. What is runlevel?
   - System state defining services (0=halt, 1=single-user, 3=multi-user, 5=GUI, 6=reboot)

3. How to change runlevel?
   - `init` or `telinit` command (older systems), `systemctl isolate` (systemd)

4. What is systemd?
   - Modern init system and service manager, replaces SysV init

5. Kernel module commands?
   - `lsmod` (list), `modprobe` (load/unload), `insmod` (insert), `rmmod` (remove)

6. How to tune kernel parameters?
   - `sysctl -w parameter=value`, edit `/etc/sysctl.conf`

7. Process priority commands?
   - `nice` (start with priority), `renice` (change running), `chrt` (scheduling policy)

8. CPU affinity?
   - `taskset` to bind processes to specific CPU cores

## Advanced Monitoring
1. I/O monitoring tools?
   - `iotop` (interactive), `iostat` (stats), `blktrace` (detailed tracing)

2. System call tracing?
   - `strace` (system calls), `ltrace` (library calls)

3. Network packet analysis?
   - `tcpdump` (command line), `wireshark` (GUI)

4. Disk usage analysis?
   - `du` (basic), `ncdu` (interactive), `find` with size options

## Backup & Recovery
1. Advanced rsync usage?
   - `rsync -avz --delete --exclude` for incremental backups

2. Low-level copying?
   - `dd if=input of=output bs=blocksize` for disks/images

3. Filesystem backup?
   - `dump` (ext2/ext3/ext4), `xfsdump` (XFS), `btrfs send` (Btrfs)

4. Log rotation?
   - `logrotate` configuration in `/etc/logrotate.d/`

## Security
1. Firewall types?
   - Packet filtering, stateful inspection, proxy, next-gen firewalls

2. UFW vs iptables?
   - UFW is frontend for iptables, easier to use

3. SELinux/AppArmor?
   - Mandatory access control, SELinux (RedHat), AppArmor (Ubuntu)

4. SSH security best practices?
   - Disable root login, use key auth, non-standard ports, fail2ban

5. What is chroot?
   - Change root directory for process isolation

6. How to check file integrity?
   - `md5sum`, `sha256sum` commands

3. Configure IP?
   - `ifconfig eth0 192.168.1.100`

4. SSH without password?
   - Copy public key to authorized_keys

## SSH and Security
1. How to set up passwordless SSH?
   - Generate key pair with ssh-keygen, copy public key to remote ~/.ssh/authorized_keys, set proper permissions (700 ~/.ssh, 600 authorized_keys)

2. What is SSH key-based authentication?
   - Uses public/private key pair instead of passwords; public key on server, private key on client

3. SSH tunneling types?
   - Local port forwarding (-L), Remote port forwarding (-R), Dynamic port forwarding (-D SOCKS proxy)

4. How to securely copy files between servers?
   - Use scp with key authentication: `scp -i key file user@host:/path`

5. What is SSH agent?
   - Program that holds decrypted private keys in memory, eliminates need to enter passphrase repeatedly

6. SSH security best practices?
   - Use strong keys (ed25519/4096-bit RSA), disable password auth, use non-standard ports, restrict users, monitor logs

7. How to troubleshoot SSH connection issues?
   - Check service status, verify permissions, test connectivity, use verbose mode (-v), check firewall rules

8. What is X11 forwarding in SSH?
   - Allows running graphical applications on remote server and displaying them locally

9. How to create SSH config file?
   - Create ~/.ssh/config with Host entries containing HostName, User, Port, IdentityFile, etc.

10. What are SSH key types?
    - RSA (traditional), DSA (deprecated), ECDSA (elliptic curve), Ed25519 (modern, recommended)
1. Check system info?
   - `uname -a`, `hostnamectl`

2. Manage services?
   - `systemctl start/stop service`

3. View logs?
   - `journalctl`, `tail -f /var/log/syslog`

4. Schedule tasks?
   - `crontab -e`

## Shell Scripting
1. What is shebang?
   - `#!/bin/bash` - interpreter directive

2. Variable assignment?
   - `var=value`, access with `$var`

3. Conditional statement?
   - `if [ condition ]; then ... fi`

4. Loop structure?
   - `for var in list; do ... done`

## Troubleshooting
1. System running slow?
   - Check `top`, `free`, `iostat`

2. Disk full?
   - `df -h`, `du -sh /*`

3. Network issues?
   - `ping`, `traceroute`, `netstat`

4. Service not starting?
   - `systemctl status`, `journalctl -u service`

## Permissions
1. File permission 755 means?
   - Owner: rwx, Group: rx, Others: rx

2. Change ownership?
   - `chown user:group file`

3. Setuid bit?
   - Execute as file owner

## Advanced
1. What is /proc?
   - Virtual filesystem with process info

2. Kernel parameters?
   - `sysctl -a`, modify in /etc/sysctl.conf

3. RAID levels?
   - 0: striping, 1: mirroring, 5: parity

4. LVM components?
   - PV, VG, LV

5. Secure SSH?
   - Disable root login, use keys, change port

## File System & Storage
1. What is an inode?
   - Index node containing file metadata (permissions, ownership, timestamps, size, location)

2. Difference between hard and soft links?
   - Hard link: Direct reference to inode, shares same inode number
   - Soft link: Pointer to another file, has its own inode

3. What is /proc filesystem?
   - Virtual filesystem providing process and kernel information

4. How to check filesystem usage?
   - `df -h` for disk free, `du -sh` for directory usage

5. What is LVM?
   - Logical Volume Manager: Provides logical layer over physical storage

6. RAID levels and their use cases?
   - RAID 0: Striping (performance), RAID 1: Mirroring (redundancy)
   - RAID 5: Parity (balance), RAID 10: Mirror + stripe (performance + redundancy)

## Networking
1. OSI model layers?
   - Physical, Data Link, Network, Transport, Session, Presentation, Application

2. TCP vs UDP?
   - TCP: Connection-oriented, reliable, ordered
   - UDP: Connectionless, unreliable, faster

3. What is subnetting?
   - Dividing IP network into sub-networks for better management

4. How does DNS work?
   - Translates domain names to IP addresses using hierarchical servers

5. What is NAT?
   - Network Address Translation: Maps private IPs to public IPs

6. Firewall types?
   - Packet filtering, stateful inspection, proxy, next-gen firewalls

## Security
1. What is sudo?
   - Superuser do: Execute commands as another user (usually root)

2. SSH key vs password authentication?
   - Key: More secure, no password prompts
   - Password: Simpler but vulnerable to brute force

3. What is SELinux?
   - Security Enhanced Linux: Mandatory access control system

4. How to check file integrity?
   - Use checksums: `md5sum`, `sha256sum`

5. What is a rootkit?
   - Malicious software that hides its presence and maintains privileged access

## Performance & Monitoring
1. What is load average?
   - Average number of processes waiting for CPU time over 1, 5, 15 minutes

2. How to monitor system resources?
   - `top`, `htop`, `sar`, `iostat`, `vmstat`, `free`

3. What is swap space?
   - Virtual memory on disk when RAM is full

4. How to troubleshoot high CPU usage?
   - `top` to identify process, `strace` to debug, `nice` to adjust priority

5. What is I/O wait?
   - Time CPU spends waiting for I/O operations to complete

## Automation & Scripting
1. What is cron?
   - Time-based job scheduler in Unix-like systems

2. How to run a script in background?
   - `nohup script.sh &` or `script.sh &`

3. What is shebang?
   - `#!/bin/bash` - tells system which interpreter to use

4. How to debug a shell script?
   - `bash -x script.sh` for trace execution

5. What is xargs?
   - Builds and executes command lines from standard input

## System Administration
1. What is runlevel?
   - System state defining which services are running

2. How to change runlevel?
   - `init` or `telinit` command (older systems)

3. What is systemd?
   - Modern init system and service manager

4. How to manage services?
   - `systemctl start/stop/restart/enable/disable service`

5. What is journald?
   - systemd's logging system

## Advanced Concepts
1. What is kernel?
   - Core part of OS managing hardware and system resources

2. What is a system call?
   - Interface between user programs and kernel

3. What is virtual memory?
   - Memory management technique allowing programs to use more memory than physically available

4. What is context switching?
   - Process of saving and restoring CPU state when switching between processes

5. What is a zombie process?
   - Process that has completed execution but still has entry in process table

6. What is a daemon?
   - Background process that runs continuously, not attached to terminal

7. What is syslog?
   - Standard logging system for Unix-like systems

8. What is /etc/fstab?
   - File containing information about filesystems to mount at boot

9. What is /etc/passwd?
   - File containing user account information

5. What is /etc/shadow?
    - File containing encrypted user passwords

## Vi/Vim Editor
1. What are the main modes in vi/vim?
   - Command mode (default), Insert mode (i/a/o), Visual mode (v/V/Ctrl+v), Command-line mode (:)

2. How to search and replace in vi/vim?
   - `:%s/old/new/g` (replace all), `:%s/old/new/gc` (with confirmation)

3. How to delete a line in vi/vim?
   - `dd` in command mode

4. How to undo in vi/vim?
   - `u` for undo, `Ctrl+r` for redo

5. How to save and quit in vi/vim?
   - `:w` (save), `:q` (quit), `:wq` (save and quit), `:q!` (force quit)

6. How to copy and paste in vi/vim?
   - `yy` (copy line), `p` (paste after cursor), `P` (paste before cursor)

7. How to search in vi/vim?
   - `/pattern` (forward), `?pattern` (backward), `n` (next), `N` (previous)

8. How to open multiple files in vi/vim?
   - `vim file1 file2`, `:n` (next file), `:N` (previous file)

9. How to split windows in vi/vim?
   - `:split` (horizontal), `:vsplit` (vertical), `Ctrl+w` + direction to navigate

10. What is the difference between vi and vim?
    - vim is enhanced vi with more features like syntax highlighting, multiple windows, etc.
