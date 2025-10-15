report.pdf: report.md bibliography.bib system.svg template.latex
	pandoc --to latex -o report.pdf -V colorlinks=true -V linkcolor=blue --citeproc -M reference-section-title=References --template template.latex report.md
