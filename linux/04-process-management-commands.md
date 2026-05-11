# Process Management Commands

## Process Listing
- `ps`: Current processes
- `ps aux`: All processes, detailed
- `ps -ef`: Full format
- `ps -u user`: User's processes
- `top`: Interactive process viewer
- `htop`: Enhanced top (install if needed)
- `pgrep pattern`: Find PIDs by pattern
- `pkill pattern`: Kill by pattern

## Process Control
- `kill PID`: Terminate process
- `kill -9 PID`: Force kill
- `kill -TERM PID`: Graceful termination
- `kill -STOP PID`: Suspend
- `kill -CONT PID`: Continue
- `killall process`: Kill by name
- `pkill process`: Kill by name/pattern

## Background Jobs
- `jobs`: List jobs
- `bg %job`: Background job
- `fg %job`: Foreground job
- `nohup command &`: Run in background, immune to hangup
- `disown`: Remove from job list

## System Monitoring
- `uptime`: System uptime
- `free`: Memory usage
- `free -h`: Human readable
- `vmstat`: Virtual memory stats
- `iostat`: I/O stats
- `mpstat`: CPU stats
- `sar`: System activity report

## Resource Limits
- `ulimit`: Show limits
- `ulimit -a`: All limits
- `ulimit -n 1024`: Set file descriptors

## Scheduling
- `at time command`: Schedule one-time
- `cron`: Recurring tasks
- `crontab -e`: Edit cron jobs
- `crontab -l`: List cron jobs

## Daemons and Services
- Daemon: Background process
- `systemctl`: Control systemd services
- `systemctl start/stop service`
- `systemctl enable/disable service`
- `systemctl status service`
- `service service start/stop` (older)

## Process Priorities
- `nice -n priority command`: Set priority
- `renice priority PID`: Change priority

## LSOF
- `lsof`: List open files
- `lsof -u user`: By user
- `lsof -p PID`: By process
- `lsof -i`: Network connections
- `lsof -D dir`: Files in directory