(defun esk-pretty-fn ()
  (font-lock-add-keywords nil `(("(\\(\\<fn\\>\\)"
                                 (0 (progn (compose-region (match-beginning 1)
                                                           (match-end 1)
                                                           "\u0192"
                                                           'decompose-region)))))))
(add-hook 'clojure-mode-hook 'esk-pretty-fn)
  (add-hook 'clojurescript-mode-hook 'esk-pretty-fn)

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (clojure-mode-font-lock-setup)
            (font-lock-mode)
            (font-lock-mode)))

(defadvice slime-repl-emit (after sr-emit-ad activate)
  (with-current-buffer (slime-output-buffer)
    (add-text-properties slime-output-start slime-output-end
                         '(font-lock-face slime-repl-output-face
                                          rear-nonsticky (font-lock-face)))))

(defadvice slime-repl-insert-prompt (after sr-prompt-ad activate)
  (with-current-buffer (slime-output-buffer)
    (let ((inhibit-read-only t))
      (add-text-properties slime-repl-prompt-start-mark (point-max)
                           '(font-lock-face slime-repl-prompt-face
                                            rear-nonsticky
                                            (slime-repl-prompt
                                             read-only
                                             font-lock-face
                                             intangible))))))


(defun slime-clojure-repl-setup ()
  (define-key slime-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key slime-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key slime-repl-mode-map
    (kbd "}") 'paredit-close-curly)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?~ "'   ")
  (modify-syntax-entry ?, "    ")
  (modify-syntax-entry ?^ "'")
  (modify-syntax-entry ?= "'")
  (setq lisp-indent-function 'clojure-indent-function))

(add-hook 'slime-repl-mode-hook 'slime-clojure-repl-setup)

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

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

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

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq ac-clang-complete-executable "~/.emacs.d/lib/auto-complete-clang-async/clang-complete")
            (setq ac-sources '(ac-source-clang-async))
            (ac-clang-launch-completion-process)
            (xgtags-mode 1)))

(make-variable-buffer-local 'erc-fill-column)
(add-hook 'window-configuration-change-hook
          '(lambda ()
             (save-excursion
               (walk-windows
                (lambda (w)
                  (let ((buffer (window-buffer w)))
                    (set-buffer buffer)
                    (when (eq major-mode 'erc-mode)
                             (setq erc-fill-column (- (window-width w) 2)))))))))

(add-hook 'erc-mode-hook 'erc-add-scroll-to-bottom)

;; (add-hook 'mu4e-compose-mode-hook 'org-mu4e-compose-org-mode)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
