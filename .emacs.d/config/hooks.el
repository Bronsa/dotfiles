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
;; (add-hook 'nrepl-mode-hook 'subword-mode)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

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
