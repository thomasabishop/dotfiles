#!/bin/bash  

USER=thomas
export XDG_RUNTIME_DIR=/run/user/1000


source /home/thomas/.env

if mountpoint -q /media/backups; then
		sudo /usr/bin/rsnapshot weekly
		if [ $? -eq 0 ]; then                                                                                                                                                                                      
			/home/thomas/repos/slack-notifier/src/index.js 'backups' '✅ Weekly backup completed successfully.'	
		else                                                                                                                                                                                                       
			/home/thomas/repos/slack-notifier/src/index.js 'backups' '⛔ Weekly backup failed.'	
		fi                      
else 
		echo "Backup drive not mounted"
		/home/thomas/repos/slack-notifier/src/index.js 'backups' '💾 Error: backup drive not mounted.'	
fi
