;; Assumes the presence of:
;; - dotfiles-lib-dir (usually bound to ~/.emacs.d/lib/)
;; - dotfiles-tmp-dir (usually bound to ~/.emacs.d/tmp/)
;; - dotfiles-etc-dir (usually bound to ~/.emacs.d/etc/)

;; Create a var for this live config dir
(setq config-dir (file-name-directory
                  (or (buffer-file-name) load-file-name)))

;; Define some helper fns for loading config paths and files
(defun load-config-file (f)
  (load-file (concat config-dir f)))

;; Add lib paths
(dolist (path (list "ac-slime"
                    "align-cljlet"
                    "auto-complete"
                    "backup-dir"
                    "clojure-mode"
                    "color-theme"
                    "dirtree"
                    "durendal"
                    "elein"
                    "emacs-nav"
                    "eval-sexp-fu"
                    "gh"
                    "gist"
                    "haskell-mode"
                    "highlight"
                    "imenu+"
                    "inf-ruby"
                    "isearch+"
                    "logito"
                    "linum-plus"
                    "magit"
                    "markdown-mode"
                    "multi-eshell"
		    "nrepl"
                    "pcache"
                    "paredit"
                    "php-mode"
                    "rsense/etc"
                    "ruby-electric"
                    "slime"
                    "smex"
                    "tabulated-list"
                    "tree-mode"
                    "undo-tree"
                    "windata"))
  (add-lib-path path))

;; Require libs
(dolist (lib (list 'ac-slime
                   'align-cljlet
                   'auto-complete
                   'auto-complete-config
                   'backup-dir
                   'clojure-mode
                   'color-theme
                   'color-theme-subdued
                   'clojure-test-mode
                   'd-mode
                   'dircolors
                   'dirtree
                   'elein
                   'nav
                   'eval-sexp-fu
                   'gist
                   'haskell-mode
                   'highlight
                   'imenu+
                   'inf-ruby
                   'isearch+
                   'linum+
                   'magit
                   'markdown-mode
                   'multi-eshell
		   'nrepl
                   'paren
                   'paredit
                   'php-mode
                   'ps-print
                   'rsense
                   'ruby-electric
                   'saveplace
                   'slime
                   'smex
                   'tabbar
                   'undo-tree
                   'window-resize))
  (require lib))

(eval-after-load "isearch" '(require 'isearch+))

;; Load config files
(dolist (config-file (list "auto-complete-conf.el"
                           "auto-modes.el"
                           "bindings.el"
                           "clojure-conf.el"
                           "misc.el"
                           "modes.el"
                           "tabbar-conf.el"
                           "hooks.el"
                           "look-and-feel.el"))
  (load-config-file config-file))
