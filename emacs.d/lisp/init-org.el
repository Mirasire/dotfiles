;;org-mode
(setq org-agenda-files '("~/GTD"))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

;;for org mode
(require 'org)

(add-hook 'org-mode-hook (lambda() (setq truncate-lines nil)))
(set-face-attribute 'default nil :height 135) ;;set default font

(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'width-font-face)
    (set-face-attribute 'width-font-face nil :font "等距更纱黑体 SC 15")
    (setq buffer-face-mode-face 'width-font-face)
    (buffer-face-mode))

  (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))

(setq org-src-fontify-natively 1) ;;make syntax high light for org mode
(setq org-image-actual-width (/ (display-pixel-width) 3))
;; -- Display images in org mode
;; enable image mode first
(iimage-mode t)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]")  1))
;;  add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (turn-on-iimage-mode)
  (set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
  (call-interactively 'iimage-mode))

(add-hook 'org-mode-hook 'evil-local-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   ))

(setq org-default-notes-file '("~/GTD/capture/tmp.org"))
 (setq org-capture-templates
      '( 
        ("i" "收集箱 - 捕获需要的资料" checkitem (file+headline "~/GTD/capture/inbox.org" "收集箱 -- @Inbox")
	 "- [ ] %?\n"
         :empty-lines 1)
        ("r" "参考资料" entry (file+headline "~/GTD/capture/refrence.org" "参考资料 -- @Refrence")
	 "* %i %?\n"
         :empty-lines 1)
        ("w" "等待清单 - 不需要我做" entry (file+headline "~/GTD/capture/waitng.org" "等待清单 -- @Waiting")
	 "* WAITING %i %?\n"
         :empty-lines 1)
        ("c" "执行清单 - 我做" entry (file+headline "~/GTD/capture/context.org" "执行清单 -- @Context")
	 "* CONTEXT %i %?\n"
         :empty-lines 1)
        ("t" "TO-DO - 安排时间" entry (file+headline "~/GTD/capture/todo.org" "TODO清单 -- @TODO")
	 "* TODO %i %?\n"
         :empty-lines 1)
        ("e" "英语 - 生词收集" table-line (file "~/GTD/capture/eng.org")
	 " | %^{单词} | %^{词性} | %^{翻译}| %u |")
       )) 




;;  *回收箱(Trash)*
;;  *可能清单(Someday/Maybe)*
;;/  *参考资料(Refrence)*
;;  *项目清单("Plan project" task)*
;;/  *等待清单("Waiting for" task)*
;;/  *执行清单("@Context" task)*
;;  *日历/相关应用*

(global-set-key (kbd "C-c r") 'org-capture)

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords '((sequence "WAITING(w)" "CONTEXT(c)" "|" "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))
(setq org-todo-keyword-faces '(
                               ("CONTEXT" . "#CC3333")
                               ("WAITING" . "#996699")
                               ("TODO" . "#CC0033")
                               ("DOING" . "#FFCC33")
                               ("DONE" . "#99CC33")
                               ("ABORT" . "#999999")
                               ))

;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;(setq org-bullets-bullet-list '("!" "#" "+" "-"))

(provide 'init-org)
