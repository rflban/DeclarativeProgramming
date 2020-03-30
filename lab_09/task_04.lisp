;;; через функционалы
(defun sub10 (lst)
  (mapcar #'(lambda (val)
              (cond ((numberp val) (- val 10))
                    (t val)))
          lst))

;;; рекурсивно
(defun sub10 (lst)
  (cond ((null lst) nil)
        (t (cons (cond ((numberp (car lst)) (- (car lst) 10))
                       (t (car lst)))
                 (sub10 (cdr lst))))))

;;; тестирование
(setq lst1 '(-2 4 1 2 4 nil 5 8 12 (555 666) 9 -99 10 7))

(sub10 lst1) ; (-12 -6 -9 -8 -6 NIL -5 -2 2 (555 666) -1 -109 0 -3)

