;;mark current function
(global-set-key (kbd "C-c m")     'mark-defun)

;;paredit
(global-set-key (kbd "C-M-f")     'paredit-forward)
(global-set-key (kbd "C-M-b")     'paredit-backward)

;;C-c C-? bindings
(global-set-key (kbd "C-c C-e")   'slime-eval-last-expression)

;; slime mode shortcuts
(global-set-key (kbd "C-c s c")     'slime-connect)

(global-set-key (kbd "C-c s e d")   'slime-eval-defun)
(global-set-key (kbd "C-c s e m")   'slime-eval-macroexpand-inplace)
(global-set-key (kbd "C-c s e n")   'slime-eval-print-last-expression)
(global-set-key (kbd "C-c s e r")   'slime-eval-region)

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

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c C-c SPC") 'ace-jump-char-mode)
(global-set-key (kbd "C-c C-c C-c SPC") 'ace-jump-line-mode)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(define-key erc-mode-map (kbd "C-<up>") 'erc-previous-command)
(define-key erc-mode-map (kbd "C-<down>") 'erc-next-command)

(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key (kbd "C-x c") 'mu4e-compose-new)
(global-set-key (kbd "C-x m") 'mu4e)

(define-key mpc-songs-mode-map (kbd "RET") 'mpc-play-at-point)
(define-key mpc-songs-mode-map (kbd "M-RET") 'mpc-play)
(define-key mpc-mode-map (kbd "j") #'mpc-select)
(define-key mpc-mode-map (kbd "s") #'mpc-songs-search)
(define-key mpc-mode-map (kbd "y") #'mpc-playlist-add)
(define-key mpc-mode-map (kbd "k") #'mpc-playlist-delete)
(define-key mpc-mode-map (kbd "SPC") #'mpc-toggle-pause)
(define-key mpc-mode-map (kbd "m") #'mpc-select-toggle)
(define-key mpc-mode-map (kbd "S-SPC") #'mpc-select-extend)
(define-key mpc-mode-map (kbd "n") #'mpc-next)
(define-key mpc-mode-map (kbd "p") #'mpc-prev)
(define-key mpc-mode-map (kbd "l") #'mpc-playlist)
(define-key mpc-mode-map (kbd "M-s") #'mpc-play)
(define-key mpc-mode-map (kbd "M-a") #'mpc-jump-to-albums)
(define-key mpc-mode-map (kbd "a") #'mpc-jump-to-artists)
(define-key mpc-mode-map (kbd "M-s") #'mpc-jump-to-songs)

;; C-M-x eval-defun
;; C-q ( insert unmatched parenthesis
