(defun reg-add (lst)
  (cond ((null lst) 0)
        (t (+ (cond ((numberp (car lst)) (car lst))
                    (t 0))
              (reg-add (cdr lst))))))

(reg-add '(2 4 6)) ; 12
(reg-add '(2 4 word 6 nil)) ; 12
(reg-add '(word nil)) ; 0
(reg-add nil) ; 0

