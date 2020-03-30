;;; через функционалы
(defun cart-product (l1 l2)
  (mapcan #'(lambda (e1)
              (mapcar #'(lambda (e2) (list e1 e2))
                      l2))
          l1))

;;; рекурсивно
(defun help1 (e1 l2)
  (cond ((null l2) nil)
        (t (cons (list e1 (car l2))
                 (help1 e1 (cdr l2))))))

(defun cart-product (l1 l2)
  (cond ((null l1) nil)
        (t (nconc (help1 (car l1) l2)
                  (cart-product (cdr l1) l2)))))

;;; тестирование
(cart-product nil '(3 4)) ; NIL
(cart-product '(1 2) nil) ; NIL
(cart-product '(buy sell) '(car cycle)) ; ((BUY CAR) (BUY CYCLE) (SELL CAR) (SELL CYCLE))

