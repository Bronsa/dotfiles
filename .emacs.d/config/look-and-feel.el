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

     hl-paren-colors
     '("red1" "orange1" "yellow1" "green1" "cyan1" "slateblue1" "magenta1" "purple")

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
