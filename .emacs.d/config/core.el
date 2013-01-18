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
(dolist (path (list "ace"
                    "ac-nrepl"
                    "ac-slime"
                    "align-cljlet"
                    "auto-complete"
                    "auto-highlight-symbol-mode"
                    "backup-dir"
                    "clojure-mode"
                    "color-theme"
                    "elein"
                    "eval-sexp-fu"
                    "haskell-mode"
                    "highlight"
                    "imenu+"
                    "isearch+"
                    "linum-plus"
                    "magit"
                    "markdown-mode"
                    "nrepl"
                    "paredit"
                    "ruby-electric"
                    "slime"
                    "smex"
                    "undo-tree"))
  (add-lib-path path))

;; Require libs
(dolist (lib (list 'ace-jump-mode
                   'ac-math
                   'ac-nrepl
                   'ac-slime
                   'align-cljlet
                   'auto-complete
                   'auto-complete-config
                   'auto-highlight-symbol
                   'backup-dir
                   'clojure-mode
                   'color-theme
                   'color-theme-subdued
                   'clojure-test-mode
                   'd-mode
                   'dircolors
                   'eval-sexp-fu
                   'haskell-mode
                   'highlight
                   'imenu+
                   'isearch+
                   'linum+
                   'magit
                   'markdown-mode
                   'nrepl
                   'paren
                   'paredit
                   'ps-print
                   'ruby-electric
                   'saveplace
                   'slime
                   'smex
                   'tabbar
                   'undo-tree))
  (require lib))

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
