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
                    "cedet/common"
                    "clojure-mode"
                    "color-theme"
                    "durendal"
                    "ecb"
                    "elein"
                    "eval-sexp-fu"
                    "gist " 
                    "highlight"
                    "inf-ruby"
                    "linum-plus"
                    "magit"
                    "markdown-mode"
                    "multi-eshell"
                    "paredit"
                    "php-mode"
                    "rsense/etc"
                    "ruby-electric"
                    "slamhound"
                    "slime"
                    "smex"
                    "undo-tree"
                    "yasnippet"))
  (add-lib-path path))

;; Require libs
(dolist (lib (list 'ac-slime
                   'align-cljlet
                   'auto-complete
                   'auto-complete-config
                   'backup-dir
                   'cedet
                   'clojure-mode
                   'color-theme
                   'color-theme-subdued
                   'clojure-test-mode
                   'dircolors
                   'ecb
                   'elein
                   'eval-sexp-fu
                   'gist
                   'highlight
                   'inf-ruby
                   'linum+
                   'magit
                   'markdown-mode
                   'multi-eshell
                   'paren
                   'paredit
                   'php-mode
                   'ps-print
                   'rsense
                   'ruby-electric
                   'saveplace
                   'slamhound
                   'slime
                   'smex
                   'tabbar
                   'undo-tree
                   'window-resize
                   'yasnippet
                   ))
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
