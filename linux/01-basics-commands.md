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
- `history -100`: View recent 100 commands
- `history 100`: View from 100th command
- `.bash_history`: History file

## Echo and Printing
- `echo $<variable>` or `echo "text"`: Print to console
- `printf`: Alternative to echo

## File Creation and Directories
- `touch <filename>`: Create/update file
- `touch f1 f2`: Create multiple files
- `touch f{1..100}`: Create files f1 to f100
- `touch -a`: Change access time
- `touch -c`: Avoid creating new file
- `touch -d=<string>`: Change timestamp using date string
- `touch -f`: Force change
- `touch -m`: Change modification time
- `touch -h`: Change symbolic links timestamp
- `touch -t <stamp>`: Modify timestamp
- `touch --help`: Display help menu
- `touch -v`: Print program version

- `mkdir <dir name>`: Create directory
- `mkdir d1 d2 d3`: Create multiple directories
- `mkdir d{1..100}`: Create directories d1 to d100
- `mkdir -p d1/d2/d3`: Create nested directories
- `mkdir -v d1`: Display verbose
- `mkdir -p -v d1/d2/d3`: Create with verbose
- `mkdir -m 777 d2`: Create with permissions
- `mkdir -m a+rwx d1`: Create with symbolic permissions
- `mkdir --help`: Display help
- `mkdir -m`: Set file mode
- `mkdir --mode`: Set file mode
- `mkdir -Z`: Set SELinux context
- `mkdir -context`: Set SELinux/Smack context
- `mkdir --version`: Display version

## File Viewing
- `cat <file>`: Display file content
- `cat -n <file>`: With line numbers
- `cat -A <file>`: Show all characters (equivalent to -vET)
- `cat -b <file>`: Number nonempty output lines
- `cat -e <file>`: Equivalent to -vE
- `cat -E <file>`: Display $ at end of each line
- `cat -s <file>`: Suppress repeated empty lines
- `cat -T <file>`: Display TAB characters as ^I
- `cat -v <file>`: Display control characters
- `cat file1 >> file2`: Append contents
- `cat file1 > file2`: Overwrite contents
- `cat *.txt`: Display all text files
- `cat >> file`: Write to file (Ctrl+D to end)
- `cat -f filename`: Delete empty lines and display
- `cat -s geeks.txt`: Suppress repeated empty lines
- `cat -n filename`: Display with line numbers
- `cat>filename`: Create new file
- `tac <file>`: Display in reverse order
- `cat file | more`: View with paging
- `cat file | less`: View with scrolling

- `more <file>`: View text files one screen at a time
- `more -l`: Do not pause after ^L
- `more -f`: Count logical lines
- `more -p`: Clear screen and display
- `more -c`: Display on same area by overlapping
- `more -s`: Squeeze multiple blank lines
- `more -u`: Suppress underlining
- `more -d`: Show navigation help
- `more +/pattern`: Search string
- `more +num`: Display from line number
- `more -num`: Scroll lines per spacebar

- `less <file>`: View text files with scrolling
- `less -N <file>`: Show line numbers
- `less -X <file>`: Leave content on screen
- `less +F /var/log/messages`: Watch file for changes

## Navigation
- `pwd`: Print working directory
- `pwd -L`: Print logical path (default)
- `pwd -P`: Print physical path (resolve symlinks)
- `pwd --help`: Display help
- `pwd --version`: Display version

- `cd` or `cd ~`: Home directory
- `cd /`: Root
- `cd ..`: Up one level
- `cd -`: Previous directory
- `cd ../..`: Up two levels
- `cd ~user`: Go to user's home
- `cd -P`: Resolve symlinks
- `cd -L`: Don't resolve symlinks
- `cd --help`: Display help
- `cd --version`: Display version
## Vi/Vim Editor
- `vi <file>`: Open file in vi
- `vim <file>`: Open file in vim
- `vim -R <file>`: Open in read-only mode
- `vim -r <file>`: Recover crashed session
- `vim +<num> <file>`: Open at line number
- `vim +/<pattern> <file>`: Open at pattern
- `vim -c "command" <file>`: Execute command after opening
- `vim -O file1 file2`: Open files in vertical split
- `vim -o file1 file2`: Open files in horizontal split
- `vim -d file1 file2`: Open files in diff mode
- `vim -b <file>`: Open binary file
- `vim --version`: Show vim version and features

### Vi Modes
- `i`: Insert mode (before cursor)
- `a`: Append mode (after cursor)
- `I`: Insert at beginning of line
- `A`: Append at end of line
- `o`: Open new line below
- `O`: Open new line above
- `Esc`: Command mode
- `:`: Command line mode
- `v`: Visual mode (character selection)
- `V`: Visual line mode (line selection)
- `Ctrl+v`: Visual block mode (column selection)

### Navigation
- `h/j/k/l`: Left/down/up/right
- `w`: Next word start
- `W`: Next WORD start (ignores punctuation)
- `b`: Previous word start
- `B`: Previous WORD start
- `e`: End of word
- `E`: End of WORD
- `0`: Beginning of line
- `$`: End of line
- `^`: First non-blank character of line
- `gg`: Beginning of file
- `G`: End of file
- `:<num>`: Go to line number
- `H`: Top of screen
- `M`: Middle of screen
- `L`: Bottom of screen
- `Ctrl+f`: Page forward
- `Ctrl+b`: Page backward
- `Ctrl+d`: Half page down
- `Ctrl+u`: Half page up
- `%`: Jump to matching bracket
- `(`: Previous sentence
- `)`: Next sentence
- `{`: Previous paragraph
- `}`: Next paragraph

### Editing
- `x`: Delete character under cursor
- `X`: Delete character before cursor
- `dd`: Delete current line
- `D`: Delete from cursor to end of line
- `dw`: Delete word
- `d$`: Delete to end of line
- `d0`: Delete to beginning of line
- `yy`: Yank (copy) current line
- `yw`: Yank word
- `y$`: Yank to end of line
- `p`: Paste after cursor
- `P`: Paste before cursor
- `u`: Undo last change
- `Ctrl+r`: Redo last undone change
- `U`: Undo all changes on current line
- `r`: Replace single character
- `R`: Replace mode (overwrite)
- `cw`: Change word
- `cc`: Change entire line
- `C`: Change from cursor to end of line
- `s`: Substitute character
- `S`: Substitute line
- `~`: Toggle case of character
- `J`: Join lines
- `.`: Repeat last command

### Search and Replace
- `/pattern`: Search forward for pattern
- `?pattern`: Search backward for pattern
- `n`: Next occurrence
- `N`: Previous occurrence
- `*`: Search for word under cursor
- `#`: Search backward for word under cursor
- `:%s/old/new/g`: Replace all occurrences in file
- `:%s/old/new/gc`: Replace with confirmation
- `:s/old/new/`: Replace first occurrence in line
- `:s/old/new/g`: Replace all in current line
- `:%s/^/#/` : Comment all lines
- `:%s/^#//` : Uncomment all lines
- `:g/pattern/d`: Delete all lines containing pattern
- `:v/pattern/d`: Delete all lines NOT containing pattern

### Visual Mode Operations
- `v` then move: Select text, then `d` (delete), `y` (yank), `c` (change)
- `V` then move: Select lines, then operations
- `Ctrl+v` then move: Select block, then operations
- `>`: Indent selected text
- `<`: Unindent selected text
- `=` : Auto-indent selected text
- `~`: Toggle case of selection

### Advanced Editing
- `Ctrl+a`: Increment number under cursor
- `Ctrl+x`: Decrement number under cursor
- `gq`: Format text (wrap lines)
- `g?`: Rot13 encode/decode
- `ga`: Show ASCII value of character
- `gf`: Open file under cursor
- `gd`: Go to definition (local)
- `gD`: Go to definition (global)

### Windows and Tabs
- `:split` or `:sp`: Horizontal split
- `:vsplit` or `:vsp`: Vertical split
- `Ctrl+w h/j/k/l`: Move between windows
- `Ctrl+w =`: Equalize window sizes
- `Ctrl+w _`: Maximize current window
- `Ctrl+w |`: Maximize vertical window
- `:tabnew`: New tab
- `gt`: Next tab
- `gT`: Previous tab
- `:tabclose`: Close tab

### Saving and Quitting
- `:w`: Write/save
- `:w filename`: Save as filename
- `:wq`: Write and quit
- `:x`: Write and quit (only if modified)
- `:q`: Quit
- `:q!`: Quit without saving
- `:w!`: Force write (overwrite)
- `:wq!`: Force write and quit
- `:qa`: Quit all windows
- `:qa!`: Quit all without saving
- `ZZ`: Write and quit (same as :x)
- `ZQ`: Quit without saving (same as :q!)

### File Operations
- `:e filename`: Edit new file
- `:r filename`: Read file into current buffer
- `:r !command`: Read command output into buffer
- `:w !command`: Write buffer to command
- `:saveas filename`: Save as new file

### Buffers
- `:ls` or `:buffers`: List buffers
- `:b num`: Switch to buffer number
- `:bd`: Delete buffer
- `:bn`: Next buffer
- `:bp`: Previous buffer

### Marks and Bookmarks
- `m{a-z}`: Set mark
- `'{a-z}`: Jump to mark
- `''`: Jump to last position
- `:marks`: List all marks

### Registers
- `"{register}y`: Yank to named register
- `"{register}p`: Paste from named register
- `:reg`: Show register contents
- `"+y`: Yank to system clipboard
- `"+p`: Paste from system clipboard

### Macros
- `q{register}`: Start recording macro
- `q`: Stop recording
- `@{register}`: Execute macro
- `@@`: Repeat last macro

### Configuration
- `:set number`: Show line numbers
- `:set nonumber`: Hide line numbers
- `:set autoindent`: Auto indent
- `:set noautoindent`: No auto indent
- `:set ignorecase`: Case insensitive search
- `:set noignorecase`: Case sensitive search
- `:set hlsearch`: Highlight search results
- `:set nohlsearch`: No highlight
- `:set syntax on`: Syntax highlighting
- `:set syntax off`: No syntax highlighting

### Useful Commands
- `:set list`: Show invisible characters
- `:set nolist`: Hide invisible characters
- `:retab`: Convert tabs to spaces
- `:sort`: Sort lines
- `:noh`: Clear search highlighting
- `:set paste`: Paste mode (no auto-indent)
- `:set nopaste`: Exit paste mode
- `:!command`: Execute shell command
- `:r!command`: Insert command output
- `:sh`: Start shell (Ctrl+D to return)

- `ls`: List files
- `ls -a`: All files (including hidden)
- `ls -l`: Long format
- `ls -h`: Human readable sizes
- `ls -F`: Add / to directories
- `ls -r`: Reverse order
- `ls -R`: Recursive
- `ls -ltr`: Latest modification first
- `ls -S`: Sort by size (biggest first)
- `ls -t`: Sort by time
- `ls -I`: Inode numbers
- `ls --version`: Show version
- `ls --help`: Show help
- `ls -d */`: List only directories
- `ls -p | grep -v /`: List only files
- `ls -ld <dir>`: Directory details
- `ls -n`: Display UID and GID
- `ls -l i*`: List files starting with i
- `ls -l *i`: List files ending with i

## Shell Types
- `bash`: Bourne Again Shell (most common)
- `zsh`: Z Shell (advanced features)
- `ksh`: Korn Shell
- `csh`: C Shell
- `tcsh`: TENEX C Shell
- `fish`: Friendly Interactive Shell
- `dash`: Debian Almquist Shell

## System Information
- `uname`: System name
- `uname -a`: All system information
- `uname -s`: Kernel name
- `uname -n`: Network hostname
- `uname -r`: Kernel release
- `uname -v`: Kernel version
- `uname -m`: Machine hardware
- `uname -p`: Processor type
- `uname -i`: Hardware platform
- `uname -o`: Operating system
- `uname --help`: Display help
- `uname --version`: Display version

## Word Count and File Statistics
- `wc <file>`: Count lines, words, characters
- `wc -l <file>`: Count lines only
- `wc -w <file>`: Count words only
- `wc -c <file>`: Count characters only
- `wc -m <file>`: Count characters (multibyte)
- `wc -L <file>`: Print longest line length
- `wc --help`: Display help
- `wc --version`: Display version

## Disk Usage
- `du`: Disk usage
- `du -h`: Human readable
- `du -s`: Summary only
- `du -a`: All files
- `du --max-depth=1`: Limit depth
- `du -c`: Grand total
- `du --help`: Display help
- `du --version`: Display version

## Disk Free Space
- `df`: Disk free space
- `df -h`: Human readable
- `df -i`: Inodes
- `df -T`: File system type
- `df --help`: Display help
- `df --version`: Display version

## System Monitoring
- `free`: Memory usage
- `free -h`: Human readable
- `free -s 5`: Update every 5 seconds
- `free -t`: Total
- `free --help`: Display help
- `free --version`: Display version

- `mpstat`: CPU statistics
- `mpstat -P ALL`: All processors
- `mpstat 5`: Update every 5 seconds
- `mpstat -u`: CPU utilization

## System Control
- `systemctl`: System and service manager
- `systemctl start <service>`: Start service
- `systemctl stop <service>`: Stop service
- `systemctl restart <service>`: Restart service
- `systemctl status <service>`: Check status
- `systemctl enable <service>`: Enable at boot
- `systemctl disable <service>`: Disable at boot
- `systemctl list-units`: List units
- `systemctl --help`: Display help

## Date and Time
- `date`: Current date and time
- `date +%Y-%m-%d`: Format date
- `date +%H:%M:%S`: Format time
- `date -s "2023-01-01 12:00:00"`: Set date/time
- `date --help`: Display help
- `date --version`: Display version
