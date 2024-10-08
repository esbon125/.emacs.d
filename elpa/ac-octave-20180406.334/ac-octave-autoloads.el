;;; ac-octave-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from ac-octave.el

(autoload 'ac-define-source "auto-complete" "\
Source definition macro. It defines a complete command also." nil nil)
(ac-define-source octave '((candidates . ac-octave-candidate) (document . ac-octave-documentation) (candidate-face . ac-octave-candidate-face) (selection-face . ac-octave-selection-face) (init . ac-octave-init) (requires . 0) (cache) (symbol . "f")))
(autoload 'ac-octave-setup "ac-octave" "\
Add the Octave completion source to the front of `ac-sources'.")
(register-definition-prefixes "ac-octave" '("ac-octave-"))

;;; End of scraped data

(provide 'ac-octave-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; ac-octave-autoloads.el ends here
