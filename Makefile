LATEXMK ?= latexmk
TEX      := cv.tex
OUTDIR   := build
PDF      := cv.pdf

.PHONY: all pdf clean distclean

all: pdf

pdf:
	mkdir -p $(OUTDIR)
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) $(TEX)
	cp $(OUTDIR)/$(PDF) $(PDF)

clean:
	$(LATEXMK) -c -outdir=$(OUTDIR) $(TEX)

distclean:
	$(LATEXMK) -C -outdir=$(OUTDIR) $(TEX)
	rm -f $(PDF)
	rm -rf $(OUTDIR)
