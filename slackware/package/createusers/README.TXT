26-mag-04

SLACKWARE GESTIONE UTENTI
-------------------------

dependencies:
-TKL expect

- modificare la skel opportunamente, default vuota
- in /etc/shells é necessario aggiungere /bin/false
- creato pacchetto slack createusers-1.3.3-i686-tj.tgz

README
------
TJ ADDED 20040526

- disbled original feature creation group
- disabled in createusers.conf db pg-mysql create account 
- in createusers.conf default shell /bin/false
- /users.sample in this same directory

Createusers adds and removes Linux user accounts in bulk. Each new user 
can be given some or all of the following facilities:

- Login account and home directory
- Shell access to the system
- Personal web space through the Apache web server
- Personal MySQL database on a local or remote MySQL server
- Personal PostgreSQL database on a local or remote PostgreSQL server
- Samba file sharing account on the local Samba server
- Disk quota via the Linux quota system.

Phil Jones
Linux for Schools Project
http://www.lfsp.org/


listfiles:
  -->  /etc/createusers.conf,	file di configurazione
  -->  /usr/doc/createusers-1.3.3/README
  -->  /usr/doc/createusers-1.3.3/names.sample, sample passgen
  -->  /usr/doc/createusers-1.3.3/users.sample, sample createusers
  -->  /usr/local/lib/createusers/checks
  -->  /usr/local/lib/createusers/linecount.pl
  -->  /usr/local/lib/createusers/verify_createusers_input.pl
  -->  /usr/local/lib/createusers/verify_removeusers_input.pl
  -->  /usr/man/man1/autopasswd.1.gz
  -->  /usr/man/man1/createusers.1.gz
  -->  /usr/man/man1/passgen.1.gz
  -->  /usr/man/man1/removeusers.1.gz
  -->  /usr/man/man1/updateuserpasswd.1.gz
  -->  /usr/sbin/autopasswd cambia password non interattivamente
  -->  /usr/sbin/createusers, binario creautenti liasta
  -->  /usr/sbin/createusers_GUI X dialog per selezionare file input
  -->  /usr/sbin/passgen, binario crea utenti unix con pw random
  -->  /usr/sbin/removeusers, binario removeutenti lista
  -->  /usr/sbin/updateuserpasswd, aggiorna non interattivamente pw unix e samba
 