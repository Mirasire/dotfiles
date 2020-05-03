(global-set-key (kbd "<f2>") 'hack-emacs) ;; <F2> = open my init.el files
(global-set-key (kbd "C-x C-r") 'recentf-open-files) ;; C-x C-r open recent open recent file menu
(global-set-key (kbd "C-x gg=G") 'indent-all-code) ;;indent all code quickly idear from vim
(global-set-key (kbd "s-q") 'evil-local-mode) ;;close evil mode quickly
(global-set-key (kbd "C-w") 'backward-kill-word) ;;backward kill a work 

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)

(provide 'init-keybindings)
