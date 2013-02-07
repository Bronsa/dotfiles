(setq erc-nick "Bronsa"
      erc-user-full-name "Bronco")

(custom-set-variables
 '(erc-modules '(autojoin completion fill irccontrols list
                          log move-to-prompt netsplit networks
                          noncommands readonly ring services stamp
                          spelling track truncate match scrolltobottom)))

(custom-set-faces
 '(erc-default-face ((t (:foreground "white"))))
 '(erc-input-face ((t (:foreground "white"))))
 '(erc-prompt-face ((t (:foreground "slateblue" :weight bold))))
 '(erc-notice-face ((t (:foreground "red"))))
 '(erc-nick-default-face ((t (:foreground "green"))))
 '(erc-my-nick-face ((t (:foreground "white"))))
 '(erc-timestamp-face ((t (:foreground "gray40"))))
 '(erc-current-nick-face ((t (:foreground "yellow")))))

(add-to-list 'erc-nickserv-alist
             '(Azzurra
               "NickServ!service@azzurra.org"
               "/ns\sIDENTIFY\spassword"
               "NickServ"
               "IDENTIFY"
               nil))

(setq erc-prompt-for-nickserv-password nil
      erc-nickserv-passwords
      '((freenode (("Bronsa" . "")
                   ("Bronsa`" . "")))
        (Azzurra (("Bronsa" . "")
                  ("Bronsa`" . ""))))

      erc-autojoin-channels-alist '((".*\\freenode.net" "#distro" "#carthy" "#clojure")
                                    (".*\\azzurra.org" "#py")                                    )
      erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477")
      erc-track-exclude-server-buffer t
      erc-track-showcount t

      erc-auto-query nil
      erc-fill-column (- (window-width) 2)

      erc-timestamp-only-if-changed-flag nil

      erc-header-line-uses-tabbar-p t

      erc-log-channels-directory "~/irclogs"
      erc-save-buffer-on-part t

      erc-interpret-mirc-color t
      erc-input-line-position -2
      erc-prompt ">"

      erc-track-shorten-function nil

      erc-spelling-dictionaries '(("#clojure" "american")
                                  ("#distro" "italian")
                                  ("#carthy" "italian")
                                  ("#py" "italian")))

(defun irc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (progn
    (erc :server "irc.freenode.net" :port 6667)
    (erc :server "irc.azzurra.org" :port 6667)))
