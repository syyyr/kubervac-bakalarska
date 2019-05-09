all: build/bakalarka.pdf build/prezentace.pdf

build/bakalarka.pdf: bakalarka.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib | build
	xelatex -shell-escape -output-directory=build bakalarka.tex
	/usr/bin/vendor_perl/biber -output-directory=build bakalarka.bcf
	xelatex -shell-escape -output-directory=build bakalarka.tex
	xelatex -shell-escape -output-directory=build bakalarka.tex

build/prezentace.pdf: prezentace.tex logo-cvut.pdf | build
	xelatex -shell-escape -output-directory=build prezentace.tex
	xelatex -shell-escape -output-directory=build prezentace.tex

build:
	mkdir build

clean:
	rm -rf build
