# Linux Labs

## Lab 1: Basic Navigation and File Operations
1. Create directory structure: `mkdir -p projects/scripts data/logs`
2. Create files: `touch projects/main.py data/input.txt`
3. Copy files: `cp data/input.txt data/input_backup.txt`
4. Move files: `mv projects/main.py projects/app.py`
5. List contents: `ls -la projects/ data/`
6. View file: `cat data/input.txt`

## Lab 2: User and Permission Management
1. Create user: `sudo useradd testuser`
2. Set password: `sudo passwd testuser`
3. Create group: `sudo groupadd developers`
4. Add user to group: `sudo usermod -aG developers testuser`
5. Create file: `sudo -u testuser touch /home/testuser/file.txt`
6. Change permissions: `chmod 644 /home/testuser/file.txt`
7. Change ownership: `chown testuser:developers /home/testuser/file.txt`

## Lab 3: Process Management
1. Run background process: `sleep 300 &`
2. List processes: `ps aux | grep sleep`
3. View in top: `top` (press q to quit)
4. Kill process: `kill PID`
5. Force kill: `kill -9 PID`
6. Run with nice: `nice -n 10 sleep 60 &`

## Lab 4: Networking Basics
1. Check interfaces: `ip addr show`
2. Test connectivity: `ping -c 4 8.8.8.8`
3. Check routes: `ip route show`
4. DNS lookup: `nslookup google.com`
5. Check listening ports: `ss -tuln`
6. SSH to localhost: `ssh localhost` (if SSH server running)

## Lab 5: Package Management
1. Update package list: `sudo apt update`
2. Search package: `apt search htop`
3. Install package: `sudo apt install htop`
4. List installed: `apt list --installed | grep htop`
5. Remove package: `sudo apt remove htop`
6. Clean cache: `sudo apt autoclean`

## Lab 6: File System Operations
1. Check disk usage: `df -h`
2. Check directory size: `du -sh /var/log`
3. Find large files: `find /var -type f -size +100M`
4. Create filesystem: `dd if=/dev/zero of=disk.img bs=1M count=100`
5. Format: `mkfs.ext4 disk.img`
6. Mount: `sudo mount disk.img /mnt`
7. Unmount: `sudo umount /mnt`

## Lab 7: Shell Scripting Basics
1. Create script: `nano hello.sh`
   ```
   #!/bin/bash
   echo "Hello, $1!"
   ```
2. Make executable: `chmod +x hello.sh`
3. Run script: `./hello.sh World`
4. Add loop:
   ```
   for i in {1..5}; do
       echo "Count: $i"
   done
   ```
5. Add condition:
   ```
   if [ $# -eq 0 ]; then
       echo "No arguments"
   else
       echo "Arguments: $@"
   fi
   ```

## Lab 8: System Monitoring
1. Check uptime: `uptime`
2. Memory usage: `free -h`
3. CPU info: `lscpu`
4. System logs: `journalctl --since "1 hour ago"`
5. Disk I/O: `iostat -x 1 5`
6. Network stats: `sar -n DEV 1 5`

## Lab 9: Backup and Archive
1. Create test files: `mkdir test && cd test && echo "data" > file1.txt && echo "more data" > file2.txt`
2. Archive: `tar -cvf backup.tar file1.txt file2.txt`
3. Compress: `gzip backup.tar`
4. List contents: `tar -tzf backup.tar.gz`
5. Extract: `tar -xzf backup.tar.gz`
6. Rsync: `rsync -av test/ backup/`

## Lab 10: Troubleshooting Common Issues
1. Simulate disk full: Create large file `dd if=/dev/zero of=bigfile bs=1M count=50`
2. Check usage: `df -h`
3. Find large files: `du -sh * | sort -hr`
4. Clean up: `rm bigfile`

2. Simulate high CPU: `while true; do :; done &`
3. Check processes: `top`
4. Kill process: `kill %1`

3. Network issue: Disconnect network, then `ping 8.8.8.8`
4. Check interface: `ip link show`
5. Bring up: `sudo ip link set eth0 up`

## Lab 11: Cron Jobs
1. Edit crontab: `crontab -e`
2. Add job: `*/5 * * * * echo "Hello" >> /tmp/cron.log`
3. List jobs: `crontab -l`
4. Check execution: `tail -f /tmp/cron.log`
5. Remove job: `crontab -e` (delete line)

## Lab 12: Firewall Configuration
1. Check status: `sudo ufw status`
2. Allow SSH: `sudo ufw allow ssh`
3. Allow port: `sudo ufw allow 80`
4. Enable firewall: `sudo ufw enable`
5. Check rules: `sudo ufw status numbered`
6. Delete rule: `sudo ufw delete 2`

## Lab 13: Log Analysis
1. View system logs: `journalctl -f`
2. Search logs: `journalctl | grep "error"`
3. Service logs: `journalctl -u ssh`
4. Time range: `journalctl --since "2023-01-01" --until "2023-01-02"`
5. Export logs: `journalctl > system.log`

## Lab 14: Kernel and Modules
1. Check kernel: `uname -a`
2. List modules: `lsmod`
3. Module info: `modinfo module_name`
4. Load module: `sudo modprobe module_name`
5. Unload module: `sudo modprobe -r module_name`
6. Check parameters: `sysctl -a | grep kernel`

## Lab 15: Advanced File Operations
1. Create hard link: `ln file1.txt hardlink`
2. Create soft link: `ln -s file1.txt softlink`
3. Compare: `ls -li file1.txt hardlink softlink`
4. Find by type: `find . -type l` (links)
5. Find by permission: `find . -perm 755`
## Lab 16: SSH and Passwordless Authentication
1. Generate SSH key pair: `ssh-keygen -t rsa -b 4096 -C "yourname@example.com"`
2. View public key: `cat ~/.ssh/id_rsa.pub`
3. Create test user on same machine: `sudo useradd testuser && sudo passwd testuser`
4. Switch to testuser: `su - testuser`
5. Create .ssh directory: `mkdir ~/.ssh && chmod 700 ~/.ssh`
6. Copy public key to authorized_keys: `echo "paste_public_key_here" >> ~/.ssh/authorized_keys`
7. Set permissions: `chmod 600 ~/.ssh/authorized_keys`
8. Test passwordless login: `ssh testuser@localhost` (should not ask for password)
9. Exit and return to original user

## Lab 17: SSH Tunneling and Port Forwarding
1. Start a simple HTTP server on port 8000: `python3 -m http.server 8000 &`
2. Create SSH tunnel from local port 8080 to remote port 8000: `ssh -L 8080:localhost:8000 localhost`
3. In another terminal, test the tunnel: `curl http://localhost:8080`
4. Kill the tunnel and server processes
5. Try remote port forwarding (if you have another machine): `ssh -R 8080:localhost:8000 remote-server`

## Lab 18: SSH Configuration and Security
1. Create SSH config file: `nano ~/.ssh/config`
   ```
   Host dev
       HostName dev-server.example.com
       User devuser
       Port 2222
       IdentityFile ~/.ssh/dev_key
   
   Host prod
       HostName prod-server.example.com
       User produser
       StrictHostKeyChecking no
   ```
2. Test config: `ssh dev` (should use config settings)
3. Check SSH server config: `sudo nano /etc/ssh/sshd_config`
4. View current SSH settings: `sudo sshd -T | grep -E "(passwordauth|pubkeyauth|port)"`
5. Create backup of config: `sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup`

## Lab 19: System Administration
1. Check current runlevel: `runlevel`
2. View system uptime: `uptime`
3. Check system logs: `journalctl --since "1 hour ago" | tail`
4. Schedule a command: `echo "echo 'Hello from cron'" | at now + 1 minute`
5. Check scheduled jobs: `atq`

## Lab 20: Kernel Modules and Parameters
1. List loaded modules: `lsmod | head -10`
2. Get module info: `modinfo ext4` (or any loaded module)
3. Check kernel parameters: `sysctl -a | grep vm | head`
4. Modify parameter temporarily: `sudo sysctl -w vm.swappiness=10`
5. Check current value: `sysctl vm.swappiness`

## Lab 21: Advanced Monitoring
1. Install monitoring tools: `sudo apt install iotop ncdu`
2. Monitor I/O: `sudo iotop -o -b -n 3` (3 iterations)
3. Analyze disk usage: `ncdu /tmp` (navigate with arrows, q to quit)
4. Trace system calls: `strace -c -p 1` (trace init process briefly)
5. Check open files: `lsof -u $USER | head`

## Lab 22: Backup and Recovery
1. Create test directory: `mkdir backup-lab && cd backup-lab`
2. Create test files: `echo "file1" > file1.txt && echo "file2" > file2.txt`
3. Rsync to backup: `rsync -av . ../backup-dest/`
4. Modify original: `echo "modified" >> file1.txt`
5. Rsync incremental: `rsync -av --delete . ../backup-dest/`
6. Verify backup: `diff -r . ../backup-dest/`

## Lab 23: Performance Tuning
1. Check current limits: `ulimit -a`
2. Set file limit: `ulimit -n 1024`
3. Run with low priority: `nice -n 19 sleep 10 &`
4. Check process priority: `ps -o pid,ni,cmd -p $!`
5. Test CPU affinity: `taskset -c 0 sleep 5 &`
6. Monitor with top: `top -b -n 1 | head -20`
