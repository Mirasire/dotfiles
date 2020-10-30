(global-evil-leader-mode)

(require 'evil)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)
(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "oo" 'org-open-at-point
  "ot" 'org-todo
  "oi" 'org-todo
  "oa" 'org-agenda
  "or" 'org-capture
  "oc" 'org-capture
  "os" 'org-schedule
  "od" 'org-deadline
  "om" 'org-meta-return
  "o'" 'org-edit-special
  "da" 'org-date-from-calendar
  "ff" 'counsel-find-file
  "fr" 'recentf-open-files
  "fs" 'save-buffer
  "qu" 'evil-mode
  "qq" 'save-buffers-kill-terminal
  "jl" 'avy-goto-line
  "jj" 'ace-pinyin-jump-char
  "jJ" 'ace-pinyin-jump-char-2
  "re" 'recentf-open-files
  "w/" 'split-window-right
  "w-" 'split-window-below
  "te" 'eshell
  "tt" 'neotree-toggle
  "hk" 'describe-key
  "\C-s" 'save-buffer
  "k"  'kill-buffer-and-window
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "4"  'select-window-4
  "TAB" 'counsel-switch-buffer)


(add-hook 'evil-loval-mode 'evil-escape-mode)
(add-hook 'evil-local-mode-hook 'evil-escape-mode)
(add-hook 'c-mode-common-hook 'evil-mode)
(add-hook 'emacs-lisp-mode-hook 'evil-mode)

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "G") 'end-of-buffer)
  (define-key evil-normal-state-map (kbd "gg") 'beginning-of-buffer)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line))

;;emacs terminal let tab be <tab>
(evil-define-key 'motion org-mode-map (kbd "TAB")
  '(menu-item "org-cycle-maybe" nil
              :filter (lambda (&optional _)
                        (when (and (not (display-graphic-p))
                                   (or (org-at-heading-or-item-p)
                                       (org-at-table-p)
                                       (org-at-block-p)))
                          #'org-cycle))))

(provide 'init-evil)
