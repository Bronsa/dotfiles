;; set theme
(color-theme-subdued)

;;enable visual feedback on selections
(setq-default transient-mark-mode t)

(setq
     ;; Don't show a cursor in other windows
     cursor-in-non-selected-windows nil
     ;; remove splash-screen
     inhibit-splash-screen t
     initial-scratch-message nil

     linum+-smart-format "%%%dd "

     redisplay-dont-pause t
     scroll-margin 1
     scroll-step 1
     scroll-conservatively 10000
     scroll-preserve-screen-position 1

     eval-sexp-fu-flash-duration 0.5
     truncate-lines t

     show-paren-delay 0
     show-paren-style (quote expression))

;; Line-wrapping
(set-default 'fill-column 180)

;; Set faces
(custom-set-faces
 '(which-func ((t (:foreground "#729fcf"))))
 '(linum ((t (:foreground "gray35" :weight bold))))
 '(eval-sexp-fu-flash ((t (:background "gray50" :weight bold)))))

(set-face-attribute
 'tabbar-default nil
 :background "gray10")
(set-face-attribute
 'tabbar-unselected nil
 :background "gray10"
 :foreground "gray60")
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "gray75"
 :weight 'bold)

(set-face-attribute
 'ac-clang-candidate-face nil
 :background "gray60"
 :foreground "black")
(set-face-attribute
 'ac-clang-selection-face nil
 :background "gray20"
 :foreground "black")

(setq-default
 mode-line-format
 (list
  ;; the buffer name; the file name as a tool tip
  '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))

  '(vc-mode vc-mode)

  ;; line and column
  " (" ;; '%02' to set to 2 chars at least; prevents flickering
  (propertize "%l" 'face 'font-lock-type-face)
  ","
  (propertize "%02c" 'face 'font-lock-type-face)
  ") "

  ;; relative position, size of file
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "] "

  '(:eval erc-modified-channels-object)

  '(:eval (when (not (string= erc-modified-channels-object ""))
            (propertize " ")))

  "["
  '(:eval (propertize (format "%s" new-mail)
                     'face (if (> new-mail 0)
                               'font-lock-warning-face
                             'font-lock-constant-face)))
  "/"
  '(:eval (propertize (format "%s" total-mail)
                      'face 'font-lock-constant-face))
  "] "

  ;; the current major mode for the buffer.
  "["

  '(:eval (propertize "%m" 'face 'font-lock-string-face
                      'help-echo buffer-file-coding-system))
  "]"


  ;; overwrite mode?
  '(:eval (propertize (when overwrite-mode " Ins")
                      'face 'font-lock-warning-face
                      'help-echo "Buffer is in overwrite mode"))

  ;; was this buffer modified since the last save?
  '(:eval (when (buffer-modified-p)
            (propertize " Mod"
                        'face 'font-lock-warning-face
                        'help-echo "Buffer has been modified")))

  ;; is this buffer read-only?
  '(:eval (when buffer-read-only
            (propertize " RO"
                        'face 'font-lock-type-face
                        'help-echo "Buffer is read-only")))
  " -- "

  ;; add the time, with the date and the emacs uptime in the tooltip
  '(:eval (propertize (format-time-string "%H:%M")
                      'help-echo
                      (concat (format-time-string "%c; ")
                              (emacs-uptime "Uptime:%hh"))))
  " --"

  minor-mode-alist  ;; list of minor modes
  " %-" ;; fill with '-'
  ))

(set-face-background 'magit-item-highlight "gray15")
(set-face-background 'magit-diff-hunk-header "gray15")
(set-face-background 'magit-diff-file-header "gray15")
(set-face-background 'magit-diff-add "gray15")
(set-face-background 'magit-diff-del "gray15")
(set-face-foreground 'magit-diff-add "dark sea green")
(set-face-foreground 'magit-diff-del "brown3")

(set-face-background 'diff-hunk-header "gray15")
(set-face-background 'diff-file-header "gray15")
(set-face-background 'diff-added "gray15")
(set-face-background 'diff-removed "gray15")
(set-face-foreground 'diff-added "dark sea green")
(set-face-foreground 'diff-removed "brown3")
(set-face-background 'diff-header "gray15")

(custom-set-faces
 '(message-header-cc ((t (:foreground "color-33"))))
 '(message-header-newsgroups ((t (:foreground "color-33" :slant italic :weight bold))))
 '(message-header-subject ((t (:foreground "brightblue" :weight bold))))
 '(message-header-to ((t (:foreground "color-33" :weight bold)))))
