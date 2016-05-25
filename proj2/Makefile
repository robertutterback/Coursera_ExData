DEPS = $(wildcard *.R)

default: report.pdf

%.pdf: %.md .fake
	pandoc $< -o $@

.fake: $(DEPS)
	./all.R
