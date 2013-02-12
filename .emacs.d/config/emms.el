;; (require 'emms-info-libtag)
;; (require 'emms-lastfm-scrobbler)

;; (setq emms-lastfm-username "Bronsa"
;;       emms-lastfm-password "")
;; ;;emms-lastfm-enable
;; ;; (emms-lastfm-activate)
;; (emms-devel)
;; (emms-default-players)
;; (setq emms-source-file-default-directory "/media/Music"
;;       emms-source-directory-tree "/media/Music"
;;       emms-info-functions '(emms-info-libtag)
;;       emms-cache-file-coding-system 'utf-8
;;       emms-i18n-default-coding-system '(utf-8 . utf-8))

;; (define-key emms-browser-mode-map (kbd "W W") 'emms-browser-lookup-multi)

;; (setq emms-browser-get-track-field-function
;;             'emms-browser-get-track-field-use-directory-name)


;; (defun emms-browser-lookup-multi ()
;;   (interactive)
;;   (emms-browser-lookup-wikipedia 'info-artist)
;;   (emms-browser-lookup-wikipedia 'info-album)
;;   (emms-browser-lookup-pitchfork 'info-artist))
