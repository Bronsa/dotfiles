;(toggle-debug-on-error t)
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

 ;; Configure auto-save
 auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "autosaves/\\1") t))
 backup-directory-alist `((".*" . ,(concat dotfiles-tmp-dir "backups")))
 backup-directory-info `((t ,(concat dotfiles-tmp-dir "backups") ok-create full-path prepend-name))

 auto-save-list-file-name (concat dotfiles-tmp-dir "autosaves/autosave-list")
 make-backup-files nil
 auto-save-default nil

 save-place t
 save-place-file (concat dotfiles-tmp-dir "places")

 delete-old-versions t
 kept-old-versions 1
 kept-new-versions 3
 version-control t

 diff-switches "-u"

 yas/root-directory (concat dotfiles-etc-dir "snippets")

 slime-protocol-version 'ignore
 inferior-lisp-program  "lein repl"
 slime-net-coding-system 'utf-8-unix
 ecb-tip-of-the-day nil

 multi-eshell-function '(eshell))

(make-variable-buffer-local 'backup-inhibited)
(smex-initialize)

(setq rsense-home (concat dotfiles-lib-dir "rsense"))

(defun indent-file ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(slime-setup
 '(slime-scratch slime-fancy slime-fuzzy slime-repl))

(yas/initialize)
(yas/load-directory yas/root-directory)

(custom-set-variables
 '(ecb-options-version "2.40"))
