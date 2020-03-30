;;; через функционалы
(defun filter (predicate lst)
  (reverse (reduce #'(lambda (state item)
                       (cond ((funcall predicate item) (cons item state))
                             (t state)))
                   (cons nil lst))))

;;; рекурсивно
(defun filter (predicate lst)
  (cond ((null lst) nil)
        (t (cond ((funcall predicate (car lst))
                  (cons (car lst) (filter predicate (cdr lst))))
                 (t (filter predicate (cdr lst)))))))

;;; общая часть
(defun interval-filter (lst lo hi)
  (filter #'(lambda (item)
              (cond ((numberp item) (or (and (> item lo) (< item hi))
                                        (and (> item hi) (< item lo))))
                    (t nil)))
          lst))

;;; тестирование
(setq lst1 '(-2 4 1 2 4 nil 5 8 12 (555 666) 9 -99 10 7))

(interval-filter lst1 1 10) ; (4 2 4 5 8 9 7)
(interval-filter lst1 10 1) ; (4 2 4 5 8 9 7)
(interval-filter lst1 100 1000) ; NIL
(interval-filter lst1 1 1) ; NIL

