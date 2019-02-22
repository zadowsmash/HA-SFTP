#!/bin/bash
sftproot="/sftpdata"
sftpin="ftpin"
sftpout="ftpout"
user1="user1"
user1sshpublic="ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
user2="user2"
user2sshpublic="ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
sftpgroup="sftpusers"

function ftpdirs () {
    if [ -d $sftproot/$sftpin ]; then
        
        echo "$sftproot/$sftpin already exists!"
        
    else
        
        mkdir $sftproot/$sftpin
        
    fi
    
    if [ -d $sftproot/$sftpout ]; then
        
        echo "$sftproot/$sftpout already exists!"
        
    else
        
        mkdir $sftproot/$sftpout
        
    fi
}

function ftpdirperms () {
    chmod 770 $sftproot
    chmod 770 $sftproot/$sftpin
    chmod 770 $sftproot/$sftpout
    groupadd -g 600 $sftpgroup
    chown root:$sftpgroup $sftproot
    chown root:$sftpgroup $sftproot/$sftpin
    chown root:$sftpgroup $sftproot/$sftpout
    chmod g+s $sftproot
    chmod g+s $sftproot/$sftpin
    chmod g+s $sftproot/$sftpout
}

function userconfig () {
    useradd -m $user1
    mkdir /home/$user1/.ssh/
    chown $user1:$user1 /home/$user1/.ssh/
    chmod 700 /home/$user1/.ssh/
    usermod -aG $sftpgroup $user1
    echo "$user1sshpublic" >>/home/$user1/.ssh/authorized_keys
    chown $user1:$user1 /home/$user1/.ssh/authorized_keys
    chmod 600 /home/$user1/.ssh/authorized_keys
    
    useradd -m $user2
    mkdir /home/$user2/.ssh/
    chown $user2:$user2 /home/$user2/.ssh/
    chmod 700 /home/$user2/.ssh/
    usermod -aG $sftpgroup $user2
    echo "$user2sshpublic" >>/home/$user2/.ssh/authorized_keys
    chown $user2:$user2 /home/$user2/.ssh/authorized_keys
    chmod 600 /home/$user2/.ssh/authorized_keys
}

function timezone () {
    ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
}


timezone
ftpdirs
ftpdirperms
userconfig