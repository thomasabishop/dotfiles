sudo /usr/bin/rsnapshot daily

sudo chown -R thomas:thomas /mnt/backups

if [ $? -eq 0 ]; then
  /usr/bin/notify-send 'Backup' 'Daily backup completed successfully'
else 
  /usr/bin/notify-send 'Backup' 'Daily backup failed'
fi
