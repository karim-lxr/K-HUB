Installazione nagios
--------------------

24/25/26 lug 03
update per Slackware 08 dec 04

Overview:

1) install GD-Lib boutell

2) compilazione nagios

3) compilazione plugins

4) configurazioni base nagius e httpd.conf

5) configurazione della statusmap (grafica GD)



**********************************************************************
1)install GD-Lib boutell
-------------------------------
tutti i pacchetti sources in /usr/local/src
prefisso base:/usr/local

----------------
zlib: edit Makefile   ./configure; make test; make install
-------------------

----------------------
libpng; edit /scripts/makefile.linux (zlib and path path)
	copy /scripts/makefile.linux in sources Makfile
	make test; make install
-------------------

----------------
jpeg: ./configure; ocho CR like Dos (convert and set permission configure +makefile)
, check Makefile; make test; make install
--------------------

---------------------------------------------
freetype: ./configure  --prefix=/usr/local
	   make; make install
----------------------------------------

libgd: ./configure  (prefix default is /usr/local) ; make; make install
-------------------------
le libgd permettono la compilazione dei due binari
	-histogram.cgi
	-trends cgi
nella sbin di nagios

Variante slackware:
-------------------
gd-2.0.28-i486-2pcx.tgz
freetype2-2.1.9-i486-2zeb.tgz
sono disponibili su 'linuxpackages' e necessari anche PHP
libjpeg-6b-i386-4
libpng-1.2.7-i486-1
zlib-1.2.2-i486-1
fanno parte della distro
**************************************************************************



2) compilazione nagios

- decompressione nagius (directory orig)
 - dec plugins in directory nagius-compilazione
 - config http.conf make shure Authconfig for .htaccess and create passwd for admin and guest


./configure
 --prefix=/usr/local/nagios 
 --with-cgiurl=/cgi-bin/nagios 
 --with-htmurl=/nagios
 --with-nagios-user=nobody
 --with-nagios-grp=nogroup
 --with-gd-inc=/usr/local/include
 --with-gd-lib=/usr/local/lib 

Slackware flavour
 --with-gd-inc=/usr/include
 --with-gd-lib=/usr/lib 


make all
make install
make install-config (samples-config)
make install-init (script avvio in rc.d)




3) compilazione plugins
-----------------------------------
install plugins:
./configure 
 --prefix=/usr/local/nagios 
 --with-nagios-user=nobody
 --with-nagios-grp=nogroup 
 --with-cgiurl=/cgi-bin/nagios 
make all
make install




4) configurazioni base nagius e httpd.conf

- configurazione Aliases apache cave posizione paste!

- la /sbin dev'essere protetta da .htaccess (nagios va a cercare l'utente lì)

- configurazione /usr/local/nagios/etc/nagios.cfg
	- crea la directory /var/rw
	- crea file /var/nagios.log
	- setta tutti i files a chown utente.gruppo
	- definisci in nagios cfg i corretti utenti guest e admin

- configurazione in /usr/local/nagios/etc/tutti i cfg


5) configurazione della statusmap (grafica GD)

- le immagini vanno nella /share/images/logos
- il tag per le icone 'hostextinfo' si trova nella cgi.cfg e chiama l'esterno hostextinfo.cfg
- ottenere img di boutellGD2: <pngtogd2 image.png image.gd2 cs fmt>


