LATEXMK ?= latexmk
TEX      := cv.tex
OUTDIR   := build
PDF      := $(OUTDIR)/cv.pdf

.PHONY: all pdf clean distclean

all: pdf

pdf: $(PDF)

$(PDF): $(TEX)
	mkdir -p $(OUTDIR)
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=$(OUTDIR) $(TEX)

clean:
	$(LATEXMK) -c -outdir=$(OUTDIR) $(TEX)

distclean:
	$(LATEXMK) -C -outdir=$(OUTDIR) $(TEX)
	rm -rf $(OUTDIR)
