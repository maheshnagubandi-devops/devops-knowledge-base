# Shell Scripting Cheatsheet

## 1. Create and run a shell script

```bash
vi sample.sh
```

Inside `sample.sh`:
```bash
#!/bin/bash
# script content here
```

Save and exit:
```bash
Esc :wq!
```

Make it executable:
```bash
chmod 777 sample.sh
```

Run it:
```bash
./sample.sh
```

---

## 2. Quoting and variables

- Use `echo "$SHELL"` for variables.
- Use no quotes for plain numbers only when safe.
- Prefer quotes for all variables in tests and string output.

Examples:
```bash
echo "$SHELL"
echo "$a"
```

### Dot sourcing

- Use `.` or `source` to execute a shell script in the current shell.
- Example:
```bash
. ./script.sh
source ./script.sh
```

---

## 3. Current shell and shells list

- Check your current shell:
```bash
echo "$SHELL"
```
- Check available shells:
```bash
cat /etc/shells
```
- Change shell:
```bash
chsh
```

---

## 4. File test operators

| Operator | Meaning |
|---|---|
| `-e` | file exists |
| `-f` | regular file |
| `-d` | directory |
| `-s` | file exists and is not empty |
| `-r` | readable |
| `-w` | writable |
| `-x` | executable |
| `-L` | symbolic link |
| `-h` | symbolic link |
| `-l` | hard link check (custom via `find -type f -links`) |
| `-p` | named pipe |
| `-b` | block device |
| `-c` | character device |

---

## 5. Conditional expressions: `[` vs `[[`

### Single bracket `[` 
- Works in portable POSIX shells.
- Always quote variables to avoid syntax errors with spaces or empty values.

Example:
```bash
if [ "$name" = "Admin" ]; then
  echo "match"
fi
```

### Double bracket `[[`
- Bash-only construct.
- Handles empty values and spaces more safely.
- Supports pattern matching and `&&` / `||` without escaping.

Example:
```bash
if [[ $name = "Admin" ]]; then
  echo "match"
fi
```

---

## 6. Infinite loop

```bash
while true; do
  echo "press [ctrl+c] to exit this loop"
  sleep 2
done
```

---

## 7. Cron jobs and shell practice

- `crontab -e` edits scheduled tasks.
- Use shell scripting for repeatable automation tasks.

---

## 8. Interview-ready script patterns

### Basic script structure
```bash
#!/bin/bash

# first program
echo "devops-basics-shellscripting"
pwd
ls -la
date
df -h
uname -a
```

### Arguments
```bash
#!/bin/bash

echo "hi, I am $1"
echo "I stay at $3"
```

### Variables
```bash
#!/bin/bash

a=$(pwd)
b=$(ls -lrt)
c="This is Mahesh"
echo "$a"
echo "$b"
echo "$c"
```

### Read input
```bash
#!/bin/bash

read -p "Enter your name: " name
echo "hi $name"
read -p "Enter your place: " place
echo "I am from $place"
```

### Special shell variables
```bash
#!/bin/bash

echo "script name: $0"
echo "first arg: $1"
echo "second arg: $2"
echo "arg count: $#"
echo "all args: $*"
echo "array args: $@"
echo "current PID: $$"
echo "last background PID: $!"
echo "last command status: $?"
```

### Arithmetic with `expr`
```bash
sum=$(expr "$1" + "$2")
echo "sum = $sum"
```

### If / else
```bash
if [ "$a" -gt "$b" ]; then
  echo "$a is big"
else
  echo "$b is big"
fi
```

### File / directory / link check
```bash
if [ -L "$name" ]; then
  echo "$name is a symbolic link"
elif [ -d "$name" ]; then
  echo "$name is a directory"
elif [ -f "$name" ]; then
  echo "$name is a file"
else
  echo "$name does not exist"
fi
```

### Loop examples
```bash
# print from n to 1
num=$1
while [ "$num" -gt 0 ]; do
  echo "$num"
  num=$(expr "$num" - 1)
done
```

```bash
# print 1 to 10
for num in {1..10}; do
  echo "$num"
done
```

---

## 9. Common script safety tips

- Always use `#!/bin/bash` at the top of a Bash script.
- Quote variable expansions inside test expressions: `"$var"`.
- Use `set -euo pipefail` in production scripts for safer execution.
- Use `chmod 755` for executable scripts rather than `chmod 777` when possible.
- Use `./script.sh` to run the local file.

---

## 10. Recommended interview topics

- Shell script creation and execution flow
- Quoting rules and variable expansion
- `if`, `elif`, `else`, and `case`
- `for`, `while`, and infinite loops
- File tests and file types
- Command-line arguments `$1`, `$2`, `$#`, `$@`, `$*`
- Special variables: `$0`, `$$`, `$?`, `$!`
- Basic arithmetic with `expr` and command substitution
- Reading user input with `read`
