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

(setq sprunge-suffixes (make-hash-table :test 'equal))
(puthash "Clojure" "cl" sprunge-suffixes)
(puthash "Shell-script" "sh" sprunge-suffixes)

;; (push 'java-mode which-func-modes)

(defun sprunge ()
  "Posts the current buffer to sprunge, and shows the resulting URL in a new buffer"
  (interactive)
  (if (buffer-file-name) (save-buffer) (write-file "/tmp/sprunge-post"))
  (delete-other-windows)
  (let ((sprunge-buffer (get-buffer-create "*sprunge*"))
        (sprunge-window (split-window-vertically (- (window-height) 5)))
        (filename buffer-file-name)
        (suffix (if (gethash mode-name sprunge-suffixes) (concat "?" (gethash mode-name sprunge-suffixes)) "")))
    (select-window sprunge-window)
    (set-window-buffer sprunge-window sprunge-buffer)
    (erase-buffer)
    (insert (shell-command-to-string (concat "curl -F 'sprunge=<" filename "' http://sprunge.us")))
    (delete-char -1) ; Newline after URL
    (insert suffix "\n")))

(defalias 'emacs 'find-file)
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)
