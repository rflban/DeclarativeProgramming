(defun sum-first (nums n)
  (cond ((or (= 0 n)
             (null nums)) 0)
        (t (+ (car nums)
              (sum-first (cdr nums) (- n 1))))))

(defun sum-last (nums n)
  (cond ((null nums) 0)
        (t (+ (sum-last (cdr nums) (- n 1))
              (cond ((> n 0) 0)
                    (t (car nums)))))))

(defun help1 (nums n)
  (cond ((or (null nums) (= 0 n)) 0)
        (t (+ (car nums)
              (help1 (cdr nums) (- n 1))))))

(defun help2 (nums n)
  (cond ((or (null nums) (= 0 n)) 0)
        ((> (car nums) 0) (help1 nums n))
        (t (help2 (cdr nums) (- n 1)))))

(defun sum-to-last-pos (nums n)
  (help2 (reverse nums) (- (length nums) n)))

(defun sum-range (nums lo hi h)
  (cond ((or (= 0 hi)
             (null nums)) 0)
        (t (+ (sum-range (cdr nums)
                         (cond ((= lo 0) h)
                               (t (- lo 1)))
                         (- hi 1)
                         h)
              (cond ((> lo 0) 0)
                    (t (car nums)))))))

(setq nums '(0 1 2 3 4 5 6 7 8 9))

(sum-first nums 5) ; 10
(sum-first nums 0) ; 0
(sum-first nums 1) ; 0
(sum-first nums 2) ; 1
(sum-first nums 10) ; 45

(sum-last nums 5) ; 35
(sum-last nums 9) ; 9
(sum-last nums 0) ; 45
(sum-last nums 10) ; 0

(sum-to-last-pos nums 5) ; 35
(sum-to-last-pos '(-1 2 3 4 -1) 2) ; 7
(sum-to-last-pos (concatenate 'list nums '(-10 5 -7 -9 -2)) 5) ; 30

(sum-range nums 1 9 2) ; 12
(sum-range nums 0 10 0) ; 45
(sum-range nums 0 10 1) ; 20
(sum-range nums 1 10 1) ; 25

