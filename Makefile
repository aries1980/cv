all: html pdf docx txt

html: janos_feher_cv.md style.css
		pandoc --standalone -c style.css --from markdown --to html -o janos_feher_cv.html janos_feher_cv.md

pdf: html
		/usr/local/apps/wkhtmltox/bin/wkhtmltopdf --enable-external-links janos_feher_cv.html janos_feher_cv.pdf

docx: janos_feher_cv.md
		pandoc --from markdown --to docx -o janos_feher_cv.docx janos_feher_cv.md

txt: janos_feher_cv.md
		pandoc --standalone --smart --from markdown --to plain -o janos_feher_cv.txt janos_feher_cv.md

clean:
		rm -f *.html *.pdf *.docx *.txt
