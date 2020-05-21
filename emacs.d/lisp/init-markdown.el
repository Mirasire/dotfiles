;;Config for markdown mode
(setq markdown-command "pandoc")

;; Make a keybinding: `C-c C-c g'
(require 'markdown-mode)
(define-key markdown-mode-command-map (kbd "g") 'grip-mode)

(add-hook 'markdown-mode-hook 'poly-markdown-mode)
(add-hook 'markdown-mode-hook 'auto-save-mode)

(provide 'init-markdown)
