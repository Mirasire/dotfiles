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
                      ;; --- Better Editor ---
                      hungry-delete
                      yasnippet
                      yasnippet-snippets
                      swiper
                      counsel
                      smartparens
                      popwin
                      avy
                      expand-region
                      ;; --- shell | terminal ---
                      shell-pop
                      multi-term
                      ;; --- Major Mode ---
                      markdown-mode
                      web-mode
                      ;;--- try copy form vim ---
                      evil
                      evil-leader
                      evil-escape
                      neotree
                      ;; --- Minor Mode ---
                      ;;		nodejs-repl
                      ;;		exec-path-from-shell
                      ;; --- Themes ---
                      solarized-theme
                      helm-themes
                      doom-themes
                      zenburn-theme
                      all-the-icons
                      all-the-icons-dired
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


(require 'neotree)
;; setting for my Emacs
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "jl" 'avy-goto-line
  "jw" 'avy-goto-char-2
  "te" 'mirasire-ansi-term
  "tt" 'neotree-toggle
  "sb" 'counsel-switch-buffer)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(require 'expand-region)
(require 'popwin)
(popwin-mode t)
(require 'evil)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 14)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)
(add-hook 'evil-local-mode-hook 'evil-escape-mode)
(global-company-mode 1)
(global-hungry-delete-mode 1)
(add-hook 'c-mode-common-hook 'evil-local-mode)
;;(linum-relative-global-mode 1)
(load-theme 'solarized-dark 1)


;;Config for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;Config for markdown mode
(setq markdown-command "pandoc")

;;config for yas-snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/snippets/icpc"                 ;; personal icpc/ccpc tmplate snippets
        ;;"/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;;"/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(provide 'init-packages)
