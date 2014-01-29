PREFIX = /usr/local

install :: titlecase titlecase.1
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f titlecase ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/titlecase
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f titlecase.1 ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/titlecase.1

pdf :: titlecase.1
	man -t ./titlecase.1 > titlecase.ps
	ps2pdf titlecase.ps

print-pdf :: titlecase.pdf
	cygstart -p titlecase.pdf

clean ::
	rm -r titlecase.ps

remove ::
	rm -f ${DESTDIR}${PREFIX}/bin/titlecase
	rm -f ${DESTDIR}${PREFIX}/man/man1/titlecase.1
