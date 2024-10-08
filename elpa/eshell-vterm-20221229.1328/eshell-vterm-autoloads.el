;;; eshell-vterm-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "eshell-vterm" "eshell-vterm.el" (0 0 0 0))
;;; Generated autoloads from eshell-vterm.el

(defvar eshell-vterm-mode nil "\
Non-nil if Eshell-Vterm mode is enabled.
See the `eshell-vterm-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `eshell-vterm-mode'.")

(custom-autoload 'eshell-vterm-mode "eshell-vterm" nil)

(autoload 'eshell-vterm-mode "eshell-vterm" "\
Use Vterm for eshell visual commands.

This is a minor mode.  If called interactively, toggle the
`Eshell-Vterm mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='eshell-vterm-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "eshell-vterm" '("eshell-vterm-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; eshell-vterm-autoloads.el ends here
