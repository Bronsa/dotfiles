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

 inferior-lisp-program  "lein repl")

(make-variable-buffer-local 'backup-inhibited)
(smex-initialize)

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
