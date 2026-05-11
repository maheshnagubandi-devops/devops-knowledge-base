# Shell Scripting Commands

## Shell Types
- `sh`: Bourne shell
- `bash`: Bourne Again Shell (default)
- `zsh`: Z Shell
- `ksh`: Korn shell
- `csh`: C shell
- `tcsh`: Enhanced C shell

## Shell Configuration
- `/etc/shells`: Available shells
- `chsh`: Change shell
- `echo $SHELL`: Current shell
- `.bashrc`: Bash config (non-login)
- `.bash_profile`: Bash config (login)
- `.profile`: Fallback

## Scripting Basics
- `#!/bin/bash`: Shebang
- `exit 0`: Success
- `exit 1`: Error

## Variables
- `var=value`: Set variable
- `$var`: Access variable
- `${var}`: Safer access
- `readonly var`: Read-only
- `unset var`: Remove

## Input/Output
- `read var`: Read input
- `echo "text"`: Output
- `printf "format" args`: Formatted output
- `tee file`: Write to file and stdout

## Redirection
- `>`: Overwrite
- `>>`: Append
- `<`: Input
- `<<`: Here document
- `2>`: Stderr
- `&>`: Both stdout/stderr

## Pipes
- `|`: Pipe output
- `command1 | command2`

## Control Structures
- `if [ condition ]; then ... fi`
- `for var in list; do ... done`
- `while [ condition ]; do ... done`
- `case var in pattern) ... ;; esac`

## Functions
- `function name() { ... }`
- `name() { ... }`

## Command Substitution
- `$(command)`: Command output
- `` `command` ``: Backticks

## Arithmetic
- `$(( expression ))`
- `let "var = expression"`

## Debugging
- `bash -x script`: Trace execution
- `set -x`: Enable tracing
- `set +x`: Disable tracing

## Text Processing
- `grep 'pattern' file`: Search for pattern
- `grep -i 'pattern' file`: Case insensitive
- `grep -v 'pattern' file`: Invert match
- `grep -n 'pattern' file`: Show line numbers
- `grep -c 'pattern' file`: Count matches
- `grep -l 'pattern' *`: Files containing pattern
- `grep -r 'pattern' dir`: Recursive search
- `grep -A 2 'pattern' file`: After context
- `grep -B 2 'pattern' file`: Before context
- `grep -C 2 'pattern' file`: Context around
- `grep -E 'pattern1|pattern2' file`: Extended regex
- `grep -F 'pattern' file`: Fixed strings
- `grep --help`: Display help
- `grep --version`: Display version

- `sed 's/old/new/g' file`: Replace text
- `sed 's/old/new/g' file > newfile`: Save to new file
- `sed -i 's/old/new/g' file`: Edit in place
- `sed '/pattern/d' file`: Delete lines
- `sed '/pattern/p' file`: Print matching lines
- `sed '5d' file`: Delete line 5
- `sed '1,10d' file`: Delete lines 1-10
- `sed 's/^/#/' file`: Comment lines
- `sed 's/$/END/' file`: Append to end of lines
- `sed -n '1,5p' file`: Print lines 1-5
- `sed --help`: Display help
- `sed --version`: Display version

- `cut -d',' -f1 file`: Extract fields
- `cut -c1-10 file`: Extract characters
- `cut -d':' -f1,3 file`: Multiple fields
- `cut --complement -f1 file`: All except field 1
- `cut --help`: Display help
- `cut --version`: Display version

- `sort file`: Sort lines
- `sort -n file`: Numeric sort
- `sort -r file`: Reverse sort
- `sort -k2 file`: Sort by field 2
- `sort -u file`: Unique
- `sort -t',' -k2 file`: Custom delimiter
- `sort --help`: Display help
- `sort --version`: Display version

- `uniq file`: Remove duplicates
- `uniq -c file`: Count occurrences
- `uniq -d file`: Show duplicates only
- `uniq -u file`: Show unique only
- `uniq --help`: Display help
- `uniq --version`: Display version

- `diff file1 file2`: Compare files
- `diff -u file1 file2`: Unified format
- `diff -r dir1 dir2`: Recursive
- `diff --help`: Display help
- `diff --version`: Display version

- `tr 'a-z' 'A-Z' < file`: Translate characters
- `tr -d '\n' < file`: Delete characters
- `tr -s ' ' < file`: Squeeze repeats
- `tr --help`: Display help
- `tr --version`: Display version

## AWK Commands
- `awk '{print $1}' file`: Print first column
- `awk '{print $NF}' file`: Print last column
- `awk 'NR==5' file`: Print line 5
- `awk '/pattern/' file`: Print lines matching pattern
- `awk '{sum += $1} END {print sum}' file`: Sum column 1
- `awk 'length($0) > 80' file`: Lines longer than 80 chars
- `awk '{print NR, $0}' file`: Add line numbers
- `awk -F',' '{print $2}' file`: Use comma as delimiter
- `awk 'BEGIN {FS=","; OFS="|"} {print $1, $2}' file`: Field separators
- `awk '$3 > 100' file`: Numeric comparison
- `awk '{if ($1 > 50) print $0}' file`: Conditional printing

## File Operations in Scripts
- `test -f file`: File exists
- `test -d dir`: Directory exists
- `[ -f file ]`: Same as test
- `[[ condition ]]`: Extended test

## Job Control
- `&`: Background
- `wait`: Wait for background jobs
- `trap`: Signal handling

## Examples
- Loop: `for i in {1..10}; do echo $i; done`
- Conditional: `if [ $var -gt 5 ]; then echo "big"; fi`
- Function: `greet() { echo "Hello $1"; }`