(ns lambda.test.core
  (:use [lambda.core])
  (:use [clojure.test]))

(deftest test-λ
  (is ((λ [x] 2) 3) 2))

(deftest test-lambda
  (is ((lambda [x] 2) 3) 2))
