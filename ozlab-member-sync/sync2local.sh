#! /bin/bash
# SYNC THE FILES ON GOOGLE DRIVE TO LOCAL
# Folder Dir
dir=/home/admin/web
# Replace DOMAIN with real domain of our lab.
member=member.DOMAIN
# Log Dir
log=/home/admin/ozlab-member-sync/sync.log
# Synchronous Date
time=$(date "+%Y.%m.%d %H:%M:%S")
# System Service Name
service=member-ozlab
# Google Drive ID
# Please replace DRIVE_ID with real Google Drive ID, which is a ruleless string behind the last '/' in the URL of the folder on Google Drive.
id=DRIVE_ID
# Synchronisation
[[ $dir ]] && cd $dir && gdl -o $id >> $log

if [[ $dir/$member ]]; then
        echo \[$time\] 'dl success.' >> $log && {
                chmod -R 755 $dir/$member
                chgrp -R root $dir/$member
                chown -R root $dir/$member
        }
        mv -f $dir/$member/* $dir/ >> $log && echo 'Overwrite files successfully.' >> $log
        if [ "$(ls -A $dir/$member)"="" ]; then
                rm -d $dir/$member >> $log && echo 'Remove empty directory successfully.' >> $log
        else
                echo 'The directory is not empty. Remove operation fail. Please check again.' >> $log
        fi
        echo 'Sync operation ended.' >> $log
        exit 1
else
        echo $member 'does not exist.' >> $log
fi
echo '-------------------------------------------------' >> $log
