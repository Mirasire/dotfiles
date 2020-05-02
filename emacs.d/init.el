;; Mirasire's Emacs dotfiles

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
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
(defvar my/packages '(
                      ;; --- Auto-completion ---
                      company
                      ;; --- Better Editor ---
                      hungry-delete
                      evil
                      evil-leader
                      yasnippet
                      yasnippet-snippets
                      swiper
                      counsel
                      smartparens
                      markdown-mode
                      ;; --- Major Mode ---
                      ;;		js2-mode
                      ;; --- Minor Mode ---
                      ;;		nodejs-repl
                      ;;		exec-path-from-shell
                      ;; --- Themes ---
                      solarized-theme
                      gruvbox-theme
                      helm-themes
                      zenburn-theme
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; make tool-bar ,scroll-bar, menu-bar  unvisiable
;; close default startup window
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(delete-selection-mode -1)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
;; Menu-Bar = --File Edit Options Buffers Tools Emacs-Lisp Help-- | (menu-bar-mode 1)

;; setting for my Emacs
(global-evil-leader-mode)
(require 'evil)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 14)
(require 'org)
(setq org-src-fontify-natively 1) ;;make syntax high light for org mode
(global-linum-mode 1)
(global-company-mode 1)
(global-hl-line-mode 1)
(global-hungry-delete-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'c-mode-common-hook 'evil-local-mode)
(set-face-attribute 'default nil :height 135) ;;set default font
;;(load-theme 'solarized-dark 1)
(load-theme 'gruvbox 1)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
;;(setq c-tab-always-indent 4)
(setq c-default-style "Linux")
(setq default-tab-width 4)

;;config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)

;;config for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;config for markdown mode
(setq markdown-command "pandoc")

;;config for yas-snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/snippets/icpc"                 ;; personal icpc/ccpc tmplate snippets
        ;;"/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;;"/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;;bind <F2> key inorder to hacking my emacs more quickly
(defun hack-emacs()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-icpc-train()
  (interactive)
  (find-file "~/Repo/remote/icpc-train"))

;;format code
(defun indent-all-code()
  "indent all lines"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(global-set-key (kbd "<f2>") 'hack-emacs) ;; <F2> = open my init.el files
(global-set-key (kbd "C-x C-r") 'recentf-open-files) ;; C-x C-r open recent open recent file menu
(global-set-key (kbd "C-x gg=G") 'indent-all-code) ;;indent all code quickly idear from vim
(global-set-key (kbd "s-q") 'evil-local-mode) ;;close evil mode quickly
;;(setq 'evil-local-mode-hook (set-cursor-color "LightBlue4"))
(global-set-key (kbd "C-w") 'backward-kill-word)
;;(global-set-key (kbd "C-i") 'open-icpc-train)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(package-selected-packages my/packages))

;; '(package-selected-packages (quote (solarized-theme company)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
