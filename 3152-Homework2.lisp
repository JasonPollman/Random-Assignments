; JASON JAMES POLLMAN
; ITCS-3152-091
; 9/8/13


; QUESTION 4B.i
(defun question4bi(courseList designator)
  "PRINT ALL COURSES FROM COURSE LIST IF THEY BELONG TO COURSE 'DESIGNATOR'"
  (print (format nil "Your ~A courses are:" designator))
  ; LOOP THROUGH THE LIST
  (loop for course in courseList do
    (if (equal (nth 0 course) designator) ; FUNCTION (nth 1 course) RETURNS THE 1ST ELEMENT IN THE SUB-LIST
    ; IF THE FIRST ELEMENT IN EACH SUB-LIST IS EQUAL TO THE DESIGNATOR THEN PRINT IT...
      (print (format nil "~A-~A" designator (nth 1 course)))
    )
  )
)

; QUESTION 4B.ii
(defun question4bii(courseList)
  "PRINTS ALL UPPER LEVEL COURSES (3XXX/4XXX)"
  (print "You're courses at or above the Junior Level:")
  (loop for course in courseList do
    ; IF THE COURSE NUMBER IS GREATOR THAN 3000, THEN PRINT IT...
    (if (>= (nth 1 course) 3000) (print (format nil "~A ~A" (nth 0 course) (nth 1 course))))
  )
)

; QUESTION 4B.iii
(defun question4biii(courseList)
  "RETURNS THE NUMBER OF COURSES THAT ARE EITHER ITIS OR ITCS"
  (setq i 0) ; COUNTER
  (loop for course in courseList do
    (if (or (equal (nth 0 course) 'ITCS) (equal (nth 0 course) 'ITIS))
      ; IF FIRST ITEM IN LIST (COURSE DESIGNATOR) == 'ITCS' || 'ITIS' INCREASE THE COUNTER
      (setq i (+ i 1))
    )
  )

  i ; RETURN THE VALUE OF i
)

; QUESTION 4B.iv
(defun question4biv(courseList)
  "DETERMINES WHETHER A STUDENT'S COURSE LIST IS 'EASY', 'MODERATE', OR 'HARD'"
  (setq upperLevel 0) ; COUNTS THE NUMBER OF UPPER-LEVEL COURSES
  (setq itCourse 0)   ; COUNTS THE NUMBER OF ITCS OR ITIS COURSES
  (setq numCourses 0) ; COUNTS THE TOTAL NUMBER OF COURSES

  (loop for course in courseList
    do
      (if(or (equal (nth 0 course) 'ITCS) (equal (nth 0 course) 'ITIS))
        ; IF THE COURSE IS ITCS OR ITIS INCREMENT itCourse
        (incf itCourse)
        ; ELSE SEE IF IT'S AN UPPER-LEVEL COURSE AND INCREMENT upperLevel IF IT IS...
        (if(>= (nth 1 course)) (incf upperLevel))
      )

      ; INCREASE THE NUMBER OF COURSES
      (incf numCourses)
  )

  (cond
    ; IF COURSES ARE ALL UPPER-LEVEL          => RETURN HARD
    ; IF COURSES ARE ALL ITCS OR ITIS         => RETURN HARD
    ; IF NO COURSES ARE UPPER-LEVEL           => RETURN EAST
    ; IF NO COURSES ARE EITHER ITCS OR ITIS   => RETURN EASY
    ; ELSE                                    => RETURN MODERATE

    ((equal numCourses upperLevel) "Hard")
    ((equal numCourses itCourse) "Hard")
    ((equal 0 upperLevel) "Easy")
    ((equal 0 itCourse) "Easy")
    (T "Moderate")
  )
)

; QUESTION 5.A
(defun question5a(num1 num2)
  "RETURNS ALL NUMBERS IN RANGE num1 TO num2 INCLUSIVE"
  (setq listNums '()) ; SET listNums TO AN EMPTY LIST
  (loop for i from num1 to num2 do
    ; SET listNums TO ITSELF AND ADD num1 TO THE LIST
    (setq listNums (cons num1 listNums))
    ; INCREMENT num1
    (incf num1)
  )

  ; CAN'T GET append TO WORK RIGHT, SO REVERSE cons'd LIST...
  ; RETURN THE LIST IN THE CORRECT ORDER
  (nreverse listNums)
)

; QUESTION 5.B
(defun question5b(num)
  "CHECKS THE ARGUMENT TO SEE IF IT IS A PRIME NUMBER AND RETURNS TRUE IF II IS, FALSE OTHERWISE"
  (cond
    ; 1 IS NOT PRIME
    ((= 1 num) NIL)
    ; 2 IS PRIME
    ((= 2 num) T)
    ; 3 IS PRIME
    ((= 3 num) T)
    ; IF num IS AN EVEN NUMBER, IT'S NOT PRIME
    ((evenp num) NIL)
    (T
      (setq count 0)
      ; LOOP FROM 3 TO THE INTEGER-PART OF THE SQUAREROOT OF num (isqrt)
      (loop for i from 3 to (isqrt num) do
        (if (zerop(mod num i)) (incf count)) ; IF num%i == TRUE, INCREASE THE "NOT PRIME" COUNTER
      )

      (cond
        ((= 0 count) T) ; IF count == 0, THE NUMBER IS PRIME
        (T NIL) ; ELSE RETURN NIL
      ) 
    )
  )
)

; QUESTION 5.C
(defun question5c
  "GENERATES A LIST OF NUMBERS FROM 2 TO 50 AND PRINTS OUT THE PRIMES"
  (setq nums (question5a 2 50)) ; SET nums TO THE LIST RETURNED BY question5a

  (loop for i in nums do ; LOOP THROUGH EACH NUMBER ON THE LIST nums
    ; CHECK TO SEE IF THAT NUMBER IS PRIME BY CALLING question5b
    (if (question5b i) ; IF question5b IS TRUE, PRINT THE NUMBER
      (print i)
    )
  )
)
