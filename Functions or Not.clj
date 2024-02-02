
(ns lab
  (:require [clojure.string :as str]))

(defn read-value []
  (-> (read-line) (str/split #" ") first Integer/parseInt))

(defn func? [lst]
  (if (apply distinct? lst) "YES" "NO"))

(defn solution []
  (let [N (read-value)]
    (repeatedly N (fn []
                    (let [n (read-value)
                          v (repeatedly n #(read-value))]
                      (func? v))))))```

(doseq [ans (solution)]
  (println ans))
