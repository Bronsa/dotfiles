(dolist (hook (list 'lisp-mode-hook
                    'lisp-interaction-mode-hook
                    'emacs-lisp-mode-hook
                    'clojure-mode-hook
                    'slime-mode-hook
                    'slime-repl-mode-hook
                    'inferior-lisp
                    'nrepl-mode-hook
                    'nrepl-interaction-mode-hook))
  (add-hook hook 'enable-paredit-mode)
  (add-hook hook 'auto-highlight-symbol-mode))

(add-hook 'slime-connected-hook (lambda () (slime-repl-send-string "(use 'clojure.repl)")))

(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(dolist (hook (list 'set-up-slime-ac
                    'clojure-mode-font-lock-setup))
  (add-hook 'slime-repl-mode-hook hook))

(dolist (mode '(text-mode html-mode sh-mode clojure-mode lisp-mode ruby-mode markdown-mode nrepl-mode latex-mode))
  (add-to-list 'ac-modes mode))

(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources)))
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)

(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/lib/auto-complete-clang-async/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
