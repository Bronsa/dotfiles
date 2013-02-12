(fset 'yes-or-no-p 'y-or-n-p)
(set-language-environment "UTF-8")

(setq-default
 font-lock-maximum-decoration t

 abbrev-mode t
 abbrev-file-name (concat dotfiles-dir "abbrevs")
 save-abbrevs nil

 require-final-newline t
 next-line-add-newlines nil

 vc-follow-symlinks t

 case-fold-search t

 indent-tabs-mode nil
 tab-width 4
 indent-line-function 'insert-tab
 ;; fill-column 82

 default-major-mode 'text-mode

 display-time-24hr-format t
 display-time-day-and-date t

 save-place t
 save-place-file (concat dotfiles-tmp-dir "places")

 backup-directory-alist (list (cons ".*" (concat dotfiles-tmp-dir "backups")))
 auto-save-list-file-prefix (concat dotfiles-tmp-dir "autosaves")
 auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "autosaves/\\1") t))

 delete-auto-save-files t
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 diff-switches "-u"

 undo-tree-history-directory-alist  `(("." . ,(concat dotfiles-tmp-dir "undo")))
 undo-tree-auto-save-history t
 undo-tree-visualizer-diff t

 slime-protocol-version 'ignore
 slime-net-coding-system 'utf-8-unix

 linum-disabled-modes-list '(erc-mode compilation-mode dired-mode mpc-mode mpc-status-mode
                                      mpc-tagbrowser-mode mpc-tagbrowser-dir-mode mpc-songs-mode)
 linum-disable-starred-buffers nil

 completion-ignore-case t

 inferior-lisp-program  "lein repl")

(quietly-read-abbrev-file)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/tmp/autosaves/" t)

(smex-initialize)

(slime-setup
 '(slime-scratch slime-fancy slime-repl))

(define-key slime-repl-mode-map (kbd "M-RET") 'slime-repl-newline-and-indent)

(defun indent-file ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defalias 'emacs 'find-file)
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)

;; (add-to-list 'completion-styles 'substring)
(add-to-list 'completion-styles 'initials)

(defalias 'byte-compile-cl-warn 'identity)
