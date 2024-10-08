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
 '(dired-compress-directory-default-suffix ".zip")
 '(doc-view-continuous t)
 '(graphviz-dot-auto-preview-on-save t)
 '(graphviz-dot-preview-extension "png")
 '(graphviz-dot-view-command "xdot %s")
 '(inhibit-startup-screen t)
 '(line-number-mode nil)
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   '(chruby yaml plantuml-mode adoc-mode ac-octave erc erc-colorize erc-image erc-youtube erc-yt verilog-ext tree-sitter cdlatex verilog-mode verilog-ts-mode graphviz-dot-mode esh-autosuggest eshell-did-you-mnnean eshell-syntax-highlighting eshell-toggle eshell-up eshell-vterm eshell-z vterm-toggle vterm magit company-c-headers company-auctex company dired-sidebar pdf-tools yasnippet-snippets auctex))
 '(plantuml-jar-path "/home/esbon1253/.config/plantuml/plantuml.jar")
 '(preview-auto-cache-preamble t)
 '(reftex-plug-into-AUCTeX t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((yasnippet backquote-change)))
 '(warning-suppress-types '((yasnippet backquote-change)))
 '(yas-triggers-in-field t)
 '(yas-wrap-around-region t))
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
;graphviz
;(use-package graphviz-dot-mode
;  :ensure t)

;; Hunspell

(setq-default ispell-program-name "hunspell")
(setq ispell-really-hunspell t)
;; tell ispell that apostrophes are part of words
;; and select Bristish dictionary (nil)
(setq ispell-local-dictionary-alist
      `((nil "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "es_AR") nil utf-8)

	("british" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_GB") t utf-8)
	("latin" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "la") t utf-8)
	))

;; Activar Flyspell en modo texto y modos relacionados
(add-hook 'text-mode-hook
  '(lambda () (flyspell-mode 1)))


;(dolist (hook '(text-mode-hook))
;  (add-hook hook (lambda () (flyspell-mode 1))))
;Changing from aspell to hunspell
;(setq ispell-program-name "hunspell")

; VERILOG with IcarusVerilog
(add-hook 'verilog-mode-hook
          (lambda ()
            (unless (or (file-exists-p "makefile")
                        (file-exists-p "Makefile"))
              (set (make-local-variable 'compile-command)
                   (concat "iverilog  __FILE__ -o "
                           (if buffer-file-name
                               (shell-quote-argument
                                (file-name-sans-extension buffer-file-name))))))))


;CD Latex with AUCtex
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)   ; with AUCTeX LaTeX mode

;ORG mode accept other languages
;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))
;; Enable veri kompass minor mode mode
(add-hook 'verilog-mode-hook 'veri-kompass-minor-mode)
(put 'downcase-region 'disabled nil)

;;LOAD CONFIG FILES
(load-file "~/.emacs.d/startup.el")

;;LOAD MY FUNCTIONS FILES
(load-file "~/.emacs.d/functions.el")

;;LOAD MAJOR MODES FOR FILES
(load-file "~/.emacs.d/modes.el")


;;LOAD cdlatex FILE
;(load-file "~/.emacs.d/cdlconfig.el")

;;LOAD YASNIPPET FILE
(load-file "~/.emacs.d/yasconfig.el")


;;Hooking reftex and fold-mode into LaTeX
;(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'tex-fold-mode)

;;Activating autocomplete for octave
(add-hook 'octave-mode-hook 'auto-complete-mode)
(require 'ac-octave)
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-setup)))
(put 'upcase-region 'disabled nil)

;;Configure chruby
(require 'chruby)
(chruby "jruby-1.7.2")

;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
