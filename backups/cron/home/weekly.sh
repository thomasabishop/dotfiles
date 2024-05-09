#!/bin/bash  

USER=thomas
export XDG_RUNTIME_DIR=/run/user/1000


source /home/thomas/.env

if mountpoint -q /media/backups-home; then
		sudo /usr/bin/rsnapshot -c /etc/rsnapshot.conf weekly
		# sudo /usr/bin/rsnapshot weekly
		if [ $? -eq 0 ]; then                                                                                                                                                                                      
			/home/thomas/repos/slack-notifier/src/index.js 'backups' '✅🏠 Weekly `/home` backup completed successfully.'	
		else                                                                                                                                                                                                       
			/home/thomas/repos/slack-notifier/src/index.js 'backups' '⛔🏠 Weekly `/home` backup failed.'	
		fi                      
else 
		echo "Backup drive not mounted"
		/home/thomas/repos/slack-notifier/src/index.js 'backups' '💾🏠 Error: `/home` backup drive not mounted.'	
fi
