MAIN_TEX = main.tex
BUILD_DIR = build
PDF_OUTPUT = $(BUILD_DIR)/main.pdf

.PHONY: all build clean view

all: build

build: $(PDF_OUTPUT)

$(PDF_OUTPUT): $(MAIN_TEX)
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -shell-escape -output-directory=$(BUILD_DIR) $(MAIN_TEX)
	pdflatex -interaction=nonstopmode -shell-escape -output-directory=$(BUILD_DIR) $(MAIN_TEX)

view: build
	xdg-open $(PDF_OUTPUT) || open $(PDF_OUTPUT)

clean:
	rm -rf $(BUILD_DIR)
