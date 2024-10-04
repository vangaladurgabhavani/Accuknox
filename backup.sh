#! /usr/bin/bash

# Backup the files using tar.
# tar czf /tmp/archive.tgz /tmp/files

#rsync -avzh /path/to/dir/ user@remote:/path/to/remote/dir/
#if rsync -avzh /tmp/src/ ubuntu@localhost:/tmp/dest/ ; then
if rsync -avzh /tmp/src/teating/ ubuntu@localhost:/tmp/dest/ ; then
    echo "Backup Success"
else
    echo "Backup Failed"
fi
  
#scp -i ~/.ssh/id_rsa *.derp devops@myserver:/path/to/target/directory/
