(ns lambda.core)

(defmacro λ [& sigs] `(fn ~@sigs))

(defmacro lambda [& sigs] `(fn ~@sigs))

(defmacro deλ [& sigs] `(defn ~@sigs))
