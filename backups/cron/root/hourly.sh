#!/bin/bash  

USER=thomas
export XDG_RUNTIME_DIR=/run/user/1000

source /home/thomas/.env

if mountpoint -q /media/backups-home; then
		sudo /usr/bin/rsnapshot -c /etc/rsnapshot_root.conf hourly
		if [ $? -eq 0 ]; then                                                                                                                                                                                      
				/home/thomas/repos/slack-notifier/src/index.js 'backups' '✅🫚 Hourly `/` backup completed successfully'	
		else                                                               
				/home/thomas/repos/slack-notifier/src/index.js 'backups' '⛔🫚 Hourly `/` backup failed.'	
		fi                      
else 
		echo "Backup drive not mounted"
		/home/thomas/repos/slack-notifier/src/index.js 'backups' '💾🫚 Error: `/` backup drive not mounted.'	
fi
