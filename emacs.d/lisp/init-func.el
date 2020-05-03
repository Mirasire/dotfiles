;;define my small func

(defun hack-emacs()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun indent-all-code()
  "indent all lines"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(provide 'init-func)
