;; make tool-bar ,scroll-bar, menu-bar  unvisiable
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(set-face-attribute 'default nil :height 135) ;;set default font
(setq inhibit-splash-screen t)
(global-linum-mode 1)
;;Config for linum relative (idear from vim set run)
;;(require 'linum-relative)
;;(linum-relative-global-mode 1)

(provide 'init-ui)
