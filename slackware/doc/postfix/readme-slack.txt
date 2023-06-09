Sostituzione Sendmail con Postfix
---------------------------------


package necessari:

librerie sasl da compilare manualmente, richieste come dipendenza permettono il supporto a postfix di autenticazione e cifratura 
cyrus-sasl-2.1.18.tar.gz
http://asg.web.cmu.edu/cyrus/download/

postfix, postfix-2.1.1-i686-2.tgz, di Nelson Mok da http://www.linuxpackages.net  dipende anche da libmysqlclient incluse in mysql


installazione

rimuovi sendmail: /etc/rc.d/rc.sendmail stop
/var/adm/package  removepkg sendmail-n.n.n-1 e sendmail-cf.n.n-1 

- installa mysql installpkg mysql-4.0.18-i486-1

- compila sasl:
	tar -zxvf cyrus-sasl-2.1.18.tar.gz in /usr/local/src

- configure necessario a consentire diversi tipi di accesso, compreso plain text
	
		./configure --prefix=/usr/local \
				   --enable-krb4=no \
				--enable-gssapi=yes \
			  	 --enable-digest=no \
			 	  --enable-cram=no \
				--enable-plain=yes \
				--enable-login=yes \
				--with-plugindir=/usr/local/lib/sasl

make ,  make install

effettuare se richiesto da applicativi link simbolici delle librerie in /usr/local/lib ln -s <sorg> <dest> di sasl2

-  effettuare installpkg postfix-2.1.1-i686-2.tgz
   preconfigurazione in /etc/postfix/main.cf myhostname e mydomain myorigin inet_interfaces mydestination

  crea aliases in /etc/postix/aliases e attiva modifiche con /usr/bin/newaliases.posfix

- esegui postfix check

postfix start | stop



POSTFIX COMPILATO
------------------------------------

Problema:
Compilando postfix per il supporto autenticazione con le librerie SASL, la compilazione si schianta riportando 
l'impossibilità di continuare perchè mancano dei parametri.

Causa:
Ho bisogno di abilitare il supporto di SASL2 all'interno del codice, in quanto il sistema che uso per 
l'autenticazione degli utenti è basato su SASL2.

Soluzione:
La documentazione di Postfix indica come compilare Postfix con supporto SASL. 
Però questo non va bene se si desidera usare SASL2. Per quanto banale sia la soluzione, eccola qua. 
Mi sono creato un file che mi compila automaticamente Postfix con il supporto LDAP e SASL2: 

make makefiles CCARGS="-I/usr/local/include -DUSE_SASL_AUTH -DHAS_LDAP -I/usr/local/cyrus-sasl/include"
 AUXLIBS="-L/usr/local/lib -lldap -L/usr/local/lib -llber -lsasl2 -L/usr/local/cyrus-sasl/lib"


altro sugg

make makefiles 'CCARGS=-DHAS_MYSQL \ 
-I/usr/local/mysql/include/mysql -DUSE_SASL_AUTH \
 -I/usr/local/include/sasl -I/usr/local/bdb/include' \ 
'AUXLIBS=-L/usr/local/mysql/lib/mysql \ 
-lmysqlclient -lz -lm -L/usr/local/lib -lsasl2 -L/usr/local/bdb/lib' 

make make install


Inoltre, le distribuzioni 1.1.x di Postfix non supportano SASL2, è necessario per forza scaricare una snapshot della versione.



