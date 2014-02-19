VER    = 0.1.1
PREFIX = /usr/local

PROG   = title_case
NAME   = titlecase

LIB    = lib/${PROG}.rb
BIN    = bin/${NAME}
TEST   = spec/${PROG}_spec.rb
GEM    = ${PROG}-${VER}.gem
SPEC   = ${PROG}.gemspec

install :: ${GEM}
	gem install ./${GEM}

install-man :: ${NAME}.1
	mkdir -p ${DESTDIR}${PREFIX}/man/man1
	cp -f ${NAME}.1 ${DESTDIR}${PREFIX}/man/man1
	chmod 644 ${DESTDIR}${PREFIX}/man/man1/${NAME}.1

${GEM} :: ${LIB} ${BIN} ${SPEC}
	gem build ${SPEC}

push :: ${GEM}
	gem push $<

pdf :: ${PROG}.1
	man -t ./${NAME}.1 > ${NAME}.ps
	ps2pdf ${NAME}.ps

clean ::
	rm -f ${NAME}.ps ${NAME}.pdf ${GEM}

test :: ${LIB} ${TEST}
	rspec --color ${TEST}

remove ::
	gem uninstall ${GEM}
	rm -f ${DESTDIR}${PREFIX}/man/man1/${NAME}.1
