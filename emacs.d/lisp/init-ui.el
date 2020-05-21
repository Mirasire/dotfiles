;; make tool-bar ,scroll-bar, menu-bar  unvisiable
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(setq inhibit-splash-screen t)
(global-display-line-numbers-mode t)
(load-theme 'gruvbox 1)

;;ranbow the brackets
(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-ui)
