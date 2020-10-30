;;define my small func

(defun hack-emacs()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun mirasrie-open-gtd()
  (interactive)
  (dired "~/GTD"))

(defun playground()
  (interactive)
  (dired "~/playground"))

(defun tkk()
  (interactive)
  (dired "~/remote_repo/all-in-one/Study/TKK"))

(defun tkk-todo()
  (interactive)
  (dired "~/remote_repo/all-in-one/Study/TKK/编译原理-TKK/PA1"))

(defun mirasire.xyz()
  (interactive)
  (dired "~/remote_repo/Mirasire.xyz/source/_posts/"))

(defun cs143.pa()
  (interactive)
  (dired "~/Documents/CS-doc/CS143:Compilers/cool/assignments/"))

(defun csapplabs()
  (interactive)
  (dired "~/Documents/CS-doc/15213:CSAPP/LabsVersion2020.10.06"))

(defun indent-all-code()
  "indent all lines"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun mirasire-ansi-term ()
  (interactive)
  (ansi-term "/bin/zsh"))

(provide 'init-func)
