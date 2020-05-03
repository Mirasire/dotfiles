(delete-selection-mode -1)
(setq ring-bell-function 'ignore)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
;;(setq c-tab-always-indent 4)
(setq c-default-style "Linux")
(setq default-tab-width 4)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("8mi" "mirasire")
                                            ("8mg" "https://github.com/Mirasire")
                                            ))

(setq make-backup-files nil)
(setq auto-save-default nil)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-default)
