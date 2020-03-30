(defun sqr-nums (nums)
  (cond ((null nums) nil)
        (t (cons (* (car nums) (car nums))
                 (sqr-nums (cdr nums))))))

(sqr-nums nil) ; NIL
(sqr-nums '(1 2 -3 4 5)) ; (1 4 9 16 25)

