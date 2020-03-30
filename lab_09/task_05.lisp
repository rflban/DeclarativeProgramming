;;; через функционалы
(defun find-no-empty (lst)
  (reduce #'(lambda (val1 val2) (or val1 val2))
          (mapcar #'(lambda (item)
                      (cond ((listp item) item)
                            (t nil)))
                  lst)))

;;; рекурсивно
(defun find-no-empty (lst)
  (cond ((null lst) nil)
        ((and (not (null (car lst)))
              (listp (car lst))) (car lst))
        (t (find-no-empty (cdr lst)))))

;;; тестирование
(find-no-empty '(1 23 nil -6 Word (1 2 3) () 66 (4 5 6))) ; (1 2 3)
(find-no-empty '((3 4))) ; (3 4)
(find-no-empty '(1 2)) ; nil
(find-no-empty  '()) ; nil

