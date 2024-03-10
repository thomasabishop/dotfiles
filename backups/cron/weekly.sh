sudo /usr/bin/rsnapshot weekly

sudo chown -R thomas:thomas /mnt/backups

if [ $? -eq 0 ]; then
  /usr/bin/notify-send 'Backup' 'Weekly backup completed successfully'
else 
  /usr/bin/notify-send 'Backup' 'Weekly backup failed'
fi
