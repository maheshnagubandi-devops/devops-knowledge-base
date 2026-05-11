# User Management Commands

## Overview
User management commands control Linux user accounts, groups, authentication, and privilege escalation.
These commands are essential for DevOps and system administration tasks such as onboarding users, managing access, and securing servers.

## User Commands
- `useradd -m -s /bin/bash username`
  - Create a new user with a home directory and default shell.
- `useradd -r -s /sbin/nologin serviceuser`
  - Create a system user without login access.
- `usermod -aG sudo username`
  - Add an existing user to the `sudo` group.
- `usermod -d /home/newdir -m username`
  - Change a user’s home directory and move files.
- `usermod -l newname oldname`
  - Rename a user account.
- `usermod -L username`
  - Lock a user account.
- `usermod -U username`
  - Unlock a user account.
- `userdel username`
  - Remove a user account.
- `userdel -r username`
  - Remove a user account and its home directory.

## Password Management
- `passwd username`
  - Set or update a user’s password.
- `passwd -l username`
  - Lock a user password (disable login via password).
- `passwd -u username`
  - Unlock a user password.
- `passwd -e username`
  - Expire a password so the user must change it on next login.

## Group Commands
- `groupadd devops`
  - Create a new group.
- `groupmod -n newgroup oldgroup`
  - Rename an existing group.
- `groupmod -g 2000 groupname`
  - Change a group ID.
- `groupdel groupname`
  - Delete a group.
- `gpasswd -a username groupname`
  - Add a user to a group.
- `gpasswd -d username groupname`
  - Remove a user from a group.

## Identity and Group Lookup
- `id username`
  - Display the user ID, primary group, and supplementary groups.
- `id`
  - Show the current user’s identity details.
- `groups username`
  - List groups for a user.
- `groups`
  - List groups for the current user.

## Privilege Escalation
- `su - username`
  - Switch user and load the user’s login environment.
- `su -`
  - Switch to root and load the root login environment.
- `sudo command`
  - Run a command as root or another user.
- `sudo -i`
  - Start an interactive root shell.
- `sudo -l`
  - List allowed commands for the current user.
- `sudo visudo`
  - Safely edit the `/etc/sudoers` file.

## File References
- `/etc/passwd`: user account information.
- `/etc/shadow`: encrypted passwords and password aging data.
- `/etc/group`: group membership information.
- `/etc/sudoers`: sudo policy and allowed commands.

## Interview Notes
- Know the difference between `su` and `sudo`.
- Understand when to use `usermod -aG` versus replacing a user’s groups.
- Be able to explain `userdel -r` and why you might avoid deleting a user immediately.
- Know how to inspect groups with `id` and `groups`.

## Quick Examples
```bash
useradd -m -s /bin/bash alice
passwd alice
usermod -aG sudo alice
id alice
sudo -l
sudo visudo
su - alice
userdel -r alice
```
