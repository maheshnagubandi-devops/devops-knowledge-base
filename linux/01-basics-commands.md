# Linux Basics Commands

## Help and Manual
- `man` / `info` / `--help`: Get command help
- `man -D` / `--default`: Reset man behavior
- `--context` / `--version` / `--help`: Options

## Terminal Controls
- `clear`: Clear console screen
- `exit`: Exit current shell session (0 for success, 1 for error)
- `logout`: Exit from login shell
- `q`: Quit (e.g., in man, more)
- `Ctrl+C`: Interrupt current command
- `Ctrl+D`: End of input / logout
- `Ctrl+Z`: Suspend process (resume with `fg` or `bg`)
- `Ctrl+W`: Erase word in vi
- `Ctrl+V`: Erase line in vi
- `!!`: Repeat last command

## History
- `history`: View command history
- `history -d <num>`: Delete specific entry
- `history -c`: Clear history
- `history | tail`: Last 10 commands
- `.bash_history`: History file

## Echo and Printing
- `echo $<variable>` or `echo "text"`: Print to console
- `printf`: Alternative to echo

## File Creation and Directories
- `touch <file>`: Create/update file
- `touch f{1..100}`: Create multiple files
- `mkdir <dir>`: Create directory
- `mkdir -p dir1/dir2/dir3`: Nested directories
- `mkdir -v`: Verbose
- `mkdir -m 777 dir`: With permissions

## File Viewing
- `cat <file>`: Display file content
- `cat -n <file>`: With line numbers
- `cat -A <file>`: Show all characters
- `cat -s <file>`: Squeeze blank lines
- `cat file1 >> file2`: Append
- `cat file1 > file2`: Overwrite
- `tac <file>`: Reverse order
- `more <file>`: Page-wise viewing
- `less <file>`: Screen-wise viewing

## Navigation
- `pwd`: Print working directory
- `cd` or `cd ~`: Home directory
- `cd /`: Root
- `cd ..`: Up one level
- `cd -`: Previous directory
- `ls`: List files
- `ls -a`: All files (including hidden)
- `ls -l`: Long format
- `ls -h`: Human readable sizes
- `ls -F`: Add / to directories
- `ls -r`: Reverse order
- `ls -R`: Recursive
- `ls -ltr`: Latest first
- `ls -S`: Sort by size
- `ls -t`: Sort by time
- `ls -I`: Inode numbers
- `ls -ld <dir>`: Directory details

## Users and System
- `who`: Logged in users
- `whoami`: Current user
- `finger`: User details
- `uname -a`: System info
- `uptime`: System uptime
- `date`: Current date/time
- `hostname`: Hostname
- `hostname -i`: IP address

## Text Processing Basics
- `awk '{print $1}' file`: Print first column
- `awk '/pattern/' file`: Find lines with pattern
- `grep 'pattern' file`: Search for text
- `sed 's/old/new/g' file`: Replace text
- `cut -d',' -f1 file`: Extract columns
- `sort file`: Sort lines
- `uniq file`: Remove duplicates
