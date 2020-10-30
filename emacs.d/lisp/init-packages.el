;; Installed packages.  Don't delete this line.  If you don't want it,
;; Added by Package.el.  This must come before configurations of
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ;;                           ("melpa" . "http://elpa.emacs-china.org/melpa/")
                           ("tsu-melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar mirasire/packages '(
                            ;; --- Auto-completion ---
                            company
                            lsp-mode
                            anaconda-mode
                            company-anaconda
                            ;; --- python IDE ---
                            ;; elpy
                            ;; --- Better Editor ---
                            cnfonts
                            org-pomodoro
                            keyfreq
                            hungry-delete
                            yasnippet
                            yasnippet-snippets
                            swiper
                            counsel
                            smex
                            smartparens
                            popwin
                            avy
                            ivy
                            ace-pinyin
                            expand-region
                            window-numbering
                            which-key
                            ;; --- shell | terminal ---
                            w3m
                            erc
                            exec-path-from-shell
                            ;; --- Major Mode ---
                            markdown-mode
                            web-mode
                            ;; --- Minor Mode ---
                            polymode
                            poly-markdown
                            poly-org
                            ;;--- try copy form vim ---
                            evil
                            evil-leader
                            evil-escape
                            neotree
                            ;;--- org mode ---
                            org-bullets
                            toc-org
                            ;;--- Themes ---
                            emojify
                            gruvbox-theme
                            rainbow-delimiters
                            ) "Default packages")

(setq package-selected-packages mirasire/packages)

(defun mirasire/packages-installed-p ()
  (loop for pkg in mirasire/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (mirasire/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg mirasire/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))



;;(add-hook 'after-init-hook #'global-emojify-mode)
(require 'neotree)
;; setting for my Emacs
(window-numbering-mode t)
(require 'expand-region)

(require 'popwin)
(popwin-mode t)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 14)

(global-hungry-delete-mode 1)

;;Config for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

(require 'ace-pinyin)
(ace-pinyin-mode t)

;;config for yas-snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/snippets/icpc"                 ;; personal icpc/ccpc tmplate snippets
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(provide 'init-packages)
