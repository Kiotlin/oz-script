# Name: mysql_backup.sh
# This Is A Shell Script For Auto Backup Database of ozlab
# author: M1 Lee
# Date: 2021/10/20
# Backup Directory
backupDir=/home/admin/backup
# Backup Timestamp
time=_` date +%Y_%m_%d_%H_%M_%S `
# Datebase Name
db_name=c0ozlab_db
# Mysql Info
#db_user=
#db_pass=
# Backup Operation
mysqldump $db_name | gzip > $backupDir/$db_name$time.sql.gz
# Delete The Backup File Which Is Generated A Week Ago
find $backupDir -name $db_name"*.sql.gz" -type f -mtime +7 -exec rm -rf {} \; > /dev/null 2>&1
