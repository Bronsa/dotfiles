(setq tabbar-buffer-groups-function
      (lambda ()
        (list (cond
               ((memq major-mode '(shell-mode term-mode eshell-mode))
                "Shell")
               ((or
                 (memq major-mode '(slime-mode slime-repl-mode compilation-mode sldb-mode slime-inspector-mode))
                 (equal "*slime-source*" (buffer-name (current-buffer)))
                 (equal "*inferior-lisp*" (buffer-name (current-buffer)))
                 (equal "*nrepl*" (buffer-name (current-buffer)))
                 (equal "*nrepl-error*" (buffer-name (current-buffer)))
                 (equal "*ielm*" (buffer-name (current-buffer))))
                "Lisp Interaction")
               ((or (memq major-mode '(magit-mode magit-log-mode magit-commit-mode magit-key-mode magit-diff-mode
                                                  magit-wip-mode magit-wip-save-mode magit-status-mode magit-stath-mode
                                                  magit-log-edit-mode magit-branch-manager-mode magit-wazzup-mode
                                                  magit-reflog-mode))
                    (equal "*magit-process*" (buffer-name (current-buffer))))
                "Magit")
               ;; ((memq major-mode '(mu4e-main-mode mu4e-view-mode mu4e-compose-mode mu4e-headers-mode message-mode mail-mode))
               ;;  "Mail")
               ((memq major-mode '(erc-mode))
                "IRC")
               ((memq major-mode '(dired-mode))
                "Dired")
               ;; ((memq major-mode '(mpc-mode mpc-status-mode mpc-tagbrowser-mode mpc-tagbrowser-dir-mode mpc-songs-mode))
               ;;  "Music")
               (t
                "All")))))

(setq tabbar-buffer-list-function
      (lambda ()
        (delq nil
              (mapcar #'(lambda (b)
                          (cond
                           ;; Always include the current buffer.
                           ;;((eq (current-buffer) b) b)
                           ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                           ((or (equal "*Messages*" (buffer-name b))
                                (equal "*Help*" (buffer-name b))
                                (equal "*Buffer List*" (buffer-name b))
                                (equal "*nrepl-server*" (buffer-name b))
                                (equal "*slime-events*" (buffer-name b))
                                (equal "*clang-complete*" (buffer-name b))
                                (equal "*swank*" (buffer-name b))
                                (equal "*Shell Command Output*" (buffer-name b))
                                (equal "*nrepl-connection*" (buffer-name b))
                                (equal "*Ido Completions*" (buffer-name b))
                                (equal "*Completions*" (buffer-name b))
                                (equal "*Compile-Log*" (buffer-name b))
                                (equal "*Directory*" (buffer-name b))
                                (equal "*Process List*" (buffer-name b))
                                (equal "*Disabled Command*" (buffer-name b))
                                (equal "irc.freenode.net:6667" (buffer-name b))
                                (equal "irc.azzurra.org:6667" (buffer-name b))
                                (equal "*Backtrace*" (buffer-name b))
                                (equal "*Quail Completions*" (buffer-name b))
                                (equal "*trace of SMTP session to smtp.gmail.com*" (buffer-name b))
                                (memq (buffer-local-value 'major-mode b)
                                      '(mu4e-main-mode mu4e-view-mode mu4e-compose-mode mu4e-headers-mode message-mode mail-mode))
                                (string-match "\\*draft\\*.*" (buffer-name b))
                                (memq (buffer-local-value 'major-mode b)
                                      '(mpc-mode mpc-status-mode mpc-tagbrowser-mode mpc-tagbrowser-dir-mode mpc-songs-mode))
                                (equal "*undo-tree Diff*" (buffer-name b))) nil)
                           ((buffer-file-name b) b)
                           ((buffer-live-p b) b)))
                      (buffer-list)))))

;; place a space around the label to make it looks less crowd
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value	(concat " " (concat ad-return-value " "))))

;; called each time the modification state of the buffer changed
(defun ztl-modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))
;; first-change-hook is called BEFORE the change is made
(defun ztl-on-buffer-modification ()
  (set-buffer-modified-p t)
  (ztl-modification-state-change))

(setq
 tabbar-scroll-left-help-function nil   ;don't show help information
 tabbar-scroll-right-help-function nil
 tabbar-help-on-tab-function nil
 tabbar-home-help-function nil
 tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
 tabbar-scroll-left-button (quote (("") ""))
 tabbar-scroll-right-button (quote (("") "")))
