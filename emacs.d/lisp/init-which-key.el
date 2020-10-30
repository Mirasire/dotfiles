;; Thaks to --> https://github.com/justbur/emacs-which-key#introduction

;; Allow C-h to trigger which-key before it is done automatically
;;(setq which-key-show-early-on-C-h t)

;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.

(setq which-key-idle-delay 0.33)
(setq which-key-idle-secondary-delay 0.25)

(which-key-setup-side-window-bottom)
(which-key-mode)

(setq which-key-popup-type 'side-window)

(provide 'init-which-key)
