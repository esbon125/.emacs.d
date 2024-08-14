;; Unbinding tab for CDLatex
;;Redefining my yas expand binding
(define-key cdlatex-mode-map (kbd "<tab>") nil)
(define-key cdlatex-mode-map (kbd "TAB") nil)
;(eval-after-load 'cdlatex '(define-key cdlatex-mode-map "\tab" nil))
