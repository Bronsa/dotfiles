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

     hl-paren-colors
     '("red1" "orange1" "yellow1" "green1" "cyan1" "slateblue1" "magenta1" "purple")

     eval-sexp-fu-flash-duration 0.5
     truncate-lines t

     ;;display-buffer-function 'popwin:display-buffer

     show-paren-delay 0
     show-paren-style (quote expression))

;; Make emacs transparent
(set-frame-parameter (selected-frame) 'alpha '(96 96))
(add-to-list 'default-frame-alist '(alpha 96 96))

;; Line-wrapping
(set-default 'fill-column 180)

;; Set faces
(custom-set-faces
 '(linum ((t (:foreground "gray40" :weight bold)))))

(set-face-attribute
 'tabbar-default nil
 :background "gray10")
(set-face-attribute
 'tabbar-unselected nil
 :background "gray10"
 :foreground "gray"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "gray"
 :box nil)

