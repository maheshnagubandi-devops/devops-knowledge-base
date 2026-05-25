# File System Commands

## Copying Files
- `cp source dest`: Copy file
- `cp -r dir1 dir2`: Copy directory recursively
- `cp -i`: Interactive (confirm overwrite)
- `cp -b`: Backup existing files
- `cp -f`: Force overwrite
- `cp -p`: Preserve attributes (permissions, timestamps, ownership)
- `cp -u`: Update (copy only if source is newer)
- `cp -l`: Create hard link instead of copying
- `cp -s`: Create symbolic link instead of copying
- `cp -v`: Verbose output
- `cp -n`: No overwrite (don't overwrite existing files)
- `cp -a`: Archive mode (preserve all attributes)
- `cp -d`: Preserve links
- `cp -t dest file1 file2`: Copy multiple files to destination
- `cp --help`: Display help
- `cp --version`: Display version

## Moving/Renaming
- `mv source dest`: Move/rename
- `mv -i`: Interactive (confirm overwrite)
- `mv -b`: Backup existing files
- `mv -f`: Force overwrite
- `mv -u`: Update (move only if source is newer)
- `mv -v`: Verbose output
- `mv -n`: No overwrite
- `mv -t dest file1 file2`: Move multiple files to destination
- `mv --help`: Display help
- `mv --version`: Display version

## Removing Files
- `rm file`: Delete file
- `rm -f`: Force delete (no confirmation)
- `rm -i`: Interactive (confirm each deletion)
- `rm -r dir`: Recursive delete (directory and contents)
- `rm -rf dir`: Force recursive delete
- `rm -d dir`: Remove empty directory
- `rm -v`: Verbose output
- `rm --help`: Display help
- `rm --version`: Display version
- `rmdir dir`: Remove empty directory
- `rmdir -p dir1/dir2`: Remove parent directories if empty
- `rmdir -v`: Verbose output

## Finding Files
- `find path -name pattern`: Find by name
- `find path -iname pattern`: Find by name -case insensitive
- `find . -type f`: Files only
- `find . -type d`: Directories only
- `find . -type l`:  symboliclink 
- `find . -empty`: Empty files/dirs
- `find . -mtime +days`: Modified > days ago
- `find . -mtime -days`: Modified < days ago
- `find . -mmin -mins`: Modified < mins ago
- `find . -size +size`: Size > 
- `find . -perm permissions`: Specific permissions
- `find . -user username`: Owned by user
- `find . -exec cmd {} \;`: Execute command on results
- other options includes
    -atime:for acesstimestamp, last time when file was acccessed
     -ctime: change timestamp/when filedata was changed

## Locating Files
- `locate pattern`: Search database
- `locate -i`: Case insensitive

## Permissions
- `chmod permissions file`: Change permissions
- `chmod -R`: Recursive
- `chown user:group file`: Change ownership
- `chown -R`: Recursive
- `chgrp group file`: Change group
- `umask value`: Set default permissions

## Links
- `ln target link`: Hard link
- `ln -s target link`: Symbolic link

## Disk Usage
- `du -sh file/dir`: Disk usage
- `du -sh *`: All in directory
- `df -h`: Disk free

## Word Count
- `wc file`: Lines, words, characters
- `wc -l`: Lines only
- `wc -w`: Words only
- `wc -c`: Characters only

## Sorting
- `sort file`: Sort lines
- `sort -r`: Reverse
- `sort -n`: Numeric
- `sort -k col`: Sort by column

## Differences
- `diff file1 file2`: Show differences
- `sdiff file1 file2`: Side by side

## Archiving
- `tar -cvf archive.tar files`: Create tar
- `tar -xvf archive.tar`: Extract tar
- `tar -czvf archive.tar.gz files`: Create gzip tar
- `tar -xzvf archive.tar.gz`: Extract gzip tar
- `tar -cjvf archive.tar.bz2 files`: Create bzip tar
- `tar -xjvf archive.tar.bz2`: Extract bzip tar
- `tar -tvf archive.tar`: List contents
- `tar -rvf archive.tar files`: Add to tar
- `zip archive.zip files`: Create zip
- `unzip archive.zip`: Extract zip
- `gzip file`: Compress (replaces original)
- `gunzip file.gz`: Decompress

## Package Management
### APT (Debian/Ubuntu)
- `apt update`: Update package list
- `apt upgrade`: Upgrade all packages
- `apt full-upgrade`: Upgrade with dependencies
- `apt install package`: Install package
- `apt install -y package`: Install without confirmation
- `apt remove package`: Remove package
- `apt purge package`: Remove package and config
- `apt autoremove`: Remove unused dependencies
- `apt search term`: Search packages
- `apt show package`: Show package info
- `apt list --installed`: List installed packages
- `apt list --upgradable`: List upgradable packages
- `apt edit-sources`: Edit sources list
- `apt --help`: Display help
- `apt --version`: Display version

### YUM/DNF (Red Hat/CentOS/Fedora)
- `yum update`: Update all packages
- `yum install package`: Install package
- `yum remove package`: Remove package
- `yum search term`: Search packages
- `yum info package`: Show package info
- `yum list installed`: List installed packages
- `yum clean all`: Clean cache
- `yum --help`: Display help
- `yum --version`: Display version

- `dnf update`: Update all packages (newer yum)
- `dnf install package`: Install package
- `dnf remove package`: Remove package
- `dnf search term`: Search packages
- `dnf info package`: Show package info
- `dnf list installed`: List installed packages
- `dnf clean all`: Clean cache
- `dnf --help`: Display help
- `dnf --version`: Display version
