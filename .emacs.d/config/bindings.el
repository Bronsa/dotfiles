;;mark current function
(global-set-key (kbd "C-c m")     'mark-defun)

;;paredit
(global-set-key (kbd "C-M-f")     'paredit-forward)
(global-set-key (kbd "C-M-b")     'paredit-backward)

;;C-c C-? bindings
(global-set-key (kbd "C-c C-e")   'slime-eval-last-expression)

;;slime mode shortcuts
(global-set-key (kbd "C-c s c")     'slime-connect)
(global-set-key (kbd "C-c s d")     (lambda () (interactive)
                                      (when (get-buffer "*swank*")
                                        (kill-buffer "*swank*"))
                                      (let ((dir default-directory))
                                        (cd (concat dotfiles-dir "/../.dummy-clj-prj"))
                                        (let* ((proc (start-process-shell-command "swank" "*swank*" "lein swank")))
                                          (set-process-filter (get-buffer-process "*swank*")
                                                              (lambda (process output)
                                                                (with-current-buffer "*swank*"
                                                                  (insert output))
                                                                (when (string-match "Connection opened on localhost port 4005." output)
                                                                  (slime-connect "localhost" 4005)
                                                                  (set-process-filter process nil)))))
                                        (cd dir))
                                      (message "Starting swank server...")))

;; (global-set-key (kbd "C-c s e d")   'slime-eval-defun)
;; (global-set-key (kbd "C-c s e m")   'slime-eval-macroexpand-inplace)
;; (global-set-key (kbd "C-c s e n")   'slime-eval-print-last-expression)
;; (global-set-key (kbd "C-c s e r")   'slime-eval-region)


;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "M-D") 'backward-kill-word)

;;delete current word
(global-set-key (kbd "M-W") (lambda () (interactive) (backward-word) (kill-word 1)))

;;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;fast vertical naviation
(global-set-key  (kbd "M-P") (lambda () (interactive) (previous-line 10)))
(global-set-key  (kbd "M-N") (lambda () (interactive) (next-line 10)))
(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

(global-set-key (kbd "C-M-_") 'undo-tree-undo)

;; Enable autoindentation on RET
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)

;; Navigate tabs
(global-set-key (kbd "C-p")     'tabbar-backward-tab)
(global-set-key (kbd "C-n")     'tabbar-forward-tab)
(global-set-key (kbd "C-x C-p") 'tabbar-backward-group)
(global-set-key (kbd "C-x C-n") 'tabbar-forward-group)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; C-M-x eval-defun
;; C-q ( insert unmatched parenthesis
