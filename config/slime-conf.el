(setq slime-protocol-version 'ignore)
(setq inferior-lisp-program  "lein repl")
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-scratch slime-fancy slime-fuzzy slime-repl))
