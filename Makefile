report.pdf: report.md bibliography.bib system.svg template.latex
	pandoc --to latex -o report.pdf --citeproc --template template.latex report.md
