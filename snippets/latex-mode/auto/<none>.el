(TeX-add-style-hook
 "<none>"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "options")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "fancyhdr"))
 :latex)

