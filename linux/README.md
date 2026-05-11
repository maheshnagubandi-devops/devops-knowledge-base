# Linux Commands - Interview Preparation Guide

## 📋 Complete Linux Commands Coverage for DevOps/SRE Interviews

This guide provides a comprehensive overview of Linux commands covered in this knowledge base, organized for efficient interview preparation.

## 🎯 Coverage Statistics

### **100% Coverage Across 16 Core Categories**

| Category | Commands | Interview Frequency | Difficulty |
|----------|----------|-------------------|------------|
| **File Operations** | `ls`, `cd`, `pwd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `find`, `locate` | ⭐⭐⭐⭐⭐ | Beginner |
| **Text Processing** | `cat`, `less`, `head`, `tail`, `grep`, `sed`, `awk`, `cut`, `sort`, `uniq`, `diff`, `tr` | ⭐⭐⭐⭐⭐ | Intermediate |
| **Permissions** | `chmod`, `chown`, `chgrp`, `umask`, `ls -l` | ⭐⭐⭐⭐⭐ | Beginner |
| **Process Management** | `ps`, `top`, `htop`, `kill`, `killall`, `pkill`, `nice`, `renice`, `bg`, `fg` | ⭐⭐⭐⭐⭐ | Intermediate |
| **System Monitoring** | `uptime`, `free`, `df`, `du`, `iostat`, `mpstat`, `vmstat`, `sar` | ⭐⭐⭐⭐⭐ | Intermediate |
| **Networking** | `ping`, `traceroute`, `ifconfig`, `ip`, `netstat`, `ss`, `nslookup`, `dig`, `wget`, `curl` | ⭐⭐⭐⭐⭐ | Intermediate |
| **SSH/Security** | `ssh`, `scp`, `rsync`, `ssh-keygen`, `ssh-copy-id`, `ufw`, `iptables` | ⭐⭐⭐⭐⭐ | Advanced |
| **Package Management** | `apt`, `yum`, `dnf`, `rpm`, `dpkg` | ⭐⭐⭐⭐⭐ | Beginner |
| **Services** | `systemctl`, `service`, `journalctl`, `crontab`, `at` | ⭐⭐⭐⭐⭐ | Intermediate |
| **User Management** | `useradd`, `usermod`, `userdel`, `passwd`, `groupadd`, `groupdel` | ⭐⭐⭐⭐⭐ | Beginner |
| **Archiving** | `tar`, `gzip`, `bzip2`, `zip`, `unzip` | ⭐⭐⭐⭐ | Beginner |
| **System Admin** | `shutdown`, `reboot`, `halt`, `init`, `runlevel`, `sysctl`, `ulimit` | ⭐⭐⭐⭐ | Advanced |
| **File System** | `mount`, `umount`, `fsck`, `mkfs`, `fdisk`, `tune2fs`, `resize2fs` | ⭐⭐⭐⭐ | Advanced |
| **Kernel/Modules** | `lsmod`, `modprobe`, `insmod`, `rmmod`, `modinfo` | ⭐⭐⭐ | Advanced |
| **Performance Tuning** | `nice`, `chrt`, `taskset`, `iotop`, `strace`, `tcpdump` | ⭐⭐⭐ | Advanced |
| **Shell Scripting** | Variables, conditionals, loops, functions, redirection, pipes | ⭐⭐⭐⭐ | Intermediate |

**Legend**: ⭐ = Interview frequency (5 stars = asked in every interview)

## 🗂️ Interview Question Categories

### **Beginner Level (Entry-level DevOps/Linux Admin)**
- File permissions and ownership
- Basic navigation and file operations
- Package installation and management
- User creation and management
- Service status checking

### **Intermediate Level (Mid-level DevOps/SRE)**
- Process monitoring and management
- System resource monitoring
- Network troubleshooting
- Log analysis
- Basic scripting

### **Advanced Level (Senior DevOps/SRE)**
- Performance tuning and optimization
- Kernel parameter modification
- Advanced networking and security
- System debugging and forensics
- Automation and orchestration

## 📚 Study Resources by File

### **Core Command Reference**
- **[10-cheatsheet.md](linux/10-cheatsheet.md)**: Complete command reference with examples
- **[01-basics-commands.md](linux/01-basics-commands.md)**: Basic terminal and file operations
- **[02-file-system-commands.md](linux/02-file-system-commands.md)**: File system operations
- **[03-networking-commands.md](linux/03-networking-commands.md)**: Networking and SSH
- **[04-process-management-commands.md](linux/04-process-management-commands.md)**: Process management

### **Advanced Topics**
- **[05-shell-scripting-commands.md](linux/05-shell-scripting-commands.md)**: Shell scripting
- **[06-troubleshooting-commands.md](linux/06-troubleshooting-commands.md)**: System troubleshooting
- **[07-real-time-scenarios.md](linux/07-real-time-scenarios.md)**: Real-world scenarios
- **[11-concepts.md](linux/11-concepts.md)**: Linux concepts for DevOps engineers

### **Interview Preparation**
- **[08-interview-questions.md](linux/08-interview-questions.md)**: 50+ interview questions
- **[09-labs.md](linux/09-labs.md)**: 24 hands-on practice labs

## 🎯 Interview Preparation Strategy

### **Phase 1: Command Mastery (Week 1-2)**
1. **Daily Practice**: Run each command from cheatsheet
2. **Options Memorization**: Learn common flags and options
3. **Practical Usage**: Use commands in real scenarios

### **Phase 2: Scenario-Based Learning (Week 3-4)**
1. **Labs Practice**: Complete all 23 labs in `09-labs.md`
2. **Real Scenarios**: Study `07-real-time-scenarios.md`
3. **Troubleshooting**: Practice with `06-troubleshooting-commands.md`

### **Phase 3: Interview Questions (Week 5-6)**
1. **Question Bank**: Study all questions in `08-interview-questions.md`
2. **Mock Interviews**: Practice explaining commands and scenarios
3. **Deep Dives**: Focus on advanced topics (SSH, performance, security)

## 🔍 Most Frequently Asked Commands

### **Top 20 Interview Commands**
1. `ls -la` - List files with permissions
2. `ps aux` - Process listing
3. `top` / `htop` - Process monitoring
4. `df -h` / `du -sh` - Disk usage
5. `free -h` - Memory usage
6. `netstat -tuln` / `ss -tuln` - Network ports
7. `grep -r "pattern"` - Text search
8. `find /path -name "file"` - File search
9. `chmod 755 file` - Permissions
10. `ssh user@host` - Remote access
11. `scp/rsync` - File transfer
12. `systemctl status service` - Service management
13. `journalctl -u service` - Log viewing
14. `crontab -e` - Scheduling
15. `tar -cvzf` - Archiving
16. `ping/traceroute` - Network testing
17. `ifconfig/ip addr` - Network config
18. `useradd/usermod` - User management
19. `kill -9 PID` - Process termination
20. `uptime` - System load

## 🚀 Quick Reference for Interviews

### **System Investigation Commands**
```bash
# Quick system overview
uptime && free -h && df -h && ps aux | wc -l

# Find resource hogs
ps aux --sort=-%cpu | head -5
ps aux --sort=-%mem | head -5
du -sh /* | sort -hr | head -5
```

### **Network Troubleshooting**
```bash
# Basic connectivity
ping -c 3 host && traceroute host

# Port and service check
ss -tuln | grep LISTEN
netstat -tuln | grep LISTEN

# DNS resolution
dig domain +short
nslookup domain
```

### **Log Analysis**
```bash
# Recent system logs
journalctl --since "1 hour ago" | tail -20

# Service-specific logs
journalctl -u apache2 -f
tail -f /var/log/apache2/error.log

# Search logs
grep "ERROR" /var/log/syslog | tail -10
```

### **Security & Access**
```bash
# SSH key setup
ssh-keygen -t rsa -b 4096
ssh-copy-id user@server

# Firewall status
ufw status
iptables -L -n

# User permissions
id username
groups username
```

## 📈 Skill Level Assessment

### **Beginner (0-6 months experience)**
- ✅ Basic file operations
- ✅ Simple permissions
- ✅ Package management
- ✅ Basic monitoring
- 🔄 Learning: Process management, networking

### **Intermediate (6-18 months experience)**
- ✅ All beginner skills
- ✅ Process management
- ✅ Network troubleshooting
- ✅ Basic scripting
- ✅ Service management
- 🔄 Learning: Performance tuning, security

### **Advanced (18+ months experience)**
- ✅ All intermediate skills
- ✅ Performance optimization
- ✅ Security hardening
- ✅ Kernel tuning
- ✅ Advanced debugging
- ✅ System architecture

## 🎯 Interview Tips

1. **Know Your Options**: Don't just know commands, know their important flags
2. **Explain Scenarios**: Be ready to explain when and why you'd use each command
3. **Practical Examples**: Have real examples from your experience
4. **Troubleshooting Mindset**: Think about what you'd do in failure scenarios
5. **Security Awareness**: Understand security implications of commands
6. **Performance Context**: Know how commands relate to system performance

## 📖 Additional Resources

- **Practice Labs**: Complete all labs in `09-labs.md`
- **Real Scenarios**: Study `07-real-time-scenarios.md`
- **Command Reference**: Use `10-cheatsheet.md` for quick lookup
- **Interview Questions**: Review `08-interview-questions.md`

## ⚠️ What This Guide Does Not Cover

This guide focuses on Linux command-line skills, system administration, troubleshooting, and interview-ready DevOps topics.

### Not covered in detail here:
- Kernel development, compilation, and custom kernel builds
- Deep SELinux/AppArmor policy configuration and advanced MAC rules
- LVM, RAID, and advanced storage layer design
- Bootloader internals (GRUB/LILO) and boot rescue workflows
- Full virtualization/hypervisor management (KVM, Xen, VMware internals)
- Container runtime internals, namespaces, and cgroup architecture beyond CLI tooling
- Cloud provider-specific Linux operations, managed instance platforms, and provider APIs

---

**🎉 This knowledge base provides 100% coverage of Linux commands needed for DevOps/SRE interviews. Focus on practical usage and real-world scenarios rather than memorization.**