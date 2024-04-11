;; ;;itemize function 
;; (defun itemize () 
;;   "Itemizes options separated by comma or (space)."
;;   (setq lststr (string-split yas-selected-text "[,]"))
;;   (setq i 0)
;;   (setq val '())
;;   (dolist(var lststr val)
;;     (setq val (cons (concat "\\item " var) val))
;;     )
;;   )

(defun itemize ();TODO: create regexp for xor(\t,\n,,).
  "Itemizes options separated by comma or (space)."
  (setq str yas-selected-text)
  (setq str (concat "\\item " (replace-regexp-in-string "[ |\n]" "\n\\\\item " str)
		    )
	)
  )
