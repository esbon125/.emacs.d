(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "PDF Tools")
     (output-html "xdg-open")))
 '(custom-enabled-themes '(tango-dark))
 '(doc-view-continuous t)
 '(line-number-mode nil)
 '(package-selected-packages
   '(esh-autosuggest eshell-did-you-mnnean eshell-syntax-highlighting eshell-toggle eshell-up eshell-vterm eshell-z vterm-toggle vterm magit company-c-headers company-auctex company dired-sidebar pdf-tools yasnippet-snippets auctex))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)
;; Auto-save when compiling
(setq TeX-save-query nil)
;;set yas-snippet-dirs
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/snippets")))
;;Adding company in global mode
(add-hook 'after-init-hook 'global-company-mode)
;;Adding company-auctex
(add-to-list 'load-path "/home/esbon1253/.emacs.d/elpa/company-auctex-20200529.1835/company-auctex.el")
(require 'company-auctex)
(company-auctex-init)

;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-latex-commands))
                      company-backends)))
(add-hook 'TeX-mode-hook 'my-latex-mode-setup)
