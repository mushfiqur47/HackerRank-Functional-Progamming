(ns crossword.core)

(def ROWS 10)
(def COLS 10)

(defn read-input []
    (let [ls (for [_ (range (inc ROWS))] (read-line))
            xword (take ROWS ls)
            word-list (first (drop ROWS ls))
            words (re-seq #"\w+" word-list)]
        {:xword xword :words words}))

(defn index-h [xcos y]
  (interleave xcos (repeat y)))

(defn index-v [ycos x]
  (interleave (repeat x) ycos))

(defn index-line [index-fn co-1 line]
  (->> line
    (map-indexed #(vector %2 %1))
    (partition-by first)
    (filter #(> (count %) 1))
    (filter #(= (first (first %)) \-))
    (map #(map second %))
    (map #(partition 2 (index-fn % co-1)))))
    
(defn extract-slots [index-fn slots]
      (->> slots
        (map-indexed (partial index-line index-fn))
        (filter seq)
        (apply concat)))

(defn permute [s]
  (if (< (count s) 2) 
    (list s)
    (for [e1 s 
          s2 (permute (remove #(= % e1) s))]
      (cons e1 s2))))

(defn place [word slot assignments]
  (loop [wrd word slo slot ass assignments]
    (if-let [[w1 & rw] wrd]
      (let [[s1 & rs] slo]
        ; (println "      s1" s1 "get" (get ass s1))
        (if-let [cs (get ass s1)]
          (when (= w1 cs)
            (recur rw rs ass))
          (place rw rs (assoc ass s1 w1))))
      ass)))

(defn try-wds [words slots assignments]
  (loop [wds words sls slots ass assignments]
    (if (empty? wds)
      ass
      (let [[w1 & rw] wds [s1 & rs] sls]
        (if-let [ras (place w1 s1 ass)]
          (recur rw rs ras))))))

(defn print-grid [ass]
  (doseq [y (range ROWS)]
    (do
      (doseq [x (range COLS) :let [xy (list x y)]]
        (if-let [c (get ass xy)]
          (print c)
          (print "+"))))
      (newline)))

(let [{:keys [xword words]} (read-input)
      marks-h (map seq xword)
      marks-v (partition ROWS (apply interleave marks-h))
      indexed-h (extract-slots index-h marks-h)
      indexed-v (extract-slots index-v marks-v)
      slots (concat indexed-h indexed-v)
      trial (fn [wds]
              (and
                (reduce #(and %1 %2) (map #(= (count %1) (count %2)) slots wds))
                (try-wds wds slots {}))) 
      solution (some trial (permute words))]
      (print-grid solution))
