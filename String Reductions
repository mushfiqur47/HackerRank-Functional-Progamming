(let [line (read-line)]
    (println ((fn [x s ret]
        (if (= x (count line))
            ret
            (let [letter (nth line x)]
                (if (not (contains? s letter))
                    (recur (+ x 1) (conj s letter) (str ret letter))
                    (recur (+ x 1) s ret)
                )
            )   
        )
    ) 0 #{} ""))
)
