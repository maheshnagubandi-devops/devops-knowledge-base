# Process Management Commands

## Process Listing
- `ps`: Current processes
- `ps -e`: All processes
- `ps -f`: Full format
- `ps -l`: Long format
- `ps -u user`: User's processes
- `ps -p PID`: Specific PID
- `ps -C command`: By command name
- `ps -t tty`: By terminal
- `ps aux`: All processes, BSD format
- `ps -ef`: All processes, System V format
- `ps -eo pid,ppid,cmd`: Custom output
- `ps --help`: Display help
- `ps --version`: Display version

- `top`: Interactive process viewer
- `top -d 5`: Update every 5 seconds
- `top -p PID`: Monitor specific PID
- `top -u user`: Show user's processes
- `top -n 10`: Run 10 iterations then quit
- `top -b`: Batch mode
- `top --help`: Display help

- `htop`: Enhanced top (install if needed)
- `htop --help`: Display help

- `pgrep pattern`: Find PIDs by pattern
- `pgrep -u user pattern`: By user
- `pgrep -f pattern`: Match full command line
- `pgrep -l pattern`: Show process names
- `pgrep --help`: Display help

- `pkill pattern`: Kill by pattern
- `pkill -u user pattern`: Kill user's processes
- `pkill -9 pattern`: Force kill
- `pkill --help`: Display help

## Process Control
- `kill PID`: Terminate process (SIGTERM)
- `kill -1 PID`: SIGHUP (hangup)
- `kill -2 PID`: SIGINT (interrupt)
- `kill -9 PID`: SIGKILL (force kill)
- `kill -15 PID`: SIGTERM (graceful)
- `kill -18 PID`: SIGCONT (continue)
- `kill -19 PID`: SIGSTOP (stop)
- `kill -20 PID`: SIGTSTP (stop from terminal)
- `kill -l`: List signal names
- `kill --help`: Display help
- `kill --version`: Display version

- `killall process`: Kill by name
- `killall -9 process`: Force kill by name
- `killall -u user process`: Kill user's processes
- `killall -i process`: Interactive
- `killall --help`: Display help

- `pkill process`: Kill by name/pattern
- `pkill -9 process`: Force kill
- `pkill -u user process`: Kill user's processes
- `pkill -f pattern`: Match full command line
- `pkill --help`: Display help

## Background Jobs
- `jobs`: List jobs
- `jobs -l`: With PIDs
- `jobs -p`: PIDs only
- `jobs -r`: Running jobs
- `jobs -s`: Stopped jobs
- `jobs --help`: Display help

- `bg`: Background most recent job
- `bg %job`: Background specific job
- `bg --help`: Display help

- `fg`: Foreground most recent job
- `fg %job`: Foreground specific job
- `fg --help`: Display help

- `nohup command`: Run immune to hangup
- `nohup command &`: Run in background
- `nohup command > output.log 2>&1 &`: With logging
- `nohup --help`: Display help

- `disown`: Remove from job list
- `disown -h`: Mark as not receiving SIGHUP
- `disown %job`: Specific job
- `disown --help`: Display help

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