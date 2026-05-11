# Troubleshooting Commands

## System Logs
- `dmesg`: Kernel messages
- `journalctl`: Systemd logs
- `journalctl -u service`: Service logs
- `tail -f /var/log/syslog`: Follow syslog
- `tail -f /var/log/messages`: Messages log

## Disk Issues
- `df -h`: Disk usage
- `du -sh *`: Directory sizes
- `fdisk -l`: Partition info
- `lsblk`: Block devices
- `mount`: Mounted filesystems
- `umount`: Unmount

## Memory Issues
- `free -h`: Memory usage
- `vmstat`: Virtual memory stats
- `top`: Process memory
- `ps aux --sort=-%mem`: Memory hogs

## CPU Issues
- `top`: CPU usage
- `mpstat`: CPU stats
- `iostat`: I/O stats
- `sar`: System activity

## Network Issues
- `ping host`: Connectivity
- `traceroute host`: Routing
- `netstat -tuln`: Listening ports
- `ss -tuln`: Socket stats
- `ifconfig`: Interface config
- `ip addr`: IP addresses
- `nslookup domain`: DNS
- `dig domain`: DNS details

## Process Issues
- `ps aux`: All processes
- `lsof -p PID`: Open files by process
- `strace -p PID`: System calls
- `pstree`: Process tree

## File Issues
- `ls -la`: Permissions
- `find . -type f -perm 777`: Bad permissions
- `df -i`: Inode usage
- `fsck`: Filesystem check

## Service Issues
- `systemctl status service`: Check service status
- `systemctl start/stop/restart service`: Control service
- `journalctl -u service`: Service-specific logs
- `journalctl -u service -n 50 --no-pager`: Last 50 log lines

## Port and Connection Issues
- `netstat -tulnp`: Show listening ports with PIDs
- `ss -tulnp`: Socket stats with PIDs (modern alternative)
- `lsof -i :port`: Find process using port
- `netstat -an | grep ESTABLISHED`: Show established connections
- `netstat -an | grep TIME_WAIT`: Check for hung connections

## Large File Issues
- `find / -type f -size +500M`: Find files larger than 500MB
- `find / -type f -size +1G`: Find files larger than 1GB
- `du -sh /* | sort -hr | head`: Top 10 directories by size

## Service Issues
- `systemctl status service`: Service status
- `journalctl -u service`: Service logs
- `systemctl restart service`: Restart

## Boot Issues
- `dmesg | head`: Early boot logs
- `grub-mkconfig`: Regenerate GRUB
- `update-grub`: Update GRUB

## Package Issues
- `apt list --installed`: Installed packages
- `dpkg -l`: Package list
- `apt check`: Dependency check
- `apt --fix-broken install`: Fix broken

## User Issues
- `id user`: User info
- `groups user`: User groups
- `passwd user`: Change password
- `usermod`: Modify user

## Security Issues
- `last`: Login history
- `who`: Current logins
- `netstat -tuln`: Open ports
- `ufw status`: Firewall status
- `chkrootkit`: Rootkit check

## Performance Tuning
- `nice`: Set priority
- `ionice`: I/O priority
- `ulimit`: Resource limits
- `sysctl`: Kernel parameters

## Common Fixes
- Out of memory: Kill processes or add swap
- Disk full: Clean logs, remove files
- Network down: Check interfaces, routes
- Service failed: Check logs, dependencies
- Boot failure: GRUB repair, filesystem check