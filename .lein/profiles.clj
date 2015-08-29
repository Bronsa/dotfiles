{:user {:plugins [[bronsa/lein-swank "1.5.0"]
                  [clj-stacktrace "0.2.5"]
                  [lein-vanity "0.1.0"]
                  [jonase/eastwood "0.2.0-SNAPSHOT"]
                  [refactor-nrepl "1.1.0"]
                  [cider/cider-nrepl "0.9.1"]]
        ;; :injections [(set! *print-level* 10)
        ;;              (set! *print-length* 10)]
        :repositorises [["sonatype" "http://oss.sonatype.org/content/repositories/releases"]
                        ["snapshots" "http://oss.sonatype.org/content/repositories/snapshots"]]}}
