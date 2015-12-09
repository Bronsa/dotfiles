{:user {:plugins [;[lein-nodisassemble "0.1.3"]
                  [cider/cider-nrepl "0.11.0-SNAPSHOT"
                   :exclusions [org.clojure/tools.nrepl]]
                  [lein-vanity "0.2.0"]
                  ;[refactor-nrepl "1.2.0-SNAPSHOT"]
                  ]

        :dependencies [[org.clojure/tools.nrepl "0.2.12"]]
        #_#_:injections [(set! *print-level* 10)
                         (set! *print-length* 10)]
        :repositorises [["sonatype" "http://oss.sonatype.org/content/repositories/releases"]
                        ["snapshots" "http://oss.sonatype.org/content/repositories/snapshots"]]}}
