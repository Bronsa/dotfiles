(in-ns 'clojure.core)

(defn- print-object [o, ^Writer w]
  (when (instance? clojure.lang.IMeta o)
    (print-meta o w))
  (.write w "#<")
  (let [name (.getSimpleName (class o))]
    (when (seq name) ;; anonymous classes have a simple name of ""
      (.write w name)
      (.write w " ")))
  (.write w (str o))
  (.write w ">"))

(defmethod print-method Throwable [^Throwable o ^Writer w]
  (print-object o w))

(defmethod print-method Object [o ^Writer w]
  (print-object o w))
