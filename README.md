Latex templates for thesis writing at AVT group
===============================================

Install your favourite latex distribution (e.g. [MikTex full](https://miktex.org/) on Windows or texlive-full for linux).
You can also use [sharelatex](https://de.sharelatex.com) or [overleaf](https://www.overleaf.com/).

In `expose` you can find AVT's expose template, `expose.tex` is your main file.
Modify required information, e.g. title, author, ..

In `thesis` you can find AVT's thesis template, `main.tex` is your main file.
Also modify required information, e.g. title, author, ..

For building your pdf you can e.g. use under linux:
```
latexmk -pdf TEMPLATEFILENAME.tex
```

Useful tips
-----------

You should install some latex-GUI, e.g. [Texmaker](http://www.xm1math.net/texmaker/).
All templates include a short guide for using latex commands, a longer guide is for example [Latex](https://en.wikibooks.org/wiki/LaTeX).


First Steps
-----------
Download this repository and add all files to the repository that your supervisor created for your thesis.
Change all required information, e.g. author, course, title, thesistype, professor, advisor in your template file.


Related work
------------
Here is a short list of some search engines for related work search:

* [scholar](https://scholar.google.de/)
* [semanticscholar](https://www.semanticscholar.org/)
* [sciencegate](https://www.sciencegate.ch/)
* [CiteSeer](http://citeseerx.ist.psu.edu)
* [arxiv](http://arxiv.org/)
* [dblp](http://dblp.uni-trier.de/) : bib entries (that are somehow complete and unified)

Some engines will only provide pdf versions of papers if you are within the university network.


TODOS
-----
* add research seminar template
* add beamer template
