;; set theme
(color-theme-subdued)

;;enable visual feedback on selections
(setq-default transient-mark-mode t)

(set-frame-font "DejaVu Sans Mono-8")

(setq
     ;; Don't show a cursor in other windows
     cursor-in-non-selected-windows nil
     ;; remove splash-screen
     inhibit-splash-screen t
     initial-scratch-message nil

     ;;nicely format the ibuffer and include git-status
     buffer-formats '((mark modified read-only git-status-mini " "
                            (name 18 18 :left :elide)
                            " "
                            (size 9 -1 :right)
                            " "
                            (git-status 8 8 :left :elide)
                            " "
                            (mode 16 16 :left :elide)
                            " " filename-and-process))

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
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] "

  '(:eval erc-modified-channels-object)

  '(:eval (when (not (string= erc-modified-channels-object ""))
            (propertize " ")))

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
