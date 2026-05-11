# Networking Commands

## Connectivity Testing
- `ping host`: Test connectivity
- `ping -c 4 host`: Send 4 packets
- `ping -i 2 host`: Interval 2 seconds
- `ping -s 100 host`: Packet size 100 bytes
- `ping -t 5 host`: TTL 5
- `ping -f host`: Flood ping
- `ping --help`: Display help
- `ping --version`: Display version

- `traceroute host`: Trace packet route
- `traceroute -n host`: Numeric output
- `traceroute -m 30 host`: Max hops 30
- `traceroute -p 80 host`: Use port 80
- `traceroute --help`: Display help

- `mtr host`: Network diagnostic (ping + traceroute)
- `mtr --report host`: Report mode
- `mtr --tcp host`: Use TCP
- `mtr --udp host`: Use UDP

## Network Configuration
- `ifconfig`: Display/configure interfaces
- `ifconfig -a`: All interfaces
- `ifconfig eth0`: Specific interface
- `ifconfig eth0 up`: Enable interface
- `ifconfig eth0 down`: Disable interface
- `ifconfig eth0 192.168.1.100`: Set IP address
- `ifconfig eth0 netmask 255.255.255.0`: Set netmask
- `ifconfig eth0 broadcast 192.168.1.255`: Set broadcast
- `ifconfig eth0 mtu 1500`: Set MTU
- `ifconfig eth0:0 192.168.1.101`: Add alias
- `ifconfig --help`: Display help
- `ifconfig --version`: Display version

- `hostname`: Show hostname
- `hostname -i`: Show IP address
- `hostname -d`: Show domain name
- `hostname -f`: Show FQDN
- `hostname newname`: Set hostname
- `hostname --help`: Display help
- `hostname --version`: Display version

- `hostnamectl`: Control hostname (systemd)
- `hostnamectl set-hostname newname`: Set hostname
- `hostnamectl --help`: Display help

## DNS and Name Resolution
- `nslookup domain`: DNS lookup
- `nslookup -type=A domain`: A record
- `nslookup -type=MX domain`: MX record
- `nslookup -type=NS domain`: NS record
- `nslookup -type=CNAME domain`: CNAME record
- `nslookup -type=PTR ip`: Reverse lookup
- `nslookup -debug domain`: Debug mode
- `nslookup -timeout=10 domain`: Set timeout
- `nslookup --help`: Display help

- `dig domain`: DNS query
- `dig @server domain`: Use specific server
- `dig +short domain`: Short output
- `dig +trace domain`: Trace delegation
- `dig -t A domain`: Query A record
- `dig -t MX domain`: Query MX record
- `dig --help`: Display help

- `host domain`: Simple DNS lookup
- `host -t A domain`: A record
- `host -t MX domain`: MX record
- `host -v domain`: Verbose
- `host --help`: Display help

## Network Statistics
- `netstat`: Network connections and stats
- `netstat -a`: All sockets
- `netstat -l`: Listening ports
- `netstat -t`: TCP connections
- `netstat -u`: UDP connections
- `netstat -n`: Numeric addresses
- `netstat -p`: Show PIDs
- `netstat -s`: Statistics
- `netstat -i`: Interface statistics
- `netstat -r`: Routing table
- `netstat -c`: Continuous output
- `netstat -at`: All TCP
- `netstat -au`: All UDP
- `netstat -lt`: Listening TCP
- `netstat -lu`: Listening UDP
- `netstat -nptl`: Numeric, PIDs, TCP, listening
- `netstat --help`: Display help
- `netstat --version`: Display version

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
## File Transfer
- `wget url`: Download file
- `wget -c url`: Resume download
- `wget -O filename url`: Save as filename
- `wget -P /path url`: Save to directory
- `wget -q url`: Quiet mode
- `wget -v url`: Verbose mode
- `wget -b url`: Background download
- `wget --limit-rate=100k url`: Limit bandwidth
- `wget -i file.txt`: Download from URLs in file
- `wget --mirror url`: Mirror website
- `wget --help`: Display help
- `wget --version`: Display version

- `curl url`: Transfer data
- `curl -O url`: Save as original filename
- `curl -o filename url`: Save as filename
- `curl -I url`: Get headers only
- `curl -L url`: Follow redirects
- `curl -X POST url`: POST request
- `curl -d "data" url`: Send data
- `curl -u user:pass url`: Basic auth
- `curl -H "Header: value" url`: Custom header
- `curl --help`: Display help
- `curl --version`: Display version
- `curl -O url`: Download

## Port Numbers
### Well-Known Ports (0-1023)
- `20/21`: FTP (File Transfer Protocol)
- `22`: SSH (Secure Shell)
- `23`: Telnet
- `25`: SMTP (Simple Mail Transfer Protocol)
- `53`: DNS (Domain Name System)
- `80`: HTTP (Hypertext Transfer Protocol)
- `110`: POP3 (Post Office Protocol)
- `143`: IMAP (Internet Message Access Protocol)
- `443`: HTTPS (HTTP Secure)
- `993`: IMAPS (IMAP Secure)
- `995`: POP3S (POP3 Secure)

### Registered Ports (1024-49151)
- `1433`: Microsoft SQL Server
- `1521`: Oracle Database
- `3306`: MySQL
- `5432`: PostgreSQL
- `6379`: Redis
- `8080`: HTTP Alternative
- `8443`: HTTPS Alternative

### Dynamic/Private Ports (49152-65535)
- Used for ephemeral connections

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
