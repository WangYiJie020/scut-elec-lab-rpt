# AGENTS Notes

## Project Purpose

This repository contains a XeLaTeX template that reproduces the formatting of `ref-template/电路实验报告册2026-实验三-六.docx`, plus a concrete sample for experiment 3 in `exp3/`.

## Build Workflow

- Build with `make`.
- Final PDFs go to `output/`.
- Intermediate files go to `build/`.
- Current targets:
  - `make template`
  - `make exp3`
  - `make`
  - `make clean`
- The build uses `latexmk` with `xelatex`.

## Important Files

- `Makefile`
  - Central build entrypoint.
- `my-template/eleclab-report.cls`
  - Main class file.
  - Owns page geometry, section/title macros, table macros, placeholder blocks, and the left-side binding dashed line.
- `my-template/eleclab-fonts.sty`
  - Centralized font mapping.
  - Change this file first if the environment font set changes.
- `my-template/template-preview.tex`
  - Minimal preview document for template smoke testing.
- `exp3/exp3.tex`
  - Experiment 3 sample document using the template.

## Current Font Assumptions

- Chinese body font: `SimSun`
- Chinese heading font: `SimHei`
- Latin serif font: `Liberation Serif`
- Latin sans font: `DejaVu Sans`
- Latin mono font: `DejaVu Sans Mono`

These were chosen to match the current local environment. If `SimSun`/`SimHei` disappear or are replaced, update `my-template/eleclab-fonts.sty`.

## Layout / Formatting Facts

- Paper size: A4 portrait.
- Margins approximate the reference docx:
  - top/bottom `2.54cm`
  - left `3.00cm`
  - right `2.00cm`
- The left dashed binding line is drawn in `shipout/background` inside `my-template/eleclab-report.cls`.
- The current dash pattern is an approximation of Word `dotDash`, not a literal Word renderer output.
- Header/footer are intentionally empty, matching the reference document’s effective layout.

## Content Scope

- The current implementation focuses on:
  - page layout
  - title styles
  - paragraph spacing
  - section numbering
  - header information table
  - experiment data tables
  - left binding dashed line
- Experiment 3 reproduces structure and blank areas from the reference.
- Circuit-diagram areas are intentionally blank placeholders; the embedded Word/WPS vector drawings were not redrawn.

## Known Limitations

- The template does not reproduce the original embedded circuit graphics.
- Some table layouts still produce minor LaTeX box warnings (`Underfull` and a very small `Overfull` around one table row). These do not currently block PDF generation.
- The sample document’s pagination is close to the reference but not guaranteed pixel-identical because XeLaTeX and Word use different layout engines.

## Editing Guidance

- If the goal is closer visual matching, change sizes/spacing/macros in `my-template/eleclab-report.cls`, not in `exp3/exp3.tex`.
- If fonts need adjustment, change only `my-template/eleclab-fonts.sty` first.
- Keep `exp3/exp3.tex` focused on content and macro calls; avoid hardcoding layout there unless the class API is missing a needed abstraction.

## Verification

- Last known successful build:
  - `make exp3 template`
- Expected outputs:
  - `output/exp3.pdf`
  - `output/template-preview.pdf`
