# Linux Commands Cheatsheet

## File Operations
| Command | Description | Example |
|---------|-------------|---------|
| `ls` | List files | `ls -la` |
| `cd` | Change directory | `cd /home` |
| `pwd` | Print working directory | `pwd` |
| `mkdir` | Create directory | `mkdir -p dir/subdir` |
| `rmdir` | Remove directory | `rmdir dir` |
| `touch` | Create empty file | `touch file.txt` |
| `cp` | Copy files | `cp source dest` |
| `mv` | Move/rename | `mv old new` |
| `rm` | Remove files | `rm -rf dir/` |

## File Viewing
| Command | Description | Example |
|---------|-------------|---------|
| `cat` | Display file | `cat file.txt` |
| `less` | View with paging | `less file.txt` |
| `head` | First lines | `head -n 10 file.txt` |
| `tail` | Last lines | `tail -n 10 file.txt` |
| `grep` | Search text | `grep "pattern" file.txt` |
| `find` | Find files | `find . -name "*.txt"` |

## Permissions
| Command | Description | Example |
|---------|-------------|---------|
| `chmod` | Change permissions | `chmod 755 file` |
| `chown` | Change owner | `chown user:group file` |
| `chgrp` | Change group | `chgrp group file` |
| `umask` | Set default permissions | `umask 022` |

## Process Management
| Command | Description | Example |
|---------|-------------|---------|
| `ps` | Process list | `ps aux` |
| `top` | Process monitor | `top` |
| `kill` | Kill process | `kill -9 PID` |
| `killall` | Kill by name | `killall process` |
| `bg` | Background job | `bg %1` |
| `fg` | Foreground job | `fg %1` |
| `jobs` | List jobs | `jobs` |

## System Info
| Command | Description | Example |
|---------|-------------|---------|
| `uname` | System info | `uname -a` |
| `hostname` | Hostname | `hostname` |
| `whoami` | Current user | `whoami` |
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
