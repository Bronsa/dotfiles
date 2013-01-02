(dolist (hook (list 'lisp-mode-hook
                    'lisp-interaction-mode-hook
                    'emacs-lisp-mode-hook
                    'clojure-mode-hook
                    'inferior-lisp
                    'nrepl-mode-hook
                    'nrepl-interaction-mode-hook))
  (add-hook hook 'enable-paredit-mode)
  (add-hook hook 'auto-highlight-symbol-mode))

(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(dolist (mode '(text-mode html-mode sh-mode clojure-mode lisp-mode ruby-mode markdown-mode nrepl-mode))
  (add-to-list 'ac-modes mode))

(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
