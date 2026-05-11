# File System Commands

## Copying Files
- `cp source dest`: Copy file
- `cp -r dir1 dir2`: Copy directory
- `cp -i`: Interactive (confirm overwrite)
- `cp -b`: Backup
- `cp -f`: Force
- `cp -p`: Preserve attributes
- `cp -u`: Update (newer only)
- `cp -l`: Hard link
- `cp -s`: Symbolic link
- `cp -v`: Verbose
- `cp -n`: No overwrite

## Moving/Renaming
- `mv source dest`: Move/rename
- `mv -i`: Interactive
- `mv -b`: Backup
- `mv -f`: Force
- `mv -u`: Update
- `mv -v`: Verbose
- `mv -n`: No overwrite
- `mv -t dest file1 file2`: Move multiple to dest

## Removing Files
- `rm file`: Delete file
- `rm -f`: Force
- `rm -i`: Interactive
- `rm -r dir`: Recursive (directory)
- `rm -rf dir`: Force recursive
- `rmdir dir`: Remove empty directory
- `rmdir -p dir1/dir2`: Remove parent if empty

## Finding Files
- `find path -name pattern`: Find by name
- `find . -type f`: Files only
- `find . -type d`: Directories only
- `find . -empty`: Empty files/dirs
- `find . -mtime +days`: Modified > days ago
- `find . -mtime -days`: Modified < days ago
- `find . -mmin -mins`: Modified < mins ago
- `find . -size +size`: Size > 
- `find . -perm permissions`: Specific permissions
- `find . -user username`: Owned by user
- `find . -exec cmd {} \;`: Execute command on results

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
- `apt update`: Update package list
- `apt upgrade`: Upgrade packages
- `apt install package`: Install
- `apt remove package`: Remove
- `apt purge package`: Remove with config
- `apt autoremove`: Remove unused
- `apt search term`: Search packages
