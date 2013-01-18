{:user {:plugins [[lein-swank "1.4.4"]
                  [lein-exec "0.2.1"]
                  [clj-stacktrace "0.2.5"]]}
 :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                     'print-cause-trace)
                    new (ns-resolve (doto 'clj-stacktrace.repl require)
                                    'pst)]
                (alter-var-root orig (constantly @new)))]}
