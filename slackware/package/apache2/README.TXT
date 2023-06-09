22-mag-04

SLACK Installazione Apache2+ModPHP5+SSL

- apache2-2.0.50-i486-2spi.tgz
- php-apache2-5.0.0-i486-1spi.tgz
da linuxpackages.net

dependencies:
- gd-2.0.27-i486-1pcx.tgz
- zlib-1.1.4-i386-3.tgz

php.ini
- é necessario aggiungere:
extension=mysql.so
extension=imap.so
per abilitare i moduli

register_globals = on
register_long_arrays = on 
dove esistono old-style input arrays HTTP_GET_VARS



OLD
- é necessario linkare simbolicamente in /lib  ln -s libbz2.so.1.0.2 libbz2.so.1 se no php non funge
- é presente l'utility mkcert.sh per la creazione di certificati SSL, veloce ma scomoda, meglio utilizzare sign.sh

1) soddisfare dipendenze
2) intallpkg apache2-2.0.49-i486-1rob.tgz
3) intallpkg php-apache2-5.0.0RC2-i486-1rob.tgz
4) config e sign cert SSL con conf-apache2.tgz
