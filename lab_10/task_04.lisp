(defun alloddr (lst)
  (cond ((null lst) t)
        ((evenp (car lst)) nil)
        (t (alloddr (cdr lst)))))

(alloddr '(1 2 3)) ; nil
(alloddr '(1 3 5)) ; nil

