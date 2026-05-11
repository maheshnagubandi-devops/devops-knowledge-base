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
- `cut`: Cut fields
- `paste`: Join files
- `join`: Join on key
- `tr`: Translate characters
- `sed`: Stream editor
- `awk`: Pattern scanning and text processing

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