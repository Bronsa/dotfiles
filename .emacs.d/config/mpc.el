(setq mpc-browser-tags '(Artist Album)
      mpc-songs-format "%3{Track} %25{Title} %-5{Time}")

(defun mpc-toggle-pause ()
  (interactive)
  (cond
   ((member (cdr (assq 'state (mpc-cmd-status))) '("pause"))
    (mpc-resume))
   ((member (cdr (assq 'state (mpc-cmd-status))) '("play"))
        (mpc-pause))))

(defmacro mpc-sel-window (name)
  `(select-window
    (get-buffer-window
     (get-buffer ,name) t)))

(defun mpc-jump-to-artists () (interactive) (mpc-sel-window "*MPC Artists*"))
(defun mpc-jump-to-albums () (interactive) (mpc-sel-window "*MPC Albums*"))
(defun mpc-jump-to-songs () (interactive) (mpc-sel-window "*MPC-Songs*"))

(define-key mpc-mode-map (kbd "j") #'mpc-select)
(define-key mpc-mode-map (kbd "s") #'mpc-songs-search)
(define-key mpc-mode-map (kbd "y") #'mpc-playlist-add)
(define-key mpc-mode-map (kbd "k") #'mpc-playlist-delete)
(define-key mpc-mode-map (kbd "M-RET") #'mpc-play-at-point)
(define-key mpc-mode-map (kbd "M-j") #'mpc-play-at-point)
(define-key mpc-mode-map (kbd "SPC") #'mpc-toggle-pause)
(define-key mpc-mode-map (kbd "m") #'mpc-select-toggle)
(define-key mpc-mode-map (kbd "S-SPC") #'mpc-select-extend)
(define-key mpc-mode-map (kbd "n") #'mpc-next)
(define-key mpc-mode-map (kbd "p") #'mpc-prev)
(define-key mpc-mode-map (kbd "l") #'mpc-playlist)
(define-key mpc-mode-map (kbd "M-s") #'mpc-play)
(define-key mpc-mode-map (kbd "M-a") #'mpc-jump-to-albums)
(define-key mpc-mode-map (kbd "a") #'mpc-jump-to-artists)

(defadvice mpc-select (after change-window (&optional event) activate)
  "changes the current window after the selection. \Artists ->Albums, Albums -> Songs"
  (cond ((string= "*MPC Artists*" (buffer-name))
         (mpc-jump-to-albums))
        ((string= "*MPC Albums*" (buffer-name))
         (mpc-jump-to-songs))))

(defadvice mpc-playlist (after change-window (&optional event) activate)
  "changes the current window to Songs"
  (mpc-jump-to-songs))
