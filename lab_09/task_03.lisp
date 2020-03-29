;;; через функционалы
(defun mul1 (lst num)
  (mapcar #'(lambda (item)
              (* num item))
          lst))

(defun mul2 (lst num)
  (mapcar #'(lambda (item)
              (cond ((numberp item) (* num item))
                    (t item)))
          lst))

;;; рекурсивно
(defun mul1 (lst num)
  (cond ((null lst) nil)
        (t (cons (* (car lst) num) (mul1 (cdr lst) num)))))

(defun mul2 (lst num)
  (cond ((null lst) nil)
        (t (cons (cond ((numberp (car lst)) (* (car lst) num))
                       (t (car lst)))
                 (mul2 (cdr lst) num)))))

;;; тестирование
(setq nums '(4 21 5 43 31 8))
(setq vals '(4 nil 5 43 (5 7) 8))

(identity nums)
(mul1 nums 4)

(identity vals)
(mul2 vals 4)

