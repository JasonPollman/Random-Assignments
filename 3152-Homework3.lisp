; JASON POLLMAN
; ITCS 3152-091
; 9/22/13

; QUESTION 1
(defun factorial (n)
  "Returns the Factorial of n"
  (if (< n 2)
      1 ; Return 1 if n < 2
      (* n (factorial (- n 1))))) ; Otherwise n * n-1, recursively until n = 1


; QUESTION 2
(defun getfib (n)
  "Helper Function for fibonacci function to compute the Fibonacci Number"
  (labels ((calc-fib (n a b)
    (if (= n 0)
      a
      (calc-fib (- n 1) b (+ a b)))))
    (calc-fib n 0 1)))

(defun printfib (start end)
  "Prints the Fibonacci Numbers from start number to end number"
  (print (getfib start))
  (if (< start end)
    (printfib (+ start 1) end)))

(defun fibonacci (n)
  "Prints the first 20 Fibonacci numbers from 1 to n"
  (if (< n 20)
    (printfib 0 n)
    (printfib 0 20)))


; QUESTION 3
(defun mysort (x)
  "Sorts list x by element types"
  (let ((string-elems '()) (symbol-elems '()) (numeric-elems '()) (sorted '()))
    (loop for elem in x do
      (cond
        ; Add each element to its respective list.
        ((stringp elem) (setq string-elems (append string-elems (list elem))))
        ((symbolp elem) (setq symbol-elems (append symbol-elems (list elem))))
        ((numberp elem) (setq numeric-elems (append numeric-elems (list elem))))))

    ; Sort the elements...
    (sort string-elems #'string<)
    (sort symbol-elems #'string<)
    (sort numeric-elems #'<)

    ; Concatenate the 3 lists together...
    (setq sorted (concatenate 'list string-elems symbol-elems numeric-elems))
    sorted))


; QUESTION 4A
(defstruct defStructures
  (point-a '(3 2))
  (point-b '(1 1)))


; QUESTION 4B
(defun distance (p1 p2)
  "Returns the distance between two 2-dimensional points"
  (abs (sqrt (+ (expt (- (first p2) (first p1)) 2) (expt (- (nth 1 p2) (nth 1 p1)) 2)))))

(defun midpoint (k)
  "Returns the midpoint of the line segment connecting two points"
  (let ((mid '()))
    (if (not (defStructures-p k))
      ; If it's not of the correct type, return nil.
      nil
      (and
        ; Else add the points into local variable mid using the midpoint formula (((x1 + x2)/2), ((y1 + y2)/2))...
        (setf mid (cons (/ (+ (first (defStructures-point-a k)) (nth 1 (defStructures-point-b k))) 2) mid))))
        (setf mid (cons (/ (+ (first (defStructures-point-a k)) (nth 0 (defStructures-point-b k))) 2) mid))
  mid))


; QUESTION 5A
(defun first-elements (x n)
  "Return the first n elements in list x"
  (if (> (+ 1 (length x)) n)
    (let ((temp '())) ; Set a temporary list to return the first n elements in list x
      (loop for i from 0 to (- n 1) do
        (setq temp (append temp (list (nth i x)))))
      temp)
    ; If the n is greater than the list's length, return message...
    "You've requested more elements than exist in the list."))


; QUESTION 5B
(defun nth-element (x n)
  (if (or (> n (list-length x)) (<= n 0))
    "You've requested an element outside the bounds of the list."
    (nth (- n 1) x)))


; QUESTION 5C
(defun middle (x)
  "Returns the middle element in the list x"
  (let ((temp 0) (temp2 0))
    (if (evenp (list-length x))
      ; If the list contains an even number of elements...
      (and
        (and
          (setq temp (nth (/ (list-length x) 2) x))
          (setq temp2 (nth (- (/ (list-length x) 2) 1) x))
          (list temp2 temp)))
      ; If the list contains an odd number of elements...
      (setq temp (nth (floor (/ (list-length x) 2)) x)))))


; QUESTION 6
(defun intersectp (k1 k2)
  "Determines whether or not line segment k1 intersects line segment k2"
  (cond
    ((not (defStructures-p k1)) "The first arugment must be of type defStructures")
    ((not (defStructures-p k2)) "The second arugment must be of type defStructures")
    (T
      (let ((slopek1 0) (slopek2 2))
        (setf slopek1 (/ (- (nth 1 (defStructures-point-b k1)) (nth 1 (defStructures-point-a k1))) (- (nth 0 (defStructures-point-b k1)) (nth 0 (defStructures-point-a k1)))))
        (setf slopek2 (/ (- (nth 1 (defStructures-point-b k2)) (nth 1 (defStructures-point-a k2))) (- (nth 0 (defStructures-point-b k2)) (nth 0 (defStructures-point-a k2)))))
        (if (= slopek1 slopek2)
          nil)) ; The line segments slopes are equal, therefore they don't intersect
      (loop for v from (nth 0 (defStructures-point-b k1)) to (nth 0 (defStructures-point-a k1)) do
        (loop for w from (nth 1 (defStructures-point-b k2)) to (nth 1 (defStructures-point-a k2)) do
          (if 
            (and
              (= (+ (* v (nth 0 (defStructures-point-a k1))) (* (- 1 v) (nth 0 (defStructures-point-b k1))))
                 (+ (* v (nth 0 (defStructures-point-a k2))) (* (- 1 v) (nth 0 (defStructures-point-b k2)))))
              (= (+ (* w (nth 1 (defStructures-point-a k1))) (* (- 1 w) (nth 1 (defStructures-point-b k1))))
                 (+ (* w (nth 1 (defStructures-point-a k2))) (* (- 1 w) (nth 1 (defStructures-point-b k2))))))
          (setf  intersect t)
          (setf  intersect nil)))))))

(defun onsegment (x1 y1 x2 y2 x3 y3)
  "Returns T if point (x3, y3) is on line segment [(x1, y1), (x2, y2)]"
  (= (- (* (- x2 x1) (- y3 y1)) (* (- x3 x1) (- y2 y1))) 0))
  

