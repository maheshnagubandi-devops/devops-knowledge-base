# DevOps Shell Scripting Interview Questions

This file contains focused DevOps-style shell scripting questions and short answers or tasks to practice.

## Quick practice questions

1. How do you make a script fail on the first error and treat unset variables as errors?
   - Use `set -euo pipefail` at the top of the script.

2. Write a one-liner to find the largest file in a directory.
   - `find . -type f -exec ls -s {} + | sort -n -r | head -n1`

3. How would you safely parse flags `-u username -p password`?
   - Use `getopts` to parse options and validate required args.

4. How to schedule a script to run daily at 2 AM?
   - Add a crontab entry: `0 2 * * * /path/to/script.sh`

5. Demonstrate how you would capture and handle SIGINT to cleanup temporary files.
   - Use `trap 'cleanup; exit 130' INT` and implement `cleanup()`.

6. How to pass multiple filenames to a script and process them safely (files with spaces)?
   - Use `for f in "$@"; do <process> "$f"; done` and quote expansions.

7. Explain how you would deploy a small config change to multiple servers using a script.
   - Use a `for` loop over hostnames, remote-copy (`scp` or `rsync`), and restart service via `ssh` with checks; add parallelism with `xargs -P` or background jobs and collect statuses.

8. Write a script snippet that rotates logs older than 30 days in `/var/log/myapp`.
   - `find /var/log/myapp -type f -mtime +30 -exec gzip {} \; -exec mv {}.gz /var/log/myapp/archive/ \;`

9. How do you safely update an environment variable for a service started by systemd?
   - Update the unit drop-in (`systemctl edit myservice`) or use `/etc/default/` and `systemctl daemon-reload` then restart.

10. How to detect whether a given port (e.g., 8080) is listening and return non-zero if not?
    - `ss -tuln | grep -q ':8080' || exit 1`

## Hands-on tasks

### Task 1: Backup `/etc` with rotation (keep last 7 backups)

**Objective:** Create a script that backs up `/etc` to a dated tarball and automatically removes backups older than 7 days.

**Solution:**

```bash
#!/bin/bash

set -euo pipefail

BACKUP_DIR="/backup/etc"
BACKUP_FILE="$BACKUP_DIR/etc_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
RETENTION_DAYS=7

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
echo "Creating backup: $BACKUP_FILE"
tar -czf "$BACKUP_FILE" /etc/ 2>/dev/null || {
  echo "Error: Failed to create backup" >&2
  exit 1
}

echo "Backup created successfully"

# Remove backups older than RETENTION_DAYS
echo "Cleaning up backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -name "etc_backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS -delete

echo "Backup rotation complete"
```

**Usage:**
```bash
chmod +x backup_etc.sh
./backup_etc.sh
```

**Cron setup (daily at 2 AM):**
```bash
0 2 * * * /path/to/backup_etc.sh >> /var/log/backup_etc.log 2>&1
```

---

### Task 2: Disk usage monitoring with email alert

**Objective:** Monitor disk usage and send alert email if usage exceeds 85%.

**Solution:**

```bash
#!/bin/bash

set -euo pipefail

THRESHOLD=85
EMAIL="admin@example.com"
HOSTNAME=$(hostname)

# Check disk usage for root filesystem
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  SUBJECT="ALERT: High Disk Usage on $HOSTNAME - ${USAGE}%"
  MESSAGE="
Disk usage alert for $HOSTNAME

Filesystem: /
Current usage: ${USAGE}%
Threshold: ${THRESHOLD}%

Disk space details:
$(df -h /)

Top 10 largest files:
$(find / -type f -size +100M 2>/dev/null | head -10)

Action required!
  "
  
  echo "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
  echo "Alert sent to $EMAIL"
  exit 1
else
  echo "Disk usage OK: ${USAGE}%"
  exit 0
fi
```

**Usage:**
```bash
chmod +x disk_monitor.sh
./disk_monitor.sh
```

**Cron setup (check every hour):**
```bash
0 * * * * /path/to/disk_monitor.sh
```

---

### Task 3: CSV user account creation with dry-run

**Objective:** Read CSV file of users and create system accounts with optional dry-run mode.

**CSV format:**
```csv
username,fullname,uid,gid
john_doe,John Doe,1001,1001
jane_smith,Jane Smith,1002,1002
```

**Solution:**

```bash
#!/bin/bash

set -euo pipefail

DRY_RUN="${1:-false}"
CSV_FILE="${2:-users.csv}"

if [ ! -f "$CSV_FILE" ]; then
  echo "Error: CSV file not found: $CSV_FILE" >&2
  exit 1
fi

# Skip header line
tail -n +2 "$CSV_FILE" | while IFS=',' read -r username fullname uid gid; do
  username=$(echo "$username" | xargs)  # trim whitespace
  fullname=$(echo "$fullname" | xargs)
  uid=$(echo "$uid" | xargs)
  gid=$(echo "$gid" | xargs)
  
  echo "Processing: $username ($fullname)"
  
  # Check if user exists
  if id "$username" &>/dev/null; then
    echo "  ⚠ User $username already exists, skipping"
    continue
  fi
  
  # Create command
  CMD="useradd -u $uid -g $gid -c \"$fullname\" -m -s /bin/bash $username"
  
  if [ "$DRY_RUN" = "true" ]; then
    echo "  [DRY-RUN] $CMD"
  else
    echo "  [CREATING] $CMD"
    eval "$CMD" || echo "  ✗ Failed to create $username"
    echo "  ✓ User $username created"
  fi
done
```

**Usage:**
```bash
chmod +x create_users.sh

# Dry-run (no changes)
./create_users.sh true users.csv

# Actually create users (requires root/sudo)
sudo ./create_users.sh false users.csv
```

---

### Task 4: Docker image deployment with rollback

**Objective:** Deploy a Docker image to a host with automatic rollback on failure.

**Solution:**

```bash
#!/bin/bash

set -euo pipefail

IMAGE="$1"
CONTAINER_NAME="${2:-myapp}"
REGISTRY="${3:-docker.io}"
FULL_IMAGE="$REGISTRY/$IMAGE"

# Backup current container info
OLD_CONTAINER_ID=$(docker ps -a -q -f name="$CONTAINER_NAME" 2>/dev/null || true)
OLD_IMAGE=$(docker inspect "$CONTAINER_NAME" --format='{{.Image}}' 2>/dev/null || true)

cleanup_old() {
  if [ -n "$OLD_CONTAINER_ID" ]; then
    echo "Cleaning up old container: $OLD_CONTAINER_ID"
    docker rm -f "$OLD_CONTAINER_ID" 2>/dev/null || true
  fi
}

rollback() {
  echo "ERROR: Deployment failed. Rolling back..."
  docker stop "$CONTAINER_NAME" 2>/dev/null || true
  docker rm "$CONTAINER_NAME" 2>/dev/null || true
  
  if [ -n "$OLD_IMAGE" ]; then
    echo "Restarting old container with image: $OLD_IMAGE"
    docker run -d --name "$CONTAINER_NAME" "$OLD_IMAGE"
  fi
  exit 1
}

trap rollback ERR

echo "1. Pulling new image: $FULL_IMAGE"
docker pull "$FULL_IMAGE" || exit 1

echo "2. Stopping current container"
docker stop "$CONTAINER_NAME" 2>/dev/null || true

echo "3. Starting new container with image: $FULL_IMAGE"
docker run -d --name "${CONTAINER_NAME}_new" "$FULL_IMAGE" || rollback

echo "4. Health checks"
sleep 5
if docker exec "${CONTAINER_NAME}_new" curl -f http://localhost:8080/health >/dev/null 2>&1; then
  echo "5. Health check passed"
  
  # Rename old to backup, new to active
  docker rename "$CONTAINER_NAME" "${CONTAINER_NAME}_old" 2>/dev/null || true
  docker rename "${CONTAINER_NAME}_new" "$CONTAINER_NAME"
  
  # Cleanup old
  cleanup_old
  
  echo "✓ Deployment successful"
  exit 0
else
  echo "✗ Health check failed"
  rollback
fi
```

**Usage:**
```bash
chmod +x deploy_docker.sh
./deploy_docker.sh "myrepo/myapp:v1.2.3" myapp docker.io
```

---

## Behavioral / explanation questions

### Q1: When would you choose `awk` vs `sed` vs pure Bash parsing?

**Answer:**

| Tool | Use Case | Example |
|------|----------|---------|
| **Bash (parameter expansion)** | Simple string manipulation, small data | `${var%.*}`, `${var#*/}` |
| **sed** | Stream editing, single-pass text replacements | `sed 's/old/new/g'`, `sed '/pattern/d'` |
| **awk** | Multi-field parsing, columnar data, aggregation | `awk '{sum+=$2} END {print sum}'` |

**Examples:**

```bash
# Bash: simple variable manipulation (fastest, no external process)
filename="myfile.txt"
name="${filename%.*}"  # myfile

# sed: find and replace across file
sed -i 's/apache/nginx/g' config.txt

# awk: parse CSV and sum column
awk -F',' '{sum+=$3} END {print "Total:", sum}' data.csv

# awk: complex columnar processing
ps aux | awk '{if ($3 > 50) print $1, $3}' # Print users with >50% CPU

# sed + awk combo: extract lines, then process
grep "ERROR" logfile | sed 's/\[.*\] //' | awk -F':' '{print $2}'
```

**Decision tree:**
- **Bash only:** Single variable, built-in string ops
- **sed:** File-wide text replacements, regex substitution
- **awk:** Multi-column data, field-based operations, aggregation

---

### Q2: Race conditions in scripts and prevention

**Answer:**

**Race condition example (UNSAFE):**
```bash
# PROBLEM: Multiple processes can create this file simultaneously
if [ ! -f /tmp/lockfile ]; then
  touch /tmp/lockfile
  # ... critical section ...
  rm /tmp/lockfile
fi
```

**Why it's unsafe:** Between the `if` check and `touch`, another process might also pass the check.

**Solutions:**

**1. Atomic file creation with `set -C` (noclobber)**
```bash
#!/bin/bash
set -euo pipefail

LOCKFILE="/tmp/myapp.lock"

# Atomically create lock file (fails if exists)
if exec 200>"$LOCKFILE"; then
  trap 'rm -f "$LOCKFILE"' EXIT
  echo $$ > "$LOCKFILE"
  
  # ... critical section ...
  echo "Processing..."
else
  echo "Another process is running" >&2
  exit 1
fi
```

**2. Using `mkdir` (atomic operation)**
```bash
LOCKDIR="/tmp/myapp.lock"

if mkdir "$LOCKDIR" 2>/dev/null; then
  trap 'rmdir "$LOCKDIR"' EXIT
  echo "Lock acquired"
  
  # ... critical section ...
else
  echo "Lock exists, another process running" >&2
  exit 1
fi
```

**3. Using `flock` (file locking)**
```bash
#!/bin/bash

(
  flock -n 200 || { echo "Another process running"; exit 1; }
  
  # ... critical section ...
  echo "Processing safely with lock"
  
) 200>/tmp/myapp.lock
```

**4. PID-based locking with timeout**
```bash
acquire_lock() {
  local lockfile="$1"
  local timeout="${2:-30}"
  local elapsed=0
  
  while [ $elapsed -lt $timeout ]; do
    if mkdir "$lockfile" 2>/dev/null; then
      echo $$ > "$lockfile/pid"
      return 0
    fi
    
    # Check if lock holder still alive
    local lock_pid=$(cat "$lockfile/pid" 2>/dev/null || echo "")
    if [ -z "$lock_pid" ] || ! kill -0 "$lock_pid" 2>/dev/null; then
      rmdir "$lockfile" 2>/dev/null || true
      continue
    fi
    
    sleep 1
    ((elapsed++))
  done
  
  return 1
}
```

---

### Q3: Making scripts idempotent

**Answer:**

An **idempotent** script produces the same result whether run once or multiple times.

**Bad (NOT idempotent):**
```bash
# Running twice would append twice
echo "192.168.1.1 myhost" >> /etc/hosts
```

**Good (idempotent):**
```bash
# Only adds if not already present
grep -q "192.168.1.1 myhost" /etc/hosts || \
  echo "192.168.1.1 myhost" >> /etc/hosts
```

**Idempotent patterns:**

```bash
# 1. Check before modifying
ensure_dir() {
  [ -d "$1" ] || mkdir -p "$1"
}

# 2. Use sed with -i for in-place replacement (safe)
ensure_config() {
  local key="$1" value="$2" file="$3"
  
  if grep -q "^${key}=" "$file"; then
    sed -i "s/^${key}=.*/${key}=${value}/" "$file"
  else
    echo "${key}=${value}" >> "$file"
  fi
}

# 3. Use service state checks
ensure_service_running() {
  local service="$1"
  
  if ! systemctl is-active --quiet "$service"; then
    systemctl start "$service"
  fi
}

# 4. Atomic operations with temp files
ensure_file_content() {
  local file="$1" content="$2"
  
  echo "$content" > "$file.tmp"
  diff -q "$file" "$file.tmp" >/dev/null 2>&1 || mv "$file.tmp" "$file"
  rm -f "$file.tmp"
}

# 5. User creation (idempotent)
ensure_user() {
  local user="$1"
  
  if ! id "$user" >/dev/null 2>&1; then
    useradd -m -s /bin/bash "$user"
  fi
}
```

**Real-world idempotent deployment script:**
```bash
#!/bin/bash
set -euo pipefail

SERVICE="myapp"
IMAGE="myapp:v1.0"
CONFIG_FILE="/etc/myapp/config.yml"

# Ensure config directory exists
[ -d "${CONFIG_FILE%/*}" ] || mkdir -p "${CONFIG_FILE%/*}"

# Ensure config file with idempotent pattern
if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" << EOF
env: production
port: 8080
EOF
fi

# Pull image (idempotent - latest is checked)
docker pull "$IMAGE" || true

# Create/update container (check if exists)
if docker ps -a --format '{{.Names}}' | grep -q "^${SERVICE}\$"; then
  echo "Container exists, updating..."
  docker stop "$SERVICE" || true
  docker rm "$SERVICE" || true
fi

# Run container
docker run -d \
  --name "$SERVICE" \
  -v "$CONFIG_FILE:/app/config.yml" \
  "$IMAGE"

echo "Service deployed idempotently"
```

---

Practice these solutions and experiment with variations!
