
(def TARGET (Integer/parseInt (read-line)))
(def POWER (Integer/parseInt (read-line)))

; My own integer power fn
(defn exp [b pow] (reduce * (repeat pow b)))

; List of POWERed numbers <= TARGET
(def raised (->> (iterate inc 1) 
              (map #(exp % POWER)) 
              (take-while #(<= % TARGET))))

; Recursive fn
(defn sum-of-powers [sum powers]
	(if (empty? powers)     ; failed - 0 solutions here
		0
    (let [[fp & rp] powers]   ; break list of powers into 1st and rest
      (cond
        (= fp sum)     ; perfect match, so 1 more solution
            1
        (> fp sum)     ; 1st is too big to contribute to solution
            (sum-of-powers sum rp)    ; so calculate it with rest
        true      ; general case: try both with and without 1st
            (+ (sum-of-powers (- sum fp) rp) 
               (sum-of-powers sum rp))))))

(println (sum-of-powers TARGET raised))
