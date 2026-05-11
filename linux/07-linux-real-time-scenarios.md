# Real-Time Scenarios

## Scenario 1: Server Running Out of Memory
1. Check memory: `free -h`
2. Find memory hogs: `ps aux --sort=-%mem | head`
3. Kill process: `kill -9 PID`
4. Add swap: `dd if=/dev/zero of=/swapfile bs=1M count=1024`
5. `mkswap /swapfile && swapon /swapfile`

## Scenario 2: Disk Space Full
1. Check usage: `df -h`
2. Find large files: `du -sh /* | sort -hr | head`
3. Clean logs: `find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;`
4. Remove packages: `apt autoremove && apt autoclean`

## Scenario 3: Network Connectivity Issues
1. Test connectivity: `ping 8.8.8.8`
2. Check interface: `ip addr show`
3. Check routes: `ip route show`
4. DNS test: `nslookup google.com`
5. Restart network: `systemctl restart networking`

## Scenario 4: Service Not Starting
1. Check status: `systemctl status service`
2. View logs: `journalctl -u service`
3. Check dependencies: `systemctl list-dependencies service`
4. Manual start: `systemctl start service`

## Scenario 5: High CPU Usage
1. Check top processes: `top`
2. CPU stats: `mpstat`
3. Find culprit: `ps aux --sort=-%cpu | head`
4. Kill if needed: `kill -9 PID`

## Scenario 6: File Permissions Issues
1. Check permissions: `ls -la file`
2. Fix permissions: `chmod 644 file`
3. Change owner: `chown user:group file`
4. Recursive fix: `chmod -R 755 dir`

## Scenario 7: SSH Connection Refused
1. Check SSH service: `systemctl status ssh`
2. Check port: `netstat -tuln | grep 22`
3. Firewall: `ufw status`
4. Config: `cat /etc/ssh/sshd_config`

## Scenario 8: Boot Issues
1. Check GRUB: `cat /boot/grub/grub.cfg`
2. Reinstall GRUB: `grub-install /dev/sda && update-grub`
3. Check filesystem: `fsck /dev/sda1`

## Scenario 9: Package Installation Fails
1. Update package list: `apt update`
2. Fix broken: `apt --fix-broken install`
3. Clean cache: `apt clean && apt autoclean`
4. Reinstall: `apt install --reinstall package`

## Scenario 10: User Cannot Login
1. Check user: `id username`
2. Check password: `passwd username`
3. Check shell: `chsh username`
4. Check groups: `usermod -aG group username`

## Scenario 11: System Hanging
1. Check load: `uptime`
2. Kill processes: `killall -9 process`
3. Restart services: `systemctl restart service`
4. Reboot if needed: `reboot`

## Scenario 12: Database Connection Issues
1. Check service: `systemctl status mysql`
2. Check port: `netstat -tuln | grep 3306`
3. Test connection: `mysql -u user -p`
4. Check config: `cat /etc/mysql/mysql.conf.d/mysqld.cnf`

## Scenario 13: Web Server Not Responding
1. Check service: `systemctl status apache2`
2. Check port: `netstat -tuln | grep 80`
3. Test locally: `curl localhost`
4. Check logs: `tail -f /var/log/apache2/error.log`

## Scenario 14: Cron Jobs Not Running
1. Check cron: `crontab -l`
2. Check service: `systemctl status cron`
3. Check logs: `grep CRON /var/log/syslog`
4. Test manually: Run command directly

## Scenario 15: Firewall Blocking Traffic
1. Check rules: `ufw status`
2. Allow port: `ufw allow 80`
3. Reload: `ufw reload`
4. Test: `telnet host port`

## Concept Summary for DevOps
- **Namespaces and cgroups**: use the container basics lab and `11-concepts.md` for theory, especially when troubleshooting container isolation or resource limits.
- **Zombie processes**: check for `<defunct>` processes in the process table with `ps -eo pid,ppid,state,cmd`.
- **Kernel release**: verify `uname -r` when hardware compatibility or distro-specific bugs matter.
- **Bash init files**: understand `.bash_profile` for login shells and `.bashrc` for interactive shells when debugging environment or PATH issues.
- **Links**: see `11-concepts.md` for theory, `09-labs.md` for practice, and `08-interview-questions.md` for concept questions.

---

## Real-Time Troubleshooting Decision Tree

### High CPU Issue
```bash
# Step 1: Identify the problem
top
htop

# Step 2: Find the culprit process
ps -ef --sort=-%cpu | head -10

# Step 3: Get detailed info
ps aux | grep PID
cat /proc/PID/status

# Step 4: Debug (attach with strace, check logs, etc.)
strace -p PID
journalctl -u service -f

# Step 5: Kill or restart if needed
kill -9 PID
systemctl restart service
```

### High Memory Issue
```bash
# Step 1: Check memory status
free -m
free -h

# Step 2: Analyze memory usage
top -b -n 1
ps -ef --sort=-%mem | head -10

# Step 3: Check if swap is in use
free -h | grep Swap
vmstat 1 3

# Step 4: Find memory leaks or hogs
ps aux | awk '{print $6, $11}' | sort -rn | head

# Step 5: Add swap if needed (temporary)
dd if=/dev/zero of=/swapfile bs=1M count=2048
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

### Disk Full Issue
```bash
# Step 1: Check disk usage
df -h
df -i  # Check inode usage too

# Step 2: Find large files/directories
du -sh /*
du -sh /path/* | sort -hr | head -10

# Step 3: Find large log files
find /var/log -type f -size +100M -ls

# Step 4: Clean up
truncate -s 0 /var/log/file.log
rm -rf /tmp/* /var/tmp/*
apt clean && apt autoclean

# Step 5: Identify root cause
# Check what's consuming space
lsof +D /path  # Open files in path
```

### Service Down Issue
```bash
# Step 1: Check service status
systemctl status service
service service status

# Step 2: View recent logs
journalctl -u service -n 50 --no-pager
journalctl -u service -f

# Step 3: Check if process is running
ps -ef | grep service
pgrep -f service

# Step 4: Check port/socket
netstat -tulnp | grep service
ss -tulnp | grep service
lsof -i :port

# Step 5: Try to start
systemctl start service
systemctl restart service

# Step 6: Check dependencies
systemctl list-dependencies service
systemctl list-dependencies --all service
```

### Port/Connection Issue
```bash
# Step 1: Check which process is using the port
lsof -i :8080
netstat -tulnp | grep 8080
ss -tulnp | grep 8080

# Step 2: Check if service is listening
ss -tuln | grep LISTEN

# Step 3: Check firewall rules
ufw status
iptables -L -n
iptables -L -n | grep 8080

# Step 4: Test connectivity
telnet localhost 8080
curl -v localhost:8080

# Step 5: Check routing and DNS
ping 8.8.8.8
traceroute target.com
dig target.com
nslookup target.com

# Step 6: Check network interface
ip addr show
ip route show
netstat -an | grep ESTABLISHED | wc -l
```

---

## Quick Troubleshooting Command Reference

| Issue | Command |
|-------|---------|
| Monitor logs live | `tail -f /var/log/app.log` or `journalctl -u service -f` |
| Find process on port | `lsof -i :PORT` or `ss -tulnp \| grep PORT` |
| Monitor processes | `top`, `htop` |
| Check system load | `uptime` |
| Monitor disk in real-time | `watch -n 1 'df -h'` |
| Monitor network | `nethogs`, `iftop`, `netstat -an` |
| Monitor file access | `lsof +D /path` |
| Check service logs | `journalctl -u service --since "1 hour ago"` |
| Find zombie processes | `ps aux \| grep defunct` |
| Check open connections | `ss -an \| grep ESTABLISHED \| wc -l` |
