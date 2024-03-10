sudo /usr/bin/rsnapshot monthly 

sudo chown -R thomas:thomas /mnt/backups

if [ $? -eq 0 ]; then
  /usr/bin/notify-send 'Backup' 'Monthly backup completed successfully'
else 
  /usr/bin/notify-send 'Backup' 'Monthly backup failed'
fi
