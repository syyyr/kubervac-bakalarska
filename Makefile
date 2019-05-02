output_dir=build
all: $(output_dir)/bakalarka.pdf

$(output_dir)/bakalarka.pdf: $(output_dir) bakalarka.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib
	xelatex -output-directory=$(output_dir) bakalarka.tex
	/usr/bin/vendor_perl/biber -output-directory=$(output_dir) bakalarka
	xelatex -output-directory=$(output_dir) bakalarka.tex
	xelatex -output-directory=$(output_dir) bakalarka.tex

$(output_dir):
	mkdir $(output_dir)

clean:
	rm -rf $(output_dir)
