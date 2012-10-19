(dolist (hook (list 'lisp-mode-hook
                    'lisp-interaction-mode-hook
                    'slime-mode-hook
                    'slime-repl-mode-hook
                    'emacs-lisp-mode-hook
                    'clojure-mode-hook
                    'inferior-lisp
                    ;'ruby-mode
                    ))
  (add-hook hook 'enable-paredit-mode))

(add-hook 'slime-connected-hook (lambda () (slime-repl-send-string "(use 'clojure.repl)")))

(dolist (hook (list 'ruby-electric-mode
                    'inf-ruby-keys
                    (lambda ()
                      (add-to-list 'ac-sources 'ac-source-rsense-method)
                      (add-to-list 'ac-sources 'ac-source-rsense-constant))
                    (lambda ()
                      (local-set-key (kbd "C-c .") 'ac-complete-rsense))))
  (add-hook 'ruby-mode-hook hook))

(dolist (mode '(text-mode html-mode sh-mode clojure-mode lisp-mode ruby-mode markdown-mode))
  (add-to-list 'ac-modes mode))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(dolist (hook (list 'set-up-slime-ac
                    'clojure-mode-font-lock-setup
                    (lambda ()
                      (set-syntax-table (let ((table (copy-syntax-table emacs-lisp-mode-syntax-table)))
                                          (modify-syntax-entry ?~ "'   " table)
                                          (modify-syntax-entry ?\{ "(}" table)
                                          (modify-syntax-entry ?\} "){" table)
                                          (modify-syntax-entry ?\[ "(]" table)
                                          (modify-syntax-entry ?\] ")[" table)
                                          (modify-syntax-entry ?^ "'" table)
                                          table)))))
  (add-hook 'slime-repl-mode-hook hook))

(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
