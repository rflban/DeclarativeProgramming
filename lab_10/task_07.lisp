(defun help1 (lst lodd)
  (cond ((null lst) lodd)
        (t (help1 (cdr lst)
                  (cond ((oddp (car lst)) (car lst))
                        (t lodd))))))

(defun lastest-odd (lst)
  (help1 lst nil))

(lastest-odd nil) ; NIL
(lastest-odd '(2 4 6 8)) ; NIL
(lastest-odd '(1 2 3 4 5 6 7 8 9 -1 10)) ; -1

