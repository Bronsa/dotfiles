(fset 'yes-or-no-p 'y-or-n-p)
(set-language-environment "UTF-8")

(setq-default
 font-lock-maximum-decoration t
 require-final-newline t
 next-line-add-newlines nil

 case-fold-search t

 ;; Set indentation rules
 indent-tabs-mode nil
 tab-width 4
 indent-line-function 'insert-tab

 save-place t
 save-place-file (concat dotfiles-tmp-dir "places")

 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 backup-directory-alist `((".*" . ,(concat dotfiles-tmp-dir "backups")))
 auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "autosaves/") t))

 diff-switches "-u"

 slime-protocol-version 'ignore
 slime-net-coding-system 'utf-8-unix

 inferior-lisp-program  "lein repl")

(smex-initialize)

(slime-setup
 '(slime-scratch slime-fancy slime-fuzzy slime-repl))

(defun indent-file ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defalias 'emacs 'find-file)
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)
