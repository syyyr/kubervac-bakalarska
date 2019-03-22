output_dir=build
all: $(output_dir)/Sablona_BP_UTF-8.pdf

$(output_dir)/Sablona_BP_UTF-8.pdf: $(output_dir) Sablona_BP_UTF-8.tex cvut-logo-bw.pdf  FITthesis.cls
	xelatex -output-directory=$(output_dir) Sablona_BP_UTF-8.tex

$(output_dir):
	mkdir $(output_dir)

clean:
	rm -rf $(output_dir)
