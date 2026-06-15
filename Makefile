LATEXMK := latexmk
LATEXMK_FLAGS := -xelatex -file-line-error -interaction=nonstopmode -halt-on-error
TEXINPUTS_VALUE := .:my-template//:
BUILD_DIR := build
OUTPUT_DIR := output

TEMPLATE_SRC := my-template/template-preview.tex
EXP3_SRC := exp3/exp3.tex
EXP4_SRC := exp4/exp4.tex
EXP5_SRC := exp5/exp5.tex
EXP6_SRC := exp6/exp6.tex
EXP4_PRINCIPLE_IMAGES := \
	exp4/assets/principle-rlc-overdamped.png \
	exp4/assets/principle-rlc-underdamped.png \
	exp4/assets/principle-rlc-critical.png \
	exp4/assets/principle-rlc-damping-comparison.png
EXP4_DATA_IMAGES := $(shell find exp4/data -type f -name '*.jpg' | sort | sed 's/ /\\ /g')

.PHONY: all template exp3 exp4 exp5 exp6 clean

all: template exp3 exp4 exp5 exp6

template: $(OUTPUT_DIR)/template-preview.pdf

exp3: $(OUTPUT_DIR)/exp3.pdf

exp4: $(OUTPUT_DIR)/exp4.pdf

exp5: $(OUTPUT_DIR)/exp5.pdf

exp6: $(OUTPUT_DIR)/exp6.pdf

$(OUTPUT_DIR)/template-preview.pdf: $(TEMPLATE_SRC) my-template/eleclab-report.cls my-template/eleclab-fonts.sty
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) -jobname=template-preview $(TEMPLATE_SRC)
	cp $(BUILD_DIR)/template-preview.pdf $@

$(OUTPUT_DIR)/exp3.pdf: $(EXP3_SRC) my-template/eleclab-report.cls my-template/eleclab-fonts.sty
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) -jobname=exp3 $(EXP3_SRC)
	cp $(BUILD_DIR)/exp3.pdf $@

$(OUTPUT_DIR)/exp4.pdf: $(EXP4_SRC) $(EXP4_PRINCIPLE_IMAGES) $(EXP4_DATA_IMAGES) my-template/eleclab-report.cls my-template/eleclab-fonts.sty
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) -jobname=exp4 $(EXP4_SRC)
	cp $(BUILD_DIR)/exp4.pdf $@

$(OUTPUT_DIR)/exp5.pdf: $(EXP5_SRC) my-template/eleclab-report.cls my-template/eleclab-fonts.sty
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) -jobname=exp5 $(EXP5_SRC)
	cp $(BUILD_DIR)/exp5.pdf $@

$(OUTPUT_DIR)/exp6.pdf: $(EXP6_SRC) my-template/eleclab-report.cls my-template/eleclab-fonts.sty
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) $(LATEXMK_FLAGS) -outdir=$(BUILD_DIR) -jobname=exp6 $(EXP6_SRC)
	cp $(BUILD_DIR)/exp6.pdf $@

clean:
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) -C -outdir=$(BUILD_DIR) $(TEMPLATE_SRC)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) -C -outdir=$(BUILD_DIR) $(EXP3_SRC)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) -C -outdir=$(BUILD_DIR) $(EXP4_SRC)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) -C -outdir=$(BUILD_DIR) $(EXP5_SRC)
	TEXINPUTS='$(TEXINPUTS_VALUE)' $(LATEXMK) -C -outdir=$(BUILD_DIR) $(EXP6_SRC)
