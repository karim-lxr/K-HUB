#!/bin/sh
# Simple script to generate the webserver's certificate
# by Robert Stan
# --27-Jun-2002   Apache2 version <robalo@linuxpackages.net>
#
echo
echo "Select certificate to make (dummy|test|custom|existing|none):"
echo "-------------------------------------------------------------"
echo "[dummy]    - dummy self-signed Snake Oil cert"
echo "[test]     - test cert signed by Snake Oil CA"
echo "[custom]   - custom cert signed by own CA"
echo "[existing] - existing cert"
echo "[none]     - don't make certificate"
read CERT
case "$CERT" in
  dummy)
        ( cd /etc/apache2 ; sh mkcert.sh $CERT )
        ;;
  test)
        ( cd /etc/apache2 ; sh mkcert.sh $CERT )
        ;;
  custom)
        ( cd /etc/apache2 ; sh mkcert.sh $CERT )
	;;
  existing)
        echo "Where is your certificate (full path):"
	read certif
	echo "Where is your key (full path):"
	read key
        ( cd /etc/apache2 ; sh mkcert.sh $CERT $certif $key)
	;;
  none)
        exit 0
	;;
  *)
	echo "Wrong option!"
	exit 1
esac
( cd /etc/apache2/ssl.crt ; make -f Makefile.crt SSL_PROGRAM=/usr/bin/openssl >/dev/null 2>&1 )
