;;; через функционалы
;; способ #1
(defun set-equal (l1 l2)
  (and (= (length l1) (length l2))
       (every #'(lambda (e1)
                  (some #'(lambda (e2) (equal e1 e2))
                        l2))
              l1)))

;; способ #2
(defun set-equal (l1 l2)
  (and (= (length l1) (length l2))
       (reduce #'(lambda (val1 val2) (and val1 val2))
               (mapcar #'(lambda (e1)
                           (reduce #'(lambda (val1 val2) (or val1 val2))
                                   (mapcar #'(lambda (e2)
                                               (equal e1 e2))
                                           l2)))
                       l1))))

;;; рекурсивно
(defun help1 (e1 l2)
  (cond ((null l2) nil)
        (t (or (equal e1 (car l2))
               (help1 e1 (cdr l2))))))

(defun help2 (l1 l2)
  (cond ((null l1) t)
        (t (and (help1 (car l1) l2)
                (help2 (cdr l1) l2)))))

(defun set-equal (l1 l2)
  (and (= (length l1) (length l2))
       (help2 l1 l2)))

;;; тестирование
(set-equal '(1 2 3) '(1 3 2))
(set-equal '(1 2 3) '(1 5 2 3))
(set-equal '(1 5 2 3) '(1 2 3))

