(custom-set-variables
 '(erc-modules '(autojoin completion fill
                          irccontrols list
                          log move-to-prompt netsplit networks
                          noncommands readonly ring services match stamp ;; load match before stamp otherwise it'll fail to match
                          ;;spelling
                          track truncate scrolltobottom)))

(add-to-list 'erc-nickserv-alist
             '(Azzurra
               "NickServ!service@azzurra.org"
               "/ns\sIDENTIFY\spassword"
               "NickServ"
               "IDENTIFY"
               nil))

(setq erc-nick "Bronsa"
      erc-user-full-name "Nicola Mometto"
      erc-email-userid "brobronsa@gmail.com"

      erc-nick-uniquifier "`"
      erc-try-new-nick-p t

      erc-prompt-for-nickserv-password nil

      erc-nickserv-passwords
      '((freenode (("Bronsa" . "<password>")
                   ("Bronsa`" .  "<password>")))
        (Azzurra (("Bronsa" .  "<password>")
                  ("Bronsa`" .  "<password>"))))

      erc-autojoin-channels-alist '((".*\\freenode.net" "#distro" "#carthy" "#clojure")
                                    (".*\\azzurra.org" "#py")                                    )
      erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477")
      erc-track-exclude-server-buffer t
      erc-track-showcount t

      erc-auto-query 'bury
      erc-kill-buffer-on-part nil

      erc-fill-column (- (/ (frame-width) 2) 2)
      erc-fill-prefix "        | "

      erc-server-reconnect-timeout 10

      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%H:%M:%S "
      erc-insert-timestamp-function 'erc-insert-timestamp-left

      erc-header-line-uses-tabbar-p t

      erc-log-channels-directory "~/irclogs"
      erc-save-buffer-on-part t

      erc-interpret-mirc-color t
      erc-input-line-position -2
      erc-prompt (lambda ()
                   (format "[%s]" (buffer-name (current-buffer))))

      erc-current-nick-highlight-type 'nick

      ;; erc-format-nick-function 'erc-format-@nick

      erc-track-position-in-mode-line 'after-modes
      erc-track-shorten-function nil

      erc-spelling-dictionaries '(("#clojure" "american")
                                  ("#distro" "italian")
                                  ("#carthy" "italian")
                                  ("#py" "italian"))

      erc-track-faces-priority-list '(erc-error-face
                                      erc-current-nick-face
                                      erc-nick-msg-face
                                      erc-direct-msg-face
                                      erc-notice-face
                                      erc-prompt-face
                                      erc-nick-default-face))

(defun irc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (progn
    (erc :server "irc.freenode.net" :port 6667)
    (erc :server "irc.azzurra.org" :port 6667)))

(run-at-time "00:00" (* 24 60 60)
             (lambda ()
               (erc-display-line (format-time-string "A new day has come, it is now %A, day %d of %B in %Y") 'all)))

(add-hook 'erc-mode-hook
          (lambda ()
            (setq mode-line-format
                  `(
                    (:propertize "%b " face mode-line-buffer
                                 help-echo (buffer-file-name))
                    (:eval (let ((ops 0)
                                 (members 0))
                             (maphash (lambda (k v)
                                        (when (erc-channel-user-op-p k)
                                          (incf ops))
                                        (incf members))
                                      erc-channel-users)
                             (format "%s(@%s) " members ops)))

                    erc-modified-channels-object

                    (:eval (when (not (string= erc-modified-channels-object ""))
                             (propertize " ")))


                    "["
                    (:eval (propertize (format "%s" new-mail)
                                       'face (if (> new-mail 0)
                                                 'font-lock-warning-face
                                               'font-lock-constant-face)))
                    "/"
                    (:eval (propertize (format "%s" total-mail)
                                       'face 'font-lock-constant-face))
                    "] "


                    "- "

                    (:eval (let* ((users (mapcar (lambda (user-data) (erc-server-user-nickname (car user-data)))
                                                 (erc-sort-channel-users-by-activity (erc-get-channel-user-list))))
                                  (user-string (mapconcat #'identity (delete* nil (subseq users 0 10)) ", ")))
                             (propertize user-string 'help-echo user-string)))))))

(custom-set-faces
 '(erc-default-face ((t (:foreground "white"))))
 '(erc-input-face ((t (:foreground "white"))))
 '(erc-prompt-face ((t (:foreground "gray80" :weight bold))))
 '(erc-nick-default-face ((t (:foreground "green"))))
 '(erc-my-nick-face ((t (:foreground "white"))))
 '(erc-current-nick-face ((t (:foreground "yellow"))))
 '(fg:erc-color-face12 ((t (:foreground "brightblue"))))
 '(fg:erc-color-face2 ((t (:foreground "blue")))))

(set-face-attribute
 'erc-notice-face nil
 :foreground "gray60")

(set-face-attribute
 'erc-prompt-face nil
 :foreground "gray60"
 :weight 'bold)

(set-face-attribute
 'erc-timestamp-face nil
 :foreground "gray40"
 :weight 'normal)

(defadvice erc-track-find-face (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p)
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))
