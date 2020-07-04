(setq l1 '(Россия Франция Германия))
(setq l2 '(Москва Париж Берлин))

l1
l2

(defun f1 (l1 l2)
  (cond ((cdr l1)
         (cons (list (car l1) (car l2))
               (f1 (cdr l1) (cdr l2))))
        (t
         (list (list (car l1) (car l2))))))

(defun f2 (l1 l2)
  (cond ((cdr l1)
         (cons (cons (car l1) (car l2))
               (f2 (cdr l1) (cdr l2))))
        (t
         (list (cons (car l1) (car l2))))))

(f1 l1 l2)
(f2 l1 l2)

(defun f1_ (l1 l2)
  (mapcar #'list l1 l2))

(defun f2_ (l1 l2)
  (mapcar #'cons l1 l2))

(setq employees '(Ivan Petr Alexandr Dmitriy Andrey))
(setq salaries '(50000 30000 55000 10000 200000))

(f1_ employees salaries)
(f2_ employees salaries)

(defun f1_sum (pairs)
  (reduce #'+ (mapcar #'cadr pairs)))

(defun f2_sum (pairs)
  (reduce #'+ (mapcar #'cdr pairs)))

(f1_sum (f1_ employees salaries))
(f2_sum (f2_ employees salaries))

(defun f1_mul (pairs r)
  (mapcar #'list
          (mapcar #'car pairs)
          (mapcar #'(lambda (x) (* x r))
                  (mapcar #'cadr pairs))))

(defun f2_mul (pairs r)
  (mapcar #'cons
          (mapcar #'car pairs)
          (mapcar #'(lambda (x) (* x r))
                  (mapcar #'cdr pairs))))

(f1_mul (f1_ employees salaries) 2)
(f2_mul (f2_ employees salaries) 2)

