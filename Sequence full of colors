
(doseq [_ (range (Integer/parseInt (read-line)))]
    (loop [rg 0 yb 0 str (read-line)]
        (if (empty? str)
            (println (if (and (= rg 0) (= yb 0)) "True" "False"))
            (let [[c & cs] str]
                (cond
                    (= c \R)
                        (if (pos? rg)
                            (println "False")
                            (recur (inc rg) yb cs))
                    (= c \G)
                        (if (neg? rg)
                            (println "False")
                            (recur (dec rg) yb cs))
                    (= c \Y)
                        (if (pos? yb)
                            (println "False")
                            (recur rg (inc yb) cs))
                    (= c \B)
                        (if (neg? yb)
                            (println "False")
                            (recur rg (dec yb) cs)))))))
