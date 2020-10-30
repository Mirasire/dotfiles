;;org-mode
(setq org-agenda-files '("~/GTD/capture/"))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

;; set python version 3.8 for emacs
(setq org-babel-python-command "python3")

;;for org mode
(require 'org)

;;todo->done add CLOSED TIME
(setq org-log-done 'time)
;; (add-hook 'org-mode-hook (lambda() (setq truncate-lines nil)))

(with-eval-after-load 'org
  (defun org-buffer-face-mode-variable ()
    (interactive)
    (make-face 'width-font-face)
    (set-face-attribute 'width-font-face nil :font "Sarasa Mono SC Nerd 15")
    (setq buffer-face-mode-face 'width-font-face)
    (buffer-face-mode))

  (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))

;; -- Display images in org mode
;; enable image mode first
(setq org-image-actual-width (/ (display-pixel-width) 3))
(setq org-image-actual-width nil)
;;(setq org-image-actual-width '(300))
;;(iimage-mode t)
;;(setq iimage-mode -1)
;;;; add the org file link format to the iimage mode regex
;;(add-to-list 'iimage-mode-image-regex-alist
;;             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]")  1))
;;;;  add a hook so we can display images on load
;;(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;;;; function to setup images for display on load
;;(defun org-turn-on-iimage-in-org ()
;;  "display images in your org file"
;;  (interactive)
;;  (turn-on-iimage-mode)
;;  (set-face-underline-p 'org-link nil))
;;;; function to toggle images in a org bugger
;;(defun org-toggle-iimage-in-org ()
;;  "display images in your org file"
;;  (interactive)
;;  (if (face-underline-p 'org-link)
;;      (set-face-underline-p 'org-link nil)
;;    (set-face-underline-p 'org-link t))
;;  (call-interactively 'iimage-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (python . t)
   (shell . t)
   (C . t) ;; gives acess to c and c++
   ))

(setq org-default-notes-file '("~/GTD/capture/tmp.org"))
(setq org-capture-templates
      '( 
        ("i" "收集箱 - 捕获需要的资料" checkitem (file+headline "~/GTD/capture/inbox.org" "收集箱 -- @Inbox")
         "- [ ] %?\n %u"
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


(setq org-use-fast-todo-selection t)
(setq org-todo-keywords '((sequence "WAITING(w)" "CONTEXT(c)" "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))
(setq org-todo-keyword-faces '(
                               ("CONTEXT" . "#CC3333")
                               ("WAITING" . "#996699")
                               ("TODO" . "#CC0033")
                               ("DOING" . "#FFCC33")
                               ("DONE" . "#99CC33")
                               ("ABORT" . "#999999")
                               ))

;; For Literary programming
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)

(provide 'init-org)
