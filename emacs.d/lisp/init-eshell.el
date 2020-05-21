;;for eshell

(add-hook 'eshell-mode-hook 'evil-disabled-buffer-p)

(add-hook 'eshell-mode-hook '(lambda ()
                               (local-set-key (kbd "C-p") 'eshell-previous-input)
                               (local-set-key (kbd "C-n") 'eshell-next-input)
                               (local-set-key (kbd "C-a") 'eshell-bol)
                               ))

(provide 'init-eshell)
