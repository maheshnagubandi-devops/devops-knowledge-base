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

## Networking
1. Test connectivity?
   - `ping host`

2. Check listening ports?
   - `netstat -tuln`, `ss -tuln`

3. Configure IP?
   - `ifconfig eth0 192.168.1.100`

4. SSH without password?
   - Copy public key to authorized_keys

## System Administration
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

5. What is swap?
   - Virtual memory on disk

## Scenarios
1. Recover root password?
   - Boot to single user mode

2. Fix broken packages?
   - `apt --fix-broken install`

3. Monitor system resources?
   - `top`, `htop`, `sar`

4. Backup filesystem?
   - `tar -cvzf backup.tar.gz /path`

5. Secure SSH?
   - Disable root login, use keys, change port
