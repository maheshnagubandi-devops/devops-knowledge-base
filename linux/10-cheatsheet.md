# Linux Commands Cheatsheet

## File Operations
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `ls` | List files | `-a` (all), `-l` (long), `-h` (human), `-S` (size), `-t` (time) | `ls -lah` |
| `cd` | Change directory | `~` (home), `..` (up), `-` (previous) | `cd /var/log` |
| `pwd` | Print working directory | `-P` (physical), `-L` (logical) | `pwd -P` |
| `mkdir` | Create directory | `-p` (parents), `-v` (verbose), `-m` (mode) | `mkdir -pv dir/sub` |
| `touch` | Create/update file | `-a` (access), `-m` (modify), `-c` (no create) | `touch -a file.txt` |
| `cp` | Copy files | `-r` (recursive), `-i` (interactive), `-v` (verbose), `-p` (preserve) | `cp -rpv src dest` |
| `mv` | Move/rename | `-i` (interactive), `-v` (verbose), `-b` (backup) | `mv -iv old new` |
| `rm` | Remove files | `-f` (force), `-i` (interactive), `-r` (recursive) | `rm -rf dir/` |
| `find` | Find files | `-name`, `-type`, `-size`, `-mtime`, `-exec` | `find . -name "*.log"` |
| `locate` | Quick file search | `-i` (ignore case) | `locate -i config` |

## File Viewing & Editing
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `cat` | Display file | `-n` (numbers), `-A` (all chars), `-s` (squeeze) | `cat -n file.txt` |
| `less` | View with paging | `-N` (line numbers), `-S` (chop lines) | `less -N file.txt` |
| `more` | Simple pager | `-l` (no pause), `-f` (logical lines) | `more +10 file.txt` |
| `head` | First lines | `-n` (count), `-c` (bytes) | `head -n 20 file.txt` |
| `tail` | Last lines | `-n` (count), `-f` (follow) | `tail -f /var/log/syslog` |
| `vi/vim` | Text editor | `-R` (readonly), `-r` (recover), `+num` (line) | `vim +10 file.txt` |
| `nano` | Simple editor | `-w` (no wrap), `-T` (tab size) | `nano -w file.txt` |

### Vi/Vim Quick Reference
| Mode | Command | Action | Mode | Command | Action |
|------|---------|--------|------|---------|--------|
| Cmd | `i` | Insert mode | Cmd | `a` | Append mode |
| Cmd | `o/O` | New line below/above | Cmd | `Esc` | Command mode |
| Cmd | `h/j/k/l` | Navigate | Cmd | `w/b` | Word forward/back |
| Cmd | `0/$` | Line start/end | Cmd | `gg/G` | File start/end |
| Cmd | `x/dd` | Delete char/line | Cmd | `yy/p` | Copy/paste |
| Cmd | `u/Ctrl+r` | Undo/redo | Cmd | `cw/cc` | Change word/line |
| Cmd | `/pattern` | Search forward | Cmd | `?pattern` | Search backward |
| Cmd | `n/N` | Next/prev match | Cmd | `:s/old/new/g` | Replace in line |
| Cmd | `:%s/old/new/g` | Replace all | Cmd | `:w/:q/:wq` | Save/quit |
| Cmd | `:q!` | Force quit | Cmd | `:set number` | Show line numbers |
| Cmd | `:split` | Horizontal split | Cmd | `:vsplit` | Vertical split |
| Cmd | `Ctrl+w` + dir | Switch windows | Cmd | `gt/gT` | Next/prev tab |

## Text Processing
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `grep` | Search text | `-i` (ignore case), `-v` (invert), `-n` (line numbers) | `grep -in "error" file.log` |
| `sed` | Stream editor | `s/old/new/g` (replace), `-i` (in-place) | `sed 's/old/new/g' file.txt` |
| `awk` | Text processing | `'{print $1}'` (column), `-F` (delimiter) | `awk -F',' '{print $1}' file.csv` |
| `cut` | Extract columns | `-d` (delimiter), `-f` (fields), `-c` (characters) | `cut -d',' -f1,3 file.csv` |
| `sort` | Sort lines | `-n` (numeric), `-r` (reverse), `-k` (key) | `sort -nrk2 file.txt` |
| `uniq` | Remove duplicates | `-c` (count), `-d` (duplicates only) | `sort file.txt \| uniq -c` |
| `diff` | Compare files | `-u` (unified), `-r` (recursive) | `diff -u file1.txt file2.txt` |
| `tr` | Translate chars | `-d` (delete), `-s` (squeeze) | `tr -d '\n' < file.txt` |

## Permissions & Ownership
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `chmod` | Change permissions | `755` (octal), `u+x` (symbolic), `-R` (recursive) | `chmod -R 755 dir/` |
| `chown` | Change owner | `user:group`, `-R` (recursive) | `chown -R user:group file` |
| `chgrp` | Change group | `-R` (recursive) | `chgrp developers file` |
| `umask` | Set default permissions | `022` (default) | `umask 002` |
| `ls -l` | View permissions | Shows rwx for user/group/other | `ls -ld dir/` |

## Process Management
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `ps` | Process list | `aux` (all), `-ef` (full), `-u user` | `ps aux \| grep process` |
| `top` | Process monitor | `-d` (delay), `-p` (PID), `-u` (user) | `top -d 2` |
| `htop` | Enhanced top | Interactive process viewer | `htop` |
| `kill` | Kill process | `-9` (SIGKILL), `-15` (SIGTERM) | `kill -9 1234` |
| `killall` | Kill by name | `-9` (force), `-u user` | `killall -9 firefox` |
| `pkill` | Pattern kill | `-9` (force), `-u user` | `pkill -9 chrome` |
| `nice` | Set priority | `-n` (value) | `nice -n 10 command` |
| `renice` | Change priority | `-n` (value), `-p` (PID) | `renice -n 5 -p 1234` |

## System Monitoring
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `uptime` | System uptime | Shows load average | `uptime` |
| `free` | Memory usage | `-h` (human), `-s` (seconds) | `free -h` |
| `df` | Disk free | `-h` (human), `-i` (inodes) | `df -h` |
| `du` | Disk usage | `-sh` (summary), `-h` (human) | `du -sh /*` |
| `iostat` | I/O stats | `-x` (extended), `-m` (MB/s) | `iostat -xm 1` |
| `mpstat` | CPU stats | `-P ALL` (all CPUs) | `mpstat -P ALL` |
| `vmstat` | Virtual memory | `1` (interval) | `vmstat 1` |
| `sar` | System activity | `-u` (CPU), `-r` (memory) | `sar -u 1 5` |

## Networking
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `ping` | Test connectivity | `-c` (count), `-i` (interval) | `ping -c 4 google.com` |
| `traceroute` | Trace route | `-n` (numeric), `-m` (max hops) | `traceroute -n google.com` |
| `ifconfig` | Interface config | `eth0` (interface), `up/down` | `ifconfig eth0 192.168.1.100` |
| `ip` | IP commands | `addr` (addresses), `route` (routing) | `ip addr show` |
| `netstat` | Network stats | `-tuln` (listening), `-s` (stats) | `netstat -tuln` |
| `ss` | Socket stats | `-tuln` (listening), `-p` (processes) | `ss -tuln` |
| `nslookup` | DNS lookup | `domain` | `nslookup google.com` |
| `dig` | DNS query | `@server` (nameserver) | `dig google.com` |
| `wget` | Download file | `-c` (resume), `-O` (output) | `wget -c http://example.com/file` |
| `curl` | Transfer data | `-O` (save), `-I` (headers) | `curl -O http://example.com/file` |

### SSH Commands
| Command | Description | Example |
|---------|-------------|---------|
| `ssh user@host` | Connect to remote | `ssh admin@server.com` |
| `ssh -i key user@host` | Use specific key | `ssh -i ~/.ssh/prod admin@server` |
| `ssh -p port user@host` | Custom port | `ssh -p 2222 user@host` |
| `ssh-keygen -t rsa` | Generate key pair | `ssh-keygen -t rsa -b 4096` |
| `ssh-copy-id user@host` | Copy public key | `ssh-copy-id admin@server` |
| `ssh-agent bash` | Start SSH agent | `ssh-agent bash` |
| `ssh-add ~/.ssh/id_rsa` | Add key to agent | `ssh-add ~/.ssh/prod` |
| `scp file user@host:/path` | Secure copy | `scp config.txt admin@server:/etc/` |
| `rsync -av src dest` | Sync files | `rsync -av /local/ admin@server:/remote/` |

### Passwordless SSH Setup
```bash
# 1. Generate key pair
ssh-keygen -t rsa -b 4096

# 2. Copy public key to remote server
ssh-copy-id user@remote-server

# 3. Or manually copy
cat ~/.ssh/id_rsa.pub | ssh user@server "cat >> ~/.ssh/authorized_keys"

# 4. Set permissions on remote server
ssh user@server "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"

# 5. Test connection
ssh user@server  # Should connect without password
```

## Archiving & Compression
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `tar` | Archive files | `-cvf` (create), `-xvf` (extract), `-tvf` (list) | `tar -cvzf archive.tar.gz files/` |
| `gzip` | Compress | `-9` (best), `-d` (decompress) | `gzip -9 file.txt` |
| `gunzip` | Decompress gzip | Same as gzip -d | `gunzip file.gz` |
| `bzip2` | Compress bzip2 | `-9` (best), `-d` (decompress) | `bzip2 -9 file.txt` |
| `zip` | Create zip | `-r` (recursive) | `zip -r archive.zip files/` |
| `unzip` | Extract zip | `-l` (list) | `unzip archive.zip` |

## Package Management (APT)
| Command | Description | Example |
|---------|-------------|---------|
| `apt update` | Update package list | `apt update` |
| `apt upgrade` | Upgrade packages | `apt upgrade` |
| `apt install` | Install package | `apt install package` |
| `apt remove` | Remove package | `apt remove package` |
| `apt purge` | Remove with config | `apt purge package` |
| `apt search` | Search packages | `apt search keyword` |
| `apt show` | Package info | `apt show package` |
| `apt autoremove` | Remove unused | `apt autoremove` |

## Package Management (YUM/DNF)
| Command | Description | Example |
|---------|-------------|---------|
| `yum update` | Update packages | `yum update` |
| `yum install` | Install package | `yum install package` |
| `yum remove` | Remove package | `yum remove package` |
| `yum search` | Search packages | `yum search keyword` |
| `yum info` | Package info | `yum info package` |
| `dnf update` | Update packages | `dnf update` |
| `dnf install` | Install package | `dnf install package` |

## Services & System Control
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `systemctl` | Service manager | `start`, `stop`, `restart`, `status` | `systemctl restart apache2` |
| `service` | Legacy service | `start`, `stop`, `restart` | `service apache2 restart` |
| `journalctl` | System logs | `-u` (unit), `-f` (follow) | `journalctl -u apache2 -f` |
| `crontab` | Schedule tasks | `-e` (edit), `-l` (list) | `crontab -e` |
| `at` | Schedule one-time | `HH:MM` | `echo "cmd" \| at 14:00` |

## User Management
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `whoami` | Current user | | `whoami` |
| `who` | Logged in users | `-a` (all) | `who -a` |
| `id` | User info | `-u` (UID), `-g` (GID) | `id username` |
| `useradd` | Add user | `-m` (home), `-s` (shell) | `useradd -m username` |
| `usermod` | Modify user | `-aG` (add group), `-s` (shell) | `usermod -aG group username` |
| `userdel` | Delete user | `-r` (remove home) | `userdel -r username` |
| `passwd` | Change password | `username` | `passwd username` |
| `groupadd` | Add group | | `groupadd groupname` |
| `groupdel` | Delete group | | `groupdel groupname` |

## Background Jobs
| Command | Description | Common Options | Example |
|---------|-------------|----------------|---------|
| `jobs` | List jobs | `-l` (PIDs) | `jobs -l` |
| `bg` | Background job | `%job` (specific job) | `bg %1` |
| `fg` | Foreground job | `%job` (specific job) | `fg %1` |
| `nohup` | Immune to hangup | | `nohup command &` |
| `disown` | Remove from jobs | `-h` (no SIGHUP) | `disown %1` |

## Shell Scripting
| Command | Description | Example |
|---------|-------------|---------|
| `#!/bin/bash` | Shebang | Script header |
| `$var` | Variable | `echo $HOME` |
| `${var}` | Safe variable | `echo ${HOME}` |
| `if [ ]` | Condition | `if [ -f file ]; then` |
| `for var in` | Loop | `for i in {1..5}; do` |
| `while [ ]` | While loop | `while [ condition ]; do` |
| `case $var in` | Case statement | `case $opt in -a)` |
| `function` | Function | `function name() { }` |
| `$(cmd)` | Command sub | `files=$(ls)` |
| `>` | Redirect stdout | `cmd > file` |
| `>>` | Append stdout | `cmd >> file` |
| `2>` | Redirect stderr | `cmd 2> error.log` |
| `&>` | Redirect both | `cmd &> output.log` |
| `\|` | Pipe | `cmd1 \| cmd2` |

## Common Port Numbers
| Port | Service | Protocol |
|------|---------|----------|
| 20/21 | FTP | TCP |
| 22 | SSH | TCP |
| 23 | Telnet | TCP |
| 25 | SMTP | TCP |
| 53 | DNS | UDP/TCP |
| 80 | HTTP | TCP |
| 110 | POP3 | TCP |
| 143 | IMAP | TCP |
| 443 | HTTPS | TCP |
| 993 | IMAPS | TCP |
| 995 | POP3S | TCP |
| 3306 | MySQL | TCP |
| 5432 | PostgreSQL | TCP |
| 6379 | Redis | TCP |
| `id` | User info | `id` |
| `uptime` | System uptime | `uptime` |
| `free` | Memory info | `free -h` |
| `df` | Disk usage | `df -h` |
| `du` | Directory usage | `du -sh dir/` |

## Networking
| Command | Description | Example |
|---------|-------------|---------|
| `ping` | Test connectivity | `ping host` |
| `ifconfig` | Network config | `ifconfig` |
| `ip` | IP commands | `ip addr show` |
| `netstat` | Network stats | `netstat -tuln` |
| `ss` | Socket stats | `ss -tuln` |
| `ssh` | Secure shell | `ssh user@host` |
| `scp` | Secure copy | `scp file user@host:` |
| `wget` | Download | `wget url` |
| `curl` | Transfer data | `curl url` |

## Package Management (Ubuntu/Debian)
| Command | Description | Example |
|---------|-------------|---------|
| `apt update` | Update package list | `apt update` |
| `apt upgrade` | Upgrade packages | `apt upgrade` |
| `apt install` | Install package | `apt install package` |
| `apt remove` | Remove package | `apt remove package` |
| `apt search` | Search packages | `apt search keyword` |
| `apt list` | List packages | `apt list --installed` |

## Archive and Compression
| Command | Description | Example |
|---------|-------------|---------|
| `tar` | Archive | `tar -cvf archive.tar files` |
| `tar` | Extract | `tar -xvf archive.tar` |
| `gzip` | Compress | `gzip file` |
| `gunzip` | Decompress | `gunzip file.gz` |
| `zip` | Compress | `zip archive.zip files` |
| `unzip` | Extract | `unzip archive.zip` |

## Text Processing
| Command | Description | Example |
|---------|-------------|---------|
| `grep` | Search text | `grep "pattern" file` |
| `sed` | Stream editor | `sed 's/old/new/g' file` |
| `awk` | Text processing | `awk '{print $1}' file` |
| `cut` | Cut fields | `cut -d',' -f1 file` |
| `sort` | Sort lines | `sort file` |
| `uniq` | Unique lines | `uniq file` |
| `wc` | Word count | `wc -l file` |

## User Management
| Command | Description | Example |
|---------|-------------|---------|
| `useradd` | Add user | `useradd username` |
| `userdel` | Delete user | `userdel username` |
| `usermod` | Modify user | `usermod -aG group user` |
| `passwd` | Change password | `passwd username` |
| `groupadd` | Add group | `groupadd groupname` |
| `groupdel` | Delete group | `groupdel groupname` |

## System Services
| Command | Description | Example |
|---------|-------------|---------|
| `systemctl` | Control services | `systemctl start service` |
| `systemctl` | Service status | `systemctl status service` |
| `systemctl` | Enable service | `systemctl enable service` |
| `journalctl` | View logs | `journalctl -u service` |

## File System
| Command | Description | Example |
|---------|-------------|---------|
| `mount` | Mount filesystem | `mount /dev/sda1 /mnt` |
| `umount` | Unmount | `umount /mnt` |
| `fsck` | Check filesystem | `fsck /dev/sda1` |
| `mkfs` | Create filesystem | `mkfs.ext4 /dev/sda1` |
| `fdisk` | Partition disk | `fdisk /dev/sda` |

## Shell Scripting
| Syntax | Description | Example |
|--------|-------------|---------|
| `#!/bin/bash` | Shebang | `#!/bin/bash` |
| `var=value` | Variable | `name="John"` |
| `$var` | Access variable | `echo $name` |
| `if [ ]` | Condition | `if [ $x -gt 5 ]` |
| `for` | Loop | `for i in {1..10}` |
| `function` | Function | `function greet() { ... }` |

## Common Shortcuts
- `Ctrl+C`: Interrupt command
- `Ctrl+Z`: Suspend job
- `Ctrl+D`: End of input/EOF
- `Ctrl+L`: Clear screen
- `Ctrl+A`: Beginning of line
- `Ctrl+E`: End of line
- `Ctrl+R`: Reverse search
- `!!`: Repeat last command
- `!$`: Last argument
- `!n`: nth command in history

## Common Patterns
- `command > file`: Redirect stdout
- `command >> file`: Append stdout
- `command 2> file`: Redirect stderr
- `command &> file`: Redirect both
- `command1 | command2`: Pipe
- `command &`: Background
- `command || command2`: OR
- `command && command2`: AND
- `(command)`: Subshell
- `$(command)`: Command substitution

## Useful One-liners
- Find large files: `find / -type f -size +100M -exec ls -lh {} \;`
- Count files: `find . -type f | wc -l`
- Process memory: `ps aux --sort=-%mem | head`
- Disk usage by dir: `du -sh * | sort -hr`
- Kill all processes: `pkill -f process_name`
- Check open ports: `netstat -tuln | grep LISTEN`
- System load: `uptime; cat /proc/loadavg`
- Free memory: `free -h; cat /proc/meminfo | grep Mem`
- CPU info: `lscpu; cat /proc/cpuinfo | grep "model name"`
