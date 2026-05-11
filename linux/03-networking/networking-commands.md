# Networking Commands

## Connectivity Testing
- `ping host`: Test connectivity
- `traceroute host`: Trace packet route
- `mtr host`: Network diagnostic (ping + traceroute)

## Network Configuration
- `ifconfig`: Display/configure interfaces
- `ifconfig eth0`: Specific interface
- `ifconfig eth0 up/down`: Enable/disable
- `ifconfig eth0 192.168.1.100`: Set IP
- `ifconfig eth0 netmask 255.255.255.0`: Set netmask
- `ip addr`: Show IP addresses (modern)
- `ip route`: Show routing table
- `hostname`: Show hostname
- `hostname -i`: Show IP
- `hostnamectl`: Control hostname

## DNS and Name Resolution
- `nslookup domain`: DNS lookup
- `dig domain`: DNS query
- `host domain`: Simple DNS lookup

## Network Statistics
- `netstat`: Network connections and stats
- `netstat -l`: Listening ports
- `netstat -at`: All TCP
- `netstat -au`: All UDP
- `netstat -lt`: Listening TCP
- `netstat -lu`: Listening UDP
- `netstat -nptl`: With PIDs
- `netstat -s`: Statistics
- `netstat -i`: Interface stats
- `netstat -r`: Routing table

## File Transfer
- `scp source user@host:dest`: Secure copy
- `scp -r`: Recursive
- `scp -P port`: Custom port
- `scp -i key`: Use key
- `rsync source dest`: Sync files
- `rsync -a`: Archive mode
- `rsync -v`: Verbose
- `rsync -z`: Compress
- `rsync --delete`: Sync deletions
- `wget url`: Download file
- `wget -c`: Resume download
- `wget -O filename url`: Save as
- `curl url`: Transfer data
- `curl -O url`: Download

## SSH
- `ssh user@host`: Connect
- `ssh -i key user@host`: Use key
- `ssh -p port user@host`: Custom port
- `ssh-keygen -t rsa`: Generate key
- `ssh-copy-id user@host`: Copy public key

## Firewall
- `ufw status`: UFW status
- `ufw enable/disable`: Enable/disable
- `ufw allow port`: Allow port
- `ufw deny port`: Deny port

## Port Scanning
- `nmap host`: Scan ports
- `nmap -p port host`: Specific port
- `nmap -sV host`: Service version

## Network Monitoring
- `tcpdump`: Packet analyzer
- `tcpdump -i eth0`: Specific interface
- `wireshark`: GUI packet analyzer

## Services
- `systemctl start/stop service`: Control services
- `systemctl enable/disable service`: Auto-start
- `systemctl status service`: Status
- `service service start/stop`: Alternative

## Passwordless SSH
1. `ssh-keygen -t rsa` on server1
2. Copy `id_rsa.pub` to server2 `authorized_keys`
3. `chmod 700 ~/.ssh` and `chmod 600 authorized_keys`
4. Test: `ssh user@server2`
