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

 slime-protocol-version 'ignore
 inferior-lisp-program  "lein repl"
 slime-net-coding-system 'utf-8-unix

 multi-eshell-shell-function '(eshell)
 multi-eshell-name "*eshell*")

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

;;http://bc.tech.coop/blog/070424.html
(defun slime-send-dwim (arg)
  "Send the appropriate forms to CL to be evaluated."
  (interactive "P")
  (save-excursion
    (cond
      ;;Region selected - evaluate region
      ((not (equal mark-active nil))
       (copy-region-as-kill (mark) (point)))
      ;; At/before sexp - evaluate next sexp
      ((or (looking-at "\s(")
           (save-excursion
             (ignore-errors (forward-char 1))
             (looking-at "\s(")))
       (forward-list 1)
       (let ((end (point))
             (beg (save-excursion
                    (backward-list 1)
                    (point))))
         (copy-region-as-kill beg end)))
      ;; At/after sexp - evaluate last sexp
      ((or (looking-at "\s)")
           (save-excursion
             (backward-char 1)
             (looking-at "\s)")))
       (if (looking-at "\s)")
           (forward-char 1))
       (let ((end (point))
             (beg (save-excursion
                    (backward-list 1)
                    (point))))
         (copy-region-as-kill beg end)))
      ;; Default - evaluate enclosing top-level sexp
      (t (progn
           (while (ignore-errors (progn
                                   (backward-up-list)
                                   t)))
           (forward-list 1)
           (let ((end (point))
                 (beg (save-excursion
                        (backward-list 1)
                        (point))))
             (copy-region-as-kill beg end)))))
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (yank)
    (if arg (progn
              (slime-repl-return)
              (other-window 1)))))

(defadvice gist-region (around su/advice/gist/gist-region/around/dirty-hack
                               a c pre)
  "Dirty hack to prevent gist-region from choking on buffers which contain
     `%' character"
  (save-window-excursion
    (let* ((delete-old-versions t)
           (dummy "foo")
           (beg (ad-get-arg 0))
           (end (ad-get-arg 1))
           (min-beg-end (min beg end))
           (original-text (buffer-substring beg end))
           gistid buf proc)
      (kill-region beg end)
      (insert-for-yank-1 dummy)
      (ad-set-arg 0 min-beg-end)
      (ad-set-arg 1 (point))
      ad-do-it
      (sleep-for 0.5) ;; deep magic
      (dolist (buf (buffer-list))
        (when (string-match "^\\s-\\*http api\\.github\\.com:443\\*$" (buffer-name
                                                                       buf))
          (setq proc (get-buffer-process buf))
          (when proc (kill-process proc))))
      (delete-region min-beg-end (point))
      (insert-for-yank-1 original-text)
      (setq gistid (car (last (split-string (car kill-ring)
                                            "/"))))
      (setq buf (gist-fetch gistid))
      (with-current-buffer buf
        (delete-region (point-min)
                       (point-max))
        (insert-for-yank-1 original-text)
        (gist-mode-save-buffer)
        (kill-buffer)))))
