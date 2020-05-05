;;define my small func

(defun hack-emacs()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun indent-all-code()
  "indent all lines"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun mirasire-ansi-term ()
  (interactive)
  (ansi-term "/bin/zsh"))

(provide 'init-func)
