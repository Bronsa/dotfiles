;; (font-lock-add-keywords
;;  'clojure-mode `(("(\\(fn\\>\\)"
;;                   (0 (progn (compose-region (match-beginning 1)
;;                                             (match-end 1) "λ")
;;                             nil)))))

;; (font-lock-add-keywords
;;   'clojure-mode `(("\\(#\\)("
;;                    (0 (progn (compose-region (match-beginning 1)
;;                                              (match-end 1) "ƒ")
;;                              nil)))))
(define-clojure-indent
  (describe 'defun)
  (testing 'defun)
  (given 'defun)
  (using 'defun)
  (with 'defun)
  (it 'defun)
  (do-it 'defun))
