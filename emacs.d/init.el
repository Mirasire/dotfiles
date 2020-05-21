;; Mirasire's Emacs dotfiles

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;module the config, save in the dir ~/.emacs.d/lisp
(require 'init-packages)
(require 'init-func)
(require 'init-better-default)

;;dotfiles for packages
(require 'init-evil)
(require 'init-markdown)
(require 'init-org)
(require 'init-eshell)
(require 'init-keyfreq)
(require 'init-dired)
(require 'init-company)

;;help emacs looks sexy
(require 'init-ui)

;;bind defaul-key
(require 'init-keybindings) ;;init-keybindings must aftre load init-fun

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
