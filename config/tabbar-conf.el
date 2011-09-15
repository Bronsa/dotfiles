(setq tabbar-buffer-groups-function
      (lambda ()
        (list (cond
               ((memq major-mode '(shell-mode term-mode eshell-mode))
                "Shell")
               ((or (equal (current-buffer) "*slime-source*") (memq  major-mode '(slime-mode slime-repl-mode compilation-mode sldb-mode slime-inspector-mode)))
                "Slime")
               ((memq major-mode
                      '(erc-mode))
                "ERC")
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
                                (equal "*swank*" (buffer-name b))
                                (equal "*Help*" (buffer-name b))
                                (equal ".newsrc-dribble" (buffer-name b))
                                (equal "*Buffer List*" (buffer-name b))
                                (equal "*slime-events*" (buffer-name b))
                                (equal "*Shell Command Output*" (buffer-name b))
                                (equal "*inferior-lisp*" (buffer-name b))
                                (equal "*elein-swank*" (buffer-name b))
                                (equal "*Ido Completions*" (buffer-name b))
                                (equal "*Completions*" (buffer-name b))
                                (equal "*Compile-Log*" (buffer-name b))
                                (equal "*Process List*" (buffer-name b))
                                (equal "*Disabled Command*" (buffer-name b))) nil)
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
