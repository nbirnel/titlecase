VER    = 0.2.0
PREFIX = /usr/local

PROG   = title_case
NAME   = titlecase

LIB    = lib/${PROG}.rb
BIN    = bin/${NAME}
TEST   = spec/${PROG}_spec.rb
GEM    = ${PROG}-${VER}.gem
SPEC   = ${PROG}.gemspec
MAN    = man/man1/${NAME}.1

install :: ${GEM}
	gem install ./${GEM}

install-man :: ${MAN}
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f ${MAN} ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/${NAME}.1

${GEM} :: ${LIB} ${BIN} ${SPEC}
	gem build ${SPEC}

push :: ${GEM}
	gem push $<

pdf :: ${PROG}.1
	man -t ./${MAN} > ${NAME}.ps
	ps2pdf ${NAME}.ps

clean ::
	rm -f ${NAME}.ps ${NAME}.pdf ${GEM}

test :: ${LIB} ${TEST}
	rspec --color ${TEST}

remove ::
	gem uninstall ${GEM}
	rm -f ${DESTDIR}${PREFIX}/man/man1/${NAME}.1
