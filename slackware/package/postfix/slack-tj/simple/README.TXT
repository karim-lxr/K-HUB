MAY 2004

postfix standalone binari Slackware da http://www.postfix.org
------------------------------------------------------------

package creato:
postfix-2.1.1-i686-1s.tgz

[pacchetto]-versione-platform-build+s(imple)

minima configurazione funzionante:
- myhostname, mydomayn, pos. document. creati da instllazione su main.cf
- settare inet_interfaces=$myhostname

installazione:
- rimuovere eventuale sendmail removepkg in /var/adm/package, /etc/aliases e db rimane
- installpkg postfix-2.1.1-i686-1s.tgz
- modificare main.cf
- copiare, se non esistente, per compatibilità /etc/postfix/aliases in /etc/aliases
  con root:	nome_user per forwardare la posta di root
- dare cmd  newaliases senza parametri per fare il build del db
- dare chmod 755 a /etc/rc.d/rc.postfix
- é necessario anche riportare le suguenti righe in /etc/rc.d/rc.inet2 per garantire l'avvio di postfix

  # Starting POSTFIX mta
	if [-x /etc/rc.d/rc.postfix]; then
		/etc/rc.d/rc.postfix start
	fi



CREAZIONE PACCHETTO
-------------------

compilazione:
- In /usr/local/src/ decomprimere tarball sorgente, cd postfix-2.11
- creare sub directory es. new per ricreare l'albero di /
- non essendoci configure, dare il make con prefisso per il nuovo albero

make prefix=/usr/local/src/postfix-2.1.1/new

make install

che é interattivo, dare il path della root nella nuova arborescenza: /usr/local/src/postfix-2.1.1/new
e completare quello della doc che di default non viene installata /usr/doc/(html) (README_FILES)

Creare nella new la directory install che deve contenere  il testo descrittivo slack-desc e l'installer doinst.sh opportuno

Copiare e correggere opportunamente lo script di init /etc/rc.d/rc.postfix nella new


creazione:
makepkg pacchetto-versione-platform-build+s(imple) .tgz, interattivo, 
mantenere i link simbolici, settare y i permessi di root

