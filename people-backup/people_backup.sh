# Name: people_backup.sh
# This Is A Shell Script For Auto Backup Directory of people smbd
# author: M2 Lee
# Date: 2022/05/05
# Backup Directory
backupDir=/var/www/people
savePath=/home/admin/people-backup
# Backup Timestamp
time=`date +%Y_%m_%d_%H_%M_%S_`
# Backup Name
bname="people_smbd"
# Backup Operation
tar czvf $savePath/$time$bname.tar.gz $backupDir
# Write To Log
echo `date "+%Y %m %d %H %M %S"` File Backed up. >> backup.log
# Delete The Backup File Which Is Generated A Week Ago
find $savePath -name "*.tar.gz" -type f -mtime +7 -exec rm -rf {} \; > /dev/null 2>&1
