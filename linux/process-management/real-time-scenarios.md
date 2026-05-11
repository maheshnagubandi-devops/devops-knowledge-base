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
