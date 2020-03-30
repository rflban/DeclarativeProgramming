(defun latest (lst)
  (cond ((null (cdr lst)) (car lst))
        (t (latest (cdr lst)))))

(latest nil) ; NIL
(latest '(1)) ; 1
(latest '(1 2 3 (4 5))) ; (4 5)

