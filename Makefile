PREFIX = /usr/local
PROG = title_case
SPEC = spec/${PROG}_spec.rb
LIB  = lib/${PROG}.rb

install :: ${PROG} ${PROG}.1
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ${PROG} ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/${PROG}
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f ${PROG}.1 ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/${PROG}.1

pdf :: ${PROG}.1
	man -t ./${PROG}.1 > ${PROG}.ps
	ps2pdf ${PROG}.ps

clean ::
	rm -f ${PROG}.ps ${PROG} ${PROG}.pdf

test :: ${LIB} ${SPEC}
	rspec --color ${SPEC}

remove ::
	rm -f ${DESTDIR}${PREFIX}/bin/${PROG}
	rm -f ${DESTDIR}${PREFIX}/man/man1/${PROG}.1
