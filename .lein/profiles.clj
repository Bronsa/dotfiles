{:user {:plugins [[bronsa/lein-swank "1.5.0"]
                  [lein-exec "0.2.1"]
                  [lein-simpleton "1.1.0"]
                  [clj-stacktrace "0.2.5"]]}
 :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                     'print-cause-trace)
                    new (ns-resolve (doto 'clj-stacktrace.repl require)
                                    'pst)]
                (alter-var-root orig (constantly @new)))]}
