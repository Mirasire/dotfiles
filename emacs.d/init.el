;; Mirasire's Emacs dotfiles

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;module the config, save in the dir ~/.emacs.d/lisp
(require 'init-packages)
(require 'init-ui)
(require 'init-better-default)
(require 'init-org)
(require 'init-func)
(require 'init-keybindings) ;;init-keybindings must aftre load init-fun

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
