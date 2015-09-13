{:user {:plugins [#_[cider/cider-nrepl "0.9.1"]
                  #_[refactor-nrepl "1.1.0"]
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  [refactor-nrepl "1.2.0-SNAPSHOT"]]

        :dependencies [[org.clojure/tools.nrepl "0.2.10"]]
        #_#_:injections [(set! *print-level* 10)
                         (set! *print-length* 10)]
        :repositorises [["sonatype" "http://oss.sonatype.org/content/repositories/releases"]
                        ["snapshots" "http://oss.sonatype.org/content/repositories/snapshots"]]}}
