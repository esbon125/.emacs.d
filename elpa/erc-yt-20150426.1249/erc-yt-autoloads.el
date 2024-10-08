;;; erc-yt-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from erc-yt.el

(autoload 'erc-yt-show-info "erc-yt" "\
Replace youtube links in erc buffers with title, description and thumbnail." t)
(eval-after-load 'erc '(define-erc-module youtube nil "Display clickable youtube thumbnails inline. " ((add-hook 'erc-insert-modify-hook 'erc-yt-show-info t) (add-hook 'erc-send-modify-hook 'erc-yt-show-info t)) ((remove-hook 'erc-insert-modify-hook 'erc-yt-show-info) (remove-hook 'erc-send-modify-hook 'erc-yt-show-info))))
(register-definition-prefixes "erc-yt" '("assoc-rec" "erc-yt-"))

;;; End of scraped data

(provide 'erc-yt-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; erc-yt-autoloads.el ends here
