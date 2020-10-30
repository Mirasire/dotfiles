(delete-selection-mode -1)
(setq ring-bell-function 'ignore)
(global-auto-revert-mode nil)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq c-tab-always-indent 4)
(setq c-default-style "Linux")
(setq default-tab-width 4)
(setq tab-width 4)

(add-hook 'python-mode-hook
          (lambda ()
            (setq python-indent-offset 4)))

;;(setq indent-tabs-mode nil)
;;(setq tab-always-indent -1)

;;(abbrev-mode t)
;;(define-abbrev-table 'global-abbrev-table '(
;;					    ("8mi" "mirasire")
;;					    ("8mg" "https://github.com/Mirasire")
;;					    ))

(setq make-backup-files nil)
(setq auto-save-default nil)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;(set-default-font "Ubuntu Mono 14") ;;only for version lower than 23.1
;;(set-frame-font "source code pro 14") 
(set-frame-font "Ubuntu Mono 15")
;;(set-frame-font "Sarasa mono sc nerd 14")
;;(set-face-attribute 'width-font-face nil :font "Sarasa Mono SC Nerd 15")
;;(set-face-attribute 'default nil :height 140)
;;(set-face-attribute
;;	  'default nil :font "Ubuntu Mono 15")
;; Use variable width font faces in current buffer

(setq confirm-kill-emacs 'y-or-n-p)

;; maximized the emacs when it's run
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; set language enviroment

(provide 'init-better-default)

