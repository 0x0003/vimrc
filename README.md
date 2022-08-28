# Legacy vim configuration for remote systems and cygwin
## Prerequisites
- vim **version 8 or higher**, optionally built with +python3 for plugin support
## Installation
### Clone repo
```bash
git clone https://github.com/0x0003/vimrc.git $HOME/.vim && cd $HOME/.vim
```
### Create directories to store sessions, undofiles and backups
```bash
./init.sh
```
### Install plugins
```bash
cd pack && ./manage.sh
```
