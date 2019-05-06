output_dir=build
all: $(output_dir)/bakalarka.pdf $(output_dir)/prezentace.pdf

$(output_dir)/bakalarka.pdf: bakalarka.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib | $(output_dir)
	xelatex -shell-escape -output-directory=$(output_dir) bakalarka.tex
	/usr/bin/vendor_perl/biber -output-directory=$(output_dir) bakalarka
	xelatex -shell-escape -output-directory=$(output_dir) bakalarka.tex
	xelatex -shell-escape -output-directory=$(output_dir) bakalarka.tex

$(output_dir)/prezentace.pdf: prezentace.tex logo-cvut.pdf | $(output_dir)
	xelatex -shell-escape -output-directory=$(output_dir) prezentace.tex
	xelatex -shell-escape -output-directory=$(output_dir) prezentace.tex

$(output_dir):
	mkdir $(output_dir)

clean:
	rm -rf $(output_dir)
