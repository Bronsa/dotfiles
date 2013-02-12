(setq

 mu4e-headers-seen-mark '("S" . "☑")
 mu4e-headers-new-mark '("N" .  "✉")
 mu4e-headers-replied-mark '("R" . "↵")
 mu4e-headers-passed-mark '("P" . "⇉")
 mu4e-headers-encrypted-mark '("x" . "⚷")
 mu4e-headers-signed-mark '("s" . "✍")
 mu4e-headers-empty-parent-prefix '("-" . "○")
 mu4e-headers-first-child-prefix '("\\" . "━▶")
 mu4e-headers-has-child-prefix '("+" . "●")
 mu4e-headers-default-prefix  '("|" . "○"))


(setq mu4e-drafts-folder "/[Gmail].Drafts"
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

      mu4e-update-interval 60

      mu4e-use-fancy-chars t

      mu4e-confirm-quit nil)

(setq message-send-mail-function 'smtpmail-send-it

      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))

      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "brobronsa@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      smtpmail-local-domain "gmail.com"

      user-mail-address "brobronsa@gmail.com"
      user-full-name "Nicola Mometto"

      message-kill-buffer-on-exit t)
