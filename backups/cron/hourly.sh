sudo /usr/bin/rsnapshot hourly 

sudo chown -R thomas:thomas /mnt/backups

if [ $? -eq 0 ]; then
  /usr/bin/notify-send 'Backup' 'Hourly backup completed successfully'
else 
  /usr/bin/notify-send 'Backup' 'Hourly backup failed'
fi
