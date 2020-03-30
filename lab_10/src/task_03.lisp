(defun recnth (idx lst)
  (cond ((or (= 0 idx)
             (null lst)) (car lst))
        (t (recnth (- idx 1) (cdr lst)))))

(nth 0 '(1 2 3)) ; 1
(nth 2 '(1 2 3)) ; 3
(nth 1 '(1 2 3)) ; 2
(nth 5 '(1 2 3)) ; NIL

(recnth 0 '(1 2 3)) ; 1
(recnth 2 '(1 2 3)) ; 3
(recnth 1 '(1 2 3)) ; 2
(recnth 5 '(1 2 3)) ; NIL

