all: build/bakalarka.pdf build/prezentace.pdf

ifeq ($(DEBUG),y)
    redir=
else
    redir= < /dev/null > /dev/null
endif

build/bakalarka.pdf: bakalarka.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib | build
	@echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."
	@xelatex -shell-escape -output-directory=build bakalarka.tex $(redir)
	@echo " done."
	@echo -n "/usr/bin/vendor_perl/biber -output-directory=build bakalarka.bcf..."
	@/usr/bin/vendor_perl/biber -output-directory=build bakalarka.bcf $(redir)
	@echo " done."
	@echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."
ifeq ($(DEBUG),y)
	@xelatex -shell-escape -output-directory=build bakalarka.tex $(redir)
	@echo " done."
	@xelatex -shell-escape -output-directory=build bakalarka.tex $(redir)
	@echo " done."
else
	@if xelatex -shell-escape -output-directory=build bakalarka.tex | grep "rerun LaTeX" > /dev/null; then \
	    echo " done."; \
	    echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."; \
	    xelatex -shell-escape -output-directory=build bakalarka.tex $(redir); \
	    fi
	@echo " done."
endif


build/prezentace.pdf: prezentace.tex logo-cvut.pdf | build
	@echo -n "xelatex -shell-escape -output-directory=build prezentace.tex..."
	@xelatex -shell-escape -output-directory=build prezentace.tex $(redir)
	@echo " done."
	@echo -n "xelatex -shell-escape -output-directory=build prezentace.tex..."
	@xelatex -shell-escape -output-directory=build prezentace.tex $(redir)
	@echo " done."

build:
	mkdir build

clean:
	rm -rf build
