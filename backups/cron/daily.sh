 #!/bin/bash  

USER=thomas
export XDG_RUNTIME_DIR=/run/user/1000


if mountpoint -q /media/backups; then
		sudo /usr/bin/rsnapshot daily
		sudo chown -R thomas:thomas /media/backups
		# Check the exit status of the rsnapshot command
		if [ $? -eq 0 ]; then                                                                                                                                                                                      
				/usr/bin/notify-send 'rsync' 'Daily backup completed successfully'                                                                                                                                   
		else                                                                                                                                                                                                       
				/usr/bin/notify-send -u critical 'rsync' 'Daily backup failed'                                                                                                                                                   
		fi                      
else 
		echo "Backup drive not mounted"
		/usr/bin/notify-send -u critical 'Backup' 'Error: backup drive not mounted'
fi
