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

(defadvice mpc-select (after change-window (&optional event) activate)
  "changes the current window after the selection. \Artists ->Albums, Albums -> Songs"
  (cond ((string= "*MPC Artists*" (buffer-name))
         (mpc-jump-to-albums))
        ((string= "*MPC Albums*" (buffer-name))
         (mpc-jump-to-songs))))

(defadvice mpc-playlist (after change-window (&optional event) activate)
  "changes the current window to Songs"
  (mpc-jump-to-songs))
