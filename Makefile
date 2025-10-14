report.pdf: report.md bibliography.bib system.svg template.latex
	pandoc --to latex -o report.pdf -V colorlinks=true -V linkcolor=blue --citeproc --template template.latex report.md
