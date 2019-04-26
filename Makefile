output_dir=build
all: $(output_dir)/Sablona_BP_UTF-8.pdf

$(output_dir)/Sablona_BP_UTF-8.pdf: $(output_dir) Sablona_BP_UTF-8.tex cvut-logo-bw.pdf FITthesis.cls mybibliographyfile.bib
	xelatex -output-directory=$(output_dir) Sablona_BP_UTF-8.tex
	/usr/bin/vendor_perl/biber -output-directory=$(output_dir) Sablona_BP_UTF-8
	xelatex -output-directory=$(output_dir) Sablona_BP_UTF-8.tex
	xelatex -output-directory=$(output_dir) Sablona_BP_UTF-8.tex

$(output_dir):
	mkdir $(output_dir)

clean:
	rm -rf $(output_dir)
