all: build/bakalarka.pdf build/prezentace.pdf

build/bakalarka.pdf: bakalarka.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib | build
	@echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."
	@xelatex -shell-escape -output-directory=build bakalarka.tex > /dev/null
	@echo " done."
	@echo -n "/usr/bin/vendor_perl/biber -output-directory=build bakalarka.bcf..."
	@/usr/bin/vendor_perl/biber -output-directory=build bakalarka.bcf > /dev/null
	@echo " done."
	@echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."
	@if xelatex -shell-escape -output-directory=build bakalarka.tex | grep "rerun LaTeX" > /dev/null; then \
	    echo " done."; \
	    echo -n "xelatex -shell-escape -output-directory=build bakalarka.tex..."; \
	    xelatex -shell-escape -output-directory=build bakalarka.tex > /dev/null; \
	fi
	@echo " done."


build/prezentace.pdf: prezentace.tex logo-cvut.pdf | build
	@echo -n "xelatex -shell-escape -output-directory=build prezentace.tex..."
	@xelatex -shell-escape -output-directory=build prezentace.tex > /dev/null
	@echo " done."
	@echo -n "xelatex -shell-escape -output-directory=build prezentace.tex..."
	@xelatex -shell-escape -output-directory=build prezentace.tex > /dev/null
	@echo " done."

build:
	mkdir build

clean:
	rm -rf build
