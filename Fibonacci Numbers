
(defn fibr [num]
    (loop [i 0 j 1 n num]
        (if (> n 1)
            (recur j (+ i j) (- n 1))
            i)))

(println (fibr (Integer/parseInt (read-line))))
