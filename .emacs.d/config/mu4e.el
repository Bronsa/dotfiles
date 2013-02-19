(setq mu4e-headers-seen-mark '("S" . "☑")
      mu4e-headers-new-mark '("N" .  "✉")
      mu4e-headers-replied-mark '("R" . "↵")
      mu4e-headers-passed-mark '("P" . "⇉")
      mu4e-headers-encrypted-mark '("x" . "⚷")
      mu4e-headers-signed-mark '("s" . "✍")
      mu4e-headers-empty-parent-prefix '("-" . "○")
      mu4e-headers-first-child-prefix '("\\" . "━▶")
      mu4e-headers-has-child-prefix '("+" . "●")
      mu4e-headers-default-prefix  '("|" . "○")

      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder "/[Gmail].Sent Mail"
      mu4e-trash-folder "/[Gmail].Trash"
      ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
      mu4e-sent-messages-behavior 'delete
      ;; you can quickly switch to your Inbox -- press ``ji''
      ;; then, when you want archive some messages, move them to
      ;; the 'All Mail' folder by pressing ``ma''.
      mu4e-maildir-shortcuts
      '( ("/INBOX" . ?i)
         ("/[Gmail].Sent Mail" . ?s)
         ("/[Gmail].Trash" . ?t))
      ;; allow for updating mail using 'U' in the main view:

      mu4e-get-mail-command "offlineimap"
      mu4e-maildir "~/.mail"
      mu4e-headers-leave-behavior 'apply
      mu4e-show-images nil

      ;; we do this with an external timer so it runs even when mu4e is not already started

      mu4e-headers-auto-update t
      mu4e-update-interval nil

      mu4e-use-fancy-chars t

      mu4e-confirm-quit nil

      mu4e-headers-date-format "%d %b, %Y at %H:%M"

      mu4e-headers-fields
      '((:date . 24)
        (:flags . 6)
        (:from . 24)
        (:subject . nil))

      message-send-mail-function 'smtpmail-send-it

      mu4e-headers-show-threads nil

      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))

      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "brobronsa@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      smtpmail-local-domain "gmail.com"

      user-mail-address "brobronsa@gmail.com"
      user-full-name "Nicola Mometto"

      message-kill-buffer-on-exit t

      mu4e-html2text-command "html2text")

(defvar total-mail 0)
(defvar new-mail 0)

(defun get-new-mail-count ()
  (string-to-number
   (replace-regexp-in-string
    "![0-9]" "" (shell-command-to-string "mu find maildir:/inbox flag:unread | wc -l"))))

(defun new-mail-handler (&rest args)
  (setq sexp (car args))
  (let ((total (plist-get sexp :processed))
        (new (get-new-mail-count)))
    (if (equal (plist-get sexp :status) 'complete)
        (progn
          (setq total-mail total)
          (setq new-mail new)))))

(setq mu4e-info-func 'new-mail-handler)

(run-with-timer 0 (* 2 60)
                (lambda ()
                  (mu4e-update-mail-and-index t)))

;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
