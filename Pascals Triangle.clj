
(let [i (read-string (read-line))] 
  (defn append [seq & {:keys [to] :or {to []}}]
    (conj to seq))

  (defn form-rest
    [input-seq & {:keys [column output]
                  :or {column 1 output []}}]

    (let [sum-seq (+ (or (first input-seq) 0) 
                     (or (second input-seq) 0))
          seq (flatten (list (append sum-seq :to output)))]
      (if (empty? input-seq)
        (drop-last seq)
        (form-rest (nthrest input-seq 1)
                   :column (inc column)
                   :output (vec seq)))))

  (defn form-seq [seq]
    (flatten [(first seq) (form-rest seq)]))

  (defn triangle
    [input & {:keys [row output]
              :or {row 1 output []}}]

    (let [seq (cond (or (<= input 1) (= row 1)) '(1)
                    :else (form-seq (last output)))]
      (cond
        (<= input 1)
        (append seq :to output)

        (= row 1)
        (triangle input
                  :row (inc row)
                  :output (append seq :to output))

        (< row input)
        (triangle input
                  :row (inc row)
                  :output (append seq :to output))

        :else
        (append seq :to output))))

  (doseq [row (triangle i)]
    (apply prn row)))
