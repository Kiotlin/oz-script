#! bin/bash
dir=/home/admin/web
log=/home/admin/ozlab-member-sync/upload.log
# Please replace TOKEN_ID with real one in google drive url, the ruleless string behind the last '/' in the URL of the folder on Google Drive.
gupload -o $dir/* -r TOKEN_ID >> $log
