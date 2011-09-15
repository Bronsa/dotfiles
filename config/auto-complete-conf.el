;;auto-complete mode
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories (concat dotfiles-lib-dir "auto-complete/dict"))

(ac-set-trigger-key "TAB")

(setq ac-auto-show-menu t
      ac-dwim t
      ac-use-menu-map t
      ac-quick-help-delay 1
      ac-quick-help-height 60
      ac-show-menu-immediately-on-auto-complete t
      ac-expand-on-auto-complete t
      ac-use-fuzzy t)
